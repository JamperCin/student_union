import 'package:student_union/core/model/remote/upcoming_event_model.dart';

abstract class UpcomingEventsApiInterface{
  Future<List<UpcomingEventModel>> fetchUpcomingEvents();

}