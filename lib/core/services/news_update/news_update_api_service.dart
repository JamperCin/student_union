import 'dart:collection';
import 'dart:convert';

import 'package:core_module/core/services/base_api_service.dart';
import 'package:student_union/core/model/remote/news_update_model.dart';
import 'package:student_union/core/services/news_update/news_update_api_interface.dart';

class NewsUpdateApiService extends BaseApiService
    implements NewsUpdateApiInterface {
  static NewsUpdateApiService? _instance;
  final Map<String, List<NewsUpdateModel>> _cache = {};

  NewsUpdateApiService._();

  factory NewsUpdateApiService() {
    return _instance ??= NewsUpdateApiService._();
  }

  @override
  Future<List<NewsUpdateModel>> fetchNewsUpdate({
    Map<String, Object>? param,
    bool forceRefresh = false,
  }) async {
    final cacheKey = _cacheKey(param);
    if (!forceRefresh && _cache.containsKey(cacheKey)) {
      return _cache[cacheKey]!;
    }

    final results =
        await _instance?.getListRequest<NewsUpdateModel>(
          api: 'customer/v1/news',
          key: 'news',
          param: param,
          parser: (json) => NewsUpdateModel.fromJson(json),
        ) ??
        [];

    // final results = await FileUtils().fetchList<NewsUpdateModel>(
    //   path: 'assets/data/news_updates.json',
    //   key: 'data',
    //   secondaryKey: 'news',
    //   parser: (json) => NewsUpdateModel.fromJson(json),
    // );

    _cache[cacheKey] = results;
    return results;
  }

  @override
  Future<NewsUpdateModel> fetchNewsDetails(String id) async {
    final result =
        await _instance?.getRequest<NewsUpdateModel>(
          api: 'customer/v1/news/$id',
          parser: (json) => NewsUpdateModel.fromJson(json),
        ) ??
        const NewsUpdateModel();

    return result;
  }

  bool hasCachedNews({Map<String, Object>? param}) {
    return _cache.containsKey(_cacheKey(param));
  }

  List<NewsUpdateModel> getCachedNews({Map<String, Object>? param}) {
    return _cache[_cacheKey(param)] ?? const [];
  }

  String _cacheKey(Map<String, Object>? param) {
    if (param == null || param.isEmpty) return '__default__';
    final normalized = SplayTreeMap<String, String>.from(
      param.map((key, value) => MapEntry(key, value.toString())),
    );
    return jsonEncode(normalized);
  }

  void clearCache() {
    _cache.clear();
  }
}
