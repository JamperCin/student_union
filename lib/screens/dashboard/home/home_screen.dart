import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:student_union/core-ui/widgets/core_ministries_widget.dart';
import 'package:student_union/core-ui/widgets/daily_devotion_widget.dart'
    show DailyDevotionWidget;
import 'package:student_union/core-ui/widgets/devotional_guide_widget.dart';
import 'package:student_union/core-ui/widgets/news_update_widget.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';
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
          onSearchOnClick: () {},
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
        const DailyDevotionWidget(),
        Gap(10.dp()),
        DevotionalGuideWidget(onTap: _controller.onDevotionTap),
        Gap(10.dp()),
        const UpcomingEventsWidget(),
        Gap(10.dp()),
        CoreMinistriesWidget(onTap: _controller.onDonationOnClick),
        Gap(10.dp()),
        const NewsUpdateWidget(),
      ],
    );
  }
}
