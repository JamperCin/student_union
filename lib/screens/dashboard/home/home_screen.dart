import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/widgets/core_ministries_widget.dart';
import 'package:student_union/core-ui/widgets/daily_devotion_widget.dart'
    show DailyDevotionWidget;
import 'package:student_union/core-ui/widgets/devotional_guide_widget.dart';
import 'package:student_union/core-ui/widgets/news_update_widget.dart';
import 'package:student_union/core-ui/widgets/payment_history_widget.dart';
import 'package:student_union/core-ui/widgets/top_header_widget.dart';
import 'package:student_union/core-ui/widgets/upcoming_events_widget.dart';
import 'package:student_union/screens/dashboard/home/home_controller.dart';

class HomeScreen extends BaseScreenStandard {
  final _controller = Get.put(HomeController());

  @override
  bool showAppBar() {
    return true;
  }

  @override
  Widget? appBarTitleWidget(BuildContext context) {
    // TODO: implement appBarTitleWidget
    return  TopHeaderWidget(
      // onSearchOnClick: _controller.onSearchOnClick,
      onNotifyOnClick: _controller.onNotificationOnClick,
      onProfileOnClick: _controller.onProfileOnClick,
    );
  }

  @override
  double appBarHeight() {
    return kToolbarHeight + 50.dp();
  }

  @override
  Widget body(BuildContext context) {
    return _homeBody(context);
  }

  Widget _homeBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.dp(), vertical: 16.dp()),
      children: [
        ///Daily Devotional
        DailyDevotionWidget(
          onReadMoreOnTap: _controller.onReadMoreOfDevotionalBook,
        ),

        ///Devotions
        DevotionalGuideWidget.withAvailableBooks(
          onTap: _controller.onDevotionTap,
          onSeeMoreOnTap: _controller.onSeeMoreDevotionalBooks,
        ),

        ///Upcoming Events
        UpcomingEventsWidget(
          onTap: (v) => _controller.onUpcomingEventTap(context, v),
         // onSeeAllOnTap: _controller.onSeeAllUpcomingEvents,
        ),

        ///Core Ministries or Campaigns
        CoreMinistriesWidget(
          onTap: _controller.onDonationOnClick,
          onSeeMore: _controller.onSeeMoreCoreMinistries,
        ),

        ///News Update
        NewsUpdateWidget(
          onTap: _controller.onNewsUpdateTap,
          onMoreOnTap: _controller.onMoreNewsOnClick,
        ),

        ///Donations History
        PaymentHistoryWidget(
          onSeeMoreOnTap: _controller.onSeeMorePaymentHistory,
        ),
      ],
    );
  }
}
