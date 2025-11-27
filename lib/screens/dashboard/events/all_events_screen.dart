import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/widgets/upcoming_events_widget.dart';
import 'package:student_union/screens/dashboard/events/event_details_screen.dart';

class AllEventsScreen extends BaseScreenStandard {
  @override
  bool showAppBar() {
    return true;
  }

  @override
  String appBarTitle() {
    return "All Events";
  }

  @override
  Widget body(BuildContext context) {
    return UpcomingEventsWidget(
      onTap: (event) {
        navUtils.fireTarget(EventDetailsScreen(event));
      },
    );
  }
}
