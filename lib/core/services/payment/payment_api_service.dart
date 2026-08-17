import 'dart:collection';
import 'dart:convert';

import 'package:core_module/core/services/base_api_service.dart';
import 'package:student_union/core/model/remote/payment_model.dart';
import 'package:student_union/core/services/payment/payment_api_interface.dart';

class PaymentApiService extends BaseApiService implements PaymentApiInterface {
  static PaymentApiService? _instance;
  final Map<String, List<PaymentModel>> _historyCache = {};

  PaymentApiService._internal();

  factory PaymentApiService() {
    return _instance ??= PaymentApiService._internal();
  }

  @override
  Future<List<PaymentModel>> fetchPaymentHistory({
    Map<String, dynamic>? param,
    bool forceRefresh = false,
  }) async {
    final cacheKey = _cacheKey(param);
    if (!forceRefresh && _historyCache.containsKey(cacheKey)) {
      return _historyCache[cacheKey]!;
    }

    final results =
        await _instance?.getListRequest<PaymentModel>(
          api: "customer/v1/payments?",
          key: "payments",
          param: param,
          parser: (json) => PaymentModel.fromJson(json),
        ) ??
        [];

    _historyCache[cacheKey] = results;
    return results;
  }

  @override
  Future<PaymentModel> makePaymentOfBook(Map<String, dynamic> param) async {
    final results =
        await _instance?.postRequest<PaymentModel>(
          api: "customer/v1/payments",
          param: param,
          showToast: true,
          parser: (json) => PaymentModel.fromJson(json),
        ) ??
        const PaymentModel();

    return results;
  }

  @override
  Future<PaymentModel> makePaymentOfCampaign(Map<String, dynamic> param) async {
    final results =
        await _instance?.postRequest<PaymentModel>(
          api: "customer/v1/payments",
          parser: (json) => PaymentModel.fromJson(json),
        ) ??
        const PaymentModel();

    return results;
  }

  bool hasCachedPaymentHistory({Map<String, dynamic>? param}) {
    return _historyCache.containsKey(_cacheKey(param));
  }

  List<PaymentModel> getCachedPaymentHistory({Map<String, dynamic>? param}) {
    return _historyCache[_cacheKey(param)] ?? const [];
  }

  String _cacheKey(Map<String, dynamic>? param) {
    if (param == null || param.isEmpty) return '__default__';
    final normalized = SplayTreeMap<String, dynamic>.from(
      param.map((key, value) => MapEntry(key, value?.toString() ?? '')),
    );
    return jsonEncode(normalized);
  }

  void clearCache() {
    _historyCache.clear();
  }

  PaymentModel _parsePayment(Map<String, dynamic> json) {
    final parsed = PaymentModel.fromJson(json);
    if (parsed.authUrl.isNotEmpty) return parsed;

    final extracted = _extractAuthorizationUrl(json);
    if (extracted.isEmpty) return parsed;
    return parsed.copyWith(authUrl: extracted);
  }

  String _extractAuthorizationUrl(Map<String, dynamic> json) {
    final direct = _asString(json['authorization_url']);
    if (direct.isNotEmpty) return direct;

    dynamic metadata = json['metadata'];
    if (metadata is String && metadata.trim().isNotEmpty) {
      try {
        metadata = jsonDecode(metadata);
      } catch (_) {
        metadata = null;
      }
    }

    final metaMap = _asMap(metadata);
    if (metaMap == null) return '';

    final initResponse =
        _asMap(metaMap['init_response']) ??
        _asMap(metaMap['paystack_init']) ??
        _asMap(metaMap['paystackInit']);

    final dataMap = _asMap(initResponse?['data']);
    if (dataMap == null) return '';

    return _asString(dataMap['authorization_url']).isNotEmpty
        ? _asString(dataMap['authorization_url'])
        : _asString(dataMap['authorizationUrl']);
  }

  Map<String, dynamic>? _asMap(dynamic value) {
    if (value is Map<String, dynamic>) return value;
    if (value is Map) {
      return Map<String, dynamic>.from(value);
    }
    return null;
  }

  String _asString(dynamic value) {
    if (value == null) return '';
    final result = value.toString().trim();
    if (result.toLowerCase() == 'null') return '';
    return result;
  }
}
