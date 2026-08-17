import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:student_union/core/config/store_config.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';

class RevenueCatPurchaseResult {
  final bool success;
  final bool cancelled;
  final String message;
  final String productId;
  final CustomerInfo? customerInfo;

  const RevenueCatPurchaseResult({
    required this.success,
    required this.cancelled,
    required this.message,
    required this.productId,
    this.customerInfo,
  });
}

class RevenueCatService {
  static RevenueCatService? _instance;
  bool _configured = false;
  bool _customerInfoListenerAttached = false;
  CustomerInfo? _customerInfo;

  RevenueCatService._();

  factory RevenueCatService() {
    return _instance ??= RevenueCatService._();
  }

  String get _publicApiKey => StoreConfig.rcPublicApiKey;

  String get _productPrefix => StoreConfig.productPrefix;
  String get _offeringId => StoreConfig.devotionalOfferingId;

  CustomerInfo? get customerInfo => _customerInfo;

  bool get _supportsPurchases => !kIsWeb && Platform.isIOS;

  String? _normalizedUserId(String? value) {
    final normalized = value?.trim().toLowerCase() ?? '';
    return normalized.isEmpty ? null : normalized;
  }

  bool _isDailyGuideBook(DevotionalBookModel book) {
    if (book.id == StoreConfig.dailyGuideBookId) return true;
    final typeName = (book.devotionalType?.name ?? '').toLowerCase();
    return typeName.contains('guide');
  }

  bool _isDailyPowerBook(DevotionalBookModel book) {
    if (book.id == StoreConfig.dailyPowerBookId) return true;
    final typeName = (book.devotionalType?.name ?? '').toLowerCase();
    return typeName.contains('power');
  }

  Future<void> initialize({String? appUserId}) async {
    if (!_supportsPurchases || _publicApiKey.isEmpty) return;
    debugPrint('RevenueCat mode: ${StoreConfig.activeStoreLabel}');

    final normalizedUserId = _normalizedUserId(appUserId);

    final configured = await Purchases.isConfigured;
    if (!configured) {
      final config = PurchasesConfiguration(_publicApiKey);
      if (normalizedUserId != null) {
        config.appUserID = normalizedUserId;
      }
      await Purchases.setLogLevel(kDebugMode ? LogLevel.debug : LogLevel.info);
      await Purchases.configure(config);
    } else if (normalizedUserId != null) {
      await Purchases.logIn(normalizedUserId);
    }

    _attachCustomerInfoListener();
    _configured = true;
    _customerInfo = await Purchases.getCustomerInfo();
  }

  void _attachCustomerInfoListener() {
    if (_customerInfoListenerAttached) return;
    Purchases.addCustomerInfoUpdateListener((updatedCustomerInfo) {
      _customerInfo = updatedCustomerInfo;
    });
    _customerInfoListenerAttached = true;
  }

  Future<bool> _ensureInitialized() async {
    if (!_supportsPurchases || _publicApiKey.isEmpty) return false;
    if (!_configured || !(await Purchases.isConfigured)) {
      await initialize();
    }
    return _configured;
  }

  Future<void> identifyUser(String userId) async {
    if (_normalizedUserId(userId) == null) return;
    await initialize(appUserId: userId);
  }

  Future<void> clearUserIdentity() async {
    if (!_supportsPurchases || !_configured) return;
    try {
      _customerInfo = await Purchases.logOut();
    } catch (e) {
      debugPrint('RevenueCat logOut failed: $e');
    }
  }

  Future<CustomerInfo?> refreshCustomerInfo() async {
    if (!await _ensureInitialized()) return _customerInfo;
    try {
      _customerInfo = await Purchases.getCustomerInfo();
    } catch (e) {
      debugPrint('RevenueCat getCustomerInfo failed: $e');
    }
    return _customerInfo;
  }

  bool hasPurchasedBook(DevotionalBookModel book, {CustomerInfo? info}) {
    if (book.purchased == false) return false;
    final src = info ?? _customerInfo;
    final productId = productIdForBook(book);
    final entitlementId = entitlementIdForBook(book);
    final hasEntitlement =
        entitlementId.isNotEmpty &&
        (src?.entitlements.active[entitlementId]?.isActive ?? false);
    final hasProduct =
        src?.allPurchasedProductIdentifiers.contains(productId) ?? false;
    return hasEntitlement || hasProduct;
  }

  Future<bool> ownsBook(DevotionalBookModel book) async {
    final info = await refreshCustomerInfo();
    debugPrint(
      "INFO ${info.toString()} \n---> ${book.purchased} \n ===> ${book.thumbnail}",
    );
    return hasPurchasedBook(book, info: info);
  }

  Future<RevenueCatPurchaseResult> restorePurchases() async {
    if (!await _ensureInitialized()) {
      return const RevenueCatPurchaseResult(
        success: false,
        cancelled: false,
        message: 'RevenueCat SDK is not configured.',
        productId: '',
      );
    }

    try {
      final info = await Purchases.restorePurchases();
      _customerInfo = info;
      return RevenueCatPurchaseResult(
        success: true,
        cancelled: false,
        message: 'Purchases restored successfully.',
        productId: '',
        customerInfo: info,
      );
    } on PlatformException catch (e) {
      return RevenueCatPurchaseResult(
        success: false,
        cancelled: false,
        message: e.message ?? 'Failed to restore purchases.',
        productId: '',
      );
    } catch (e) {
      return RevenueCatPurchaseResult(
        success: false,
        cancelled: false,
        message: 'Failed to restore purchases: $e',
        productId: '',
      );
    }
  }

  String productIdForBook(DevotionalBookModel book) {
    if (_isDailyGuideBook(book)) {
      return StoreConfig.dailyGuideProductId;
    }
    if (_isDailyPowerBook(book)) {
      return StoreConfig.dailyPowerProductId;
    }

    final uniqueSuffix = book.id > 0
        ? book.id.toString()
        : book.year.toString();
    return '$_productPrefix$uniqueSuffix';
  }

  String entitlementIdForBook(DevotionalBookModel book) {
    if (_isDailyGuideBook(book)) {
      return StoreConfig.dailyGuideEntitlement;
    }
    if (_isDailyPowerBook(book)) {
      return StoreConfig.dailyPowerEntitlement;
    }
    return '';
  }

  String _packageIdForBook(DevotionalBookModel book) {
    if (_isDailyGuideBook(book)) {
      return StoreConfig.dailyGuidePackage;
    }
    if (_isDailyPowerBook(book)) {
      return StoreConfig.dailyPowerPackage;
    }
    return '';
  }

  Future<RevenueCatPurchaseResult> _purchaseByProductId(
    DevotionalBookModel book,
  ) async {
    final productId = productIdForBook(book);
    final products = await Purchases.getProducts([
      productId,
    ], productCategory: ProductCategory.nonSubscription);

    if (products.isEmpty) {
      return RevenueCatPurchaseResult(
        success: false,
        cancelled: false,
        message:
            'Product "$productId" was not found in App Store Connect/RevenueCat.',
        productId: productId,
      );
    }

    final result = await Purchases.purchase(
      PurchaseParams.storeProduct(products.first),
    );
    _customerInfo = result.customerInfo;
    return RevenueCatPurchaseResult(
      success: true,
      cancelled: false,
      message: 'Purchase completed successfully.',
      productId: productId,
      customerInfo: result.customerInfo,
    );
  }

  Future<RevenueCatPurchaseResult> purchaseDevotionalBook(
    DevotionalBookModel book,
  ) async {
    if (!_supportsPurchases) {
      return const RevenueCatPurchaseResult(
        success: false,
        cancelled: false,
        message: 'Apple In-App Purchase is only supported on iOS.',
        productId: '',
      );
    }

    if (!await _ensureInitialized()) {
      return const RevenueCatPurchaseResult(
        success: false,
        cancelled: false,
        message:
            'RevenueCat purchase is not configured. Please set RC_USE_TEST_STORE and RevenueCat public keys in build settings.',
        productId: '',
      );
    }

    try {
      final packageId = _packageIdForBook(book);
      Offerings? offerings;
      try {
        offerings = await Purchases.getOfferings();
      } on PlatformException catch (e) {
        debugPrint('RevenueCat offerings unavailable, fallback to product: $e');
      } catch (e) {
        debugPrint('RevenueCat offerings unavailable, fallback to product: $e');
      }

      final offering = offerings == null
          ? null
          : offerings.getOffering(_offeringId) ?? offerings.current;
      final package = (offering != null && packageId.isNotEmpty)
          ? offering.getPackage(packageId)
          : null;

      if (package == null) {
        return await _purchaseByProductId(book);
      }

      final result = await Purchases.purchase(PurchaseParams.package(package));
      _customerInfo = result.customerInfo;
      return RevenueCatPurchaseResult(
        success: true,
        cancelled: false,
        message: 'Purchase completed successfully.',
        productId: package.storeProduct.identifier,
        customerInfo: result.customerInfo,
      );
    } on PlatformException catch (e) {
      final code = PurchasesErrorHelper.getErrorCode(e);
      if (code == PurchasesErrorCode.purchaseCancelledError) {
        return const RevenueCatPurchaseResult(
          success: false,
          cancelled: true,
          message: 'Purchase cancelled.',
          productId: '',
        );
      }

      debugPrint('RevenueCat purchase failed: ${e.message}');

      return RevenueCatPurchaseResult(
        success: false,
        cancelled: false,
        message: e.message ?? 'Purchase failed. Please try again.',
        productId: '',
      );
    } catch (e) {
     debugPrint('RevenueCat purchase failed --->: $e');
      return RevenueCatPurchaseResult(
        success: false,
        cancelled: false,
        message: 'Purchase failed: $e',
        productId: '',
      );
    }
  }
}
