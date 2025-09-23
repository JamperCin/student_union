import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core_module.dart';
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
    return false;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        TopHeaderWidget(
          // onSearchOnClick: _controller.onSearchOnClick,
          onNotifyOnClick: _controller.onNotificationOnClick,
          onProfileOnClick: _controller.onProfileOnClick,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(appDimen.dimen(10)),
            height: appDimen.screenHeight,
            width: appDimen.screenWidth,
            color: colorScheme.surface,
            child: _homeBody(context),
          ),
        ),
      ],
    );
  }

  Widget _homeBody(BuildContext context) {
    return ListView(
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
          onSeeAllOnTap: _controller.onSeeAllUpcomingEvents,
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
