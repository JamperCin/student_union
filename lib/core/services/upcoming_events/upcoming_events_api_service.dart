import 'dart:collection';
import 'dart:convert';

import 'package:core_module/core_module.dart';
import 'package:student_union/core/model/remote/upcoming_event_model.dart';
import 'package:student_union/core/services/upcoming_events/upcoming_events_api_interface.dart';

class UpcomingEventsApiService extends BaseApiService
    implements UpcomingEventsApiInterface {
  static UpcomingEventsApiService? _instance;
  final path = "assets/data/upcoming_events.json";
  final Map<String, List<UpcomingEventModel>> _cache = {};

  UpcomingEventsApiService._();

  factory UpcomingEventsApiService() {
    return _instance ??= UpcomingEventsApiService._();
  }

  @override
  Future<List<UpcomingEventModel>> fetchUpcomingEvents({
    Map<String, dynamic>? param,
    bool forceRefresh = false,
  }) async {
    final cacheKey = _cacheKey(param);
    if (!forceRefresh && _cache.containsKey(cacheKey)) {
      return _cache[cacheKey]!;
    }

    final results =
        await _instance?.getListRequest<UpcomingEventModel>(
          api: 'customer/v1/events',
          key: "events",
          param: param,
          print: false,
          parser: (json) {
            var event = UpcomingEventModel.fromJson(json);
            event = event.copyWith(heroTag: Uuid().v4());
            return event;
          },
        ) ??
        [];

    results.sort((a, b) {
      DateTime dateA = DateTime.parse(a.createdAt);
      DateTime dateB = DateTime.parse(b.createdAt);
      return dateB.compareTo(dateA);
    });

    _cache[cacheKey] = results;
    return results;
  }

  bool hasCachedUpcomingEvents({Map<String, dynamic>? param}) {
    return _cache.containsKey(_cacheKey(param));
  }

  List<UpcomingEventModel> getCachedUpcomingEvents({
    Map<String, dynamic>? param,
  }) {
    return _cache[_cacheKey(param)] ?? const [];
  }

  String _cacheKey(Map<String, dynamic>? param) {
    if (param == null || param.isEmpty) return '__default__';
    final normalized = SplayTreeMap<String, dynamic>.from(
      param.map((key, value) => MapEntry(key, value?.toString() ?? '')),
    );
    return jsonEncode(normalized);
  }

  void clearCache() {
    _cache.clear();
  }
}
