import 'package:core_module/core/services/base_api_service.dart';
import 'package:core_module/core_module.dart';
import 'package:student_union/core/model/remote/upcoming_event_model.dart';
import 'package:student_union/core/services/upcoming_events/upcoming_events_api_interface.dart';

class UpcomingEventsApiService extends BaseApiService
    implements UpcomingEventsApiInterface {
  static UpcomingEventsApiService? _instance;
  final path = "assets/data/upcoming_events.json";

  UpcomingEventsApiService._();

  factory UpcomingEventsApiService() {
    return _instance ??= UpcomingEventsApiService._();
  }

  @override
  Future<List<UpcomingEventModel>> fetchUpcomingEvents({
    Map<String, dynamic>? param,
  }) async {
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

    return results;
  }
}
