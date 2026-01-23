import 'package:core_module/core/services/base_api_service.dart';
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
            return UpcomingEventModel.fromJson(json);
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
