import 'dart:collection';
import 'dart:convert';

import 'package:core_module/core_module.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';
import 'package:student_union/core/services/devotional_guide/devotional_guide_api_interface.dart';

class DevotionalGuideApiService extends BaseApiService
    implements DevotionalGuideApiInterface {
  static DevotionalGuideApiService? _instance;
  final Map<String, List<DevotionalBookModel>> _devotionalCache = {};
  final Map<String, List<DevotionalBookModel>> _purchasedCache = {};
  final Map<String, List<DevotionalBookModel>> _dailyCache = {};

  DevotionalGuideApiService._();

  factory DevotionalGuideApiService() {
    return _instance ??= DevotionalGuideApiService._();
  }

  @override
  Future<List<DevotionalBookModel>> fetchDevotionalBooks({
    Map<String, dynamic>? param,
    bool forceRefresh = false,
  }) async {
    final cacheKey = _cacheKey(param);
    if (!forceRefresh && _devotionalCache.containsKey(cacheKey)) {
      return _devotionalCache[cacheKey]!;
    }

    final results =
        await _instance?.getListRequest<DevotionalBookModel>(
          api: "customer/v1/devotion_years",
          key: 'devotion_years',
          param: param,
          parser: (json) {
            DevotionalBookModel dev = DevotionalBookModel.fromJson(json);
            dev = dev.copyWith(heroTag: Uuid().v4());
            return dev;
          },
        ) ??
        [];
    _devotionalCache[cacheKey] = results;
    return results;
  }

  @override
  Future<List<DevotionalBookModel>> fetchPurchasedBooks({
    Map<String, dynamic>? param,
    bool forceRefresh = false,
  }) async {
    final cacheKey = _cacheKey(param);
    if (!forceRefresh && _purchasedCache.containsKey(cacheKey)) {
      return _purchasedCache[cacheKey]!;
    }

    final results =
        await _instance?.getListRequest<DevotionalBookModel>(
          api: "customer/v1/purchased_devotions",
          key: 'purchased_devotion_years',
          param: param,
          parser: (json) {
            DevotionalBookModel dev = DevotionalBookModel.fromJson(json);
            dev = dev.copyWith(heroTag: Uuid().v4());
            return dev;
          },
        ) ??
        [];
    _purchasedCache[cacheKey] = results;
    return results;
  }

  @override
  Future<List<DevotionalBookModel>> fetchDailyDevotion({
    Map<String, dynamic>? param,
    bool forceRefresh = false,
  }) async {
    final cacheKey = _cacheKey(param);
    if (!forceRefresh && _dailyCache.containsKey(cacheKey)) {
      return _dailyCache[cacheKey]!;
    }

    final results =
        await _instance?.getListRequest<DevotionalBookModel>(
          api: "customer/v1/purchased_devotions/today",
          key: 'devotions',
          param: param,
          parser: (json) {
            DevotionalBookModel dev = DevotionalBookModel.fromJson(json);
            dev = dev.copyWith(heroTag: Uuid().v4());
            return dev;
          },
        ) ??
        [];
    _dailyCache[cacheKey] = results;
    return results;
  }

  bool hasCachedDevotionalBooks({Map<String, dynamic>? param}) {
    return _devotionalCache.containsKey(_cacheKey(param));
  }

  bool hasCachedPurchasedBooks({Map<String, dynamic>? param}) {
    return _purchasedCache.containsKey(_cacheKey(param));
  }

  bool hasCachedDailyDevotion({Map<String, dynamic>? param}) {
    return _dailyCache.containsKey(_cacheKey(param));
  }

  List<DevotionalBookModel> getCachedDevotionalBooks({
    Map<String, dynamic>? param,
  }) {
    return _devotionalCache[_cacheKey(param)] ?? const [];
  }

  List<DevotionalBookModel> getCachedPurchasedBooks({
    Map<String, dynamic>? param,
  }) {
    return _purchasedCache[_cacheKey(param)] ?? const [];
  }

  List<DevotionalBookModel> getCachedDailyDevotion({
    Map<String, dynamic>? param,
  }) {
    return _dailyCache[_cacheKey(param)] ?? const [];
  }

  String _cacheKey(Map<String, dynamic>? param) {
    if (param == null || param.isEmpty) return '__default__';
    final normalized = SplayTreeMap<String, dynamic>.from(
      param.map((key, value) => MapEntry(key, value?.toString() ?? '')),
    );
    return jsonEncode(normalized);
  }

  void clearCache() {
    _devotionalCache.clear();
    _purchasedCache.clear();
    _dailyCache.clear();
  }
}
