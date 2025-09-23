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
  Future<List<UpcomingEventModel>> fetchUpcomingEvents(
      {Map<String, dynamic>? param}) async {
    // await Future.delayed(const Duration(seconds: 2));
    // final results = await FileUtils().fetchList<UpcomingEventModel>(
    //   path: path,
    //   key: 'data',
    //   secondaryKey: 'events',
    //   parser: (json) => UpcomingEventModel.fromJson(json),
    // );

    final results = await _instance?.getListRequest<UpcomingEventModel>(
            api: 'customer/v1/events',
            key: "events",
            param: param,
            parser: (json) {
              return UpcomingEventModel.fromJson(json);
            }) ??
        [];

    return results;
  }
}
