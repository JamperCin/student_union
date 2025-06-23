import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/model/local/bottom_bar_model.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/bottom_app_bar_widget.dart';
import 'package:core_module/core_ui/widgets/card_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_union/screens/dashboard/dashboard_controller.dart';
import 'package:student_union/screens/dashboard/devotion/ui/devotion_screen.dart';
import 'package:student_union/screens/dashboard/donate/ui/donations_core_ministries_screen.dart';
import 'package:student_union/screens/dashboard/home/home_screen.dart';
import 'package:student_union/screens/dashboard/more/more_screen.dart';
import 'package:student_union/screens/dashboard/news/ui/news_screen.dart';

class MainDashboardScreen extends BaseScreenStandard {
  final _controller = Get.put(DashboardController());

  MainDashboardScreen() {
    _controller.initData();
  }

  @override
  bool safeArea() {
    return false;
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() {
      BottomBarModel model =
          _controller.bottomBarMenuList.firstWhere((e) => e.isSelected == true);

      switch (model.text) {
        case "Devotional":
          return DevotionsScreen();
        case "Donation":
          return DonationCoreMinistriesScreen();
        case "News Update":
          return NewsScreen();
        case "More":
          return MoreScreen();
        default:
          return HomeScreen();
      }
    });
  }

  @override
  Widget bottomNavigationBar(BuildContext context) {
    return CardContainerWidget(
      color: colorScheme.onSecondary,
      padding: EdgeInsets.only(
        bottom: appDimen.dimen(20),
        top: appDimen.dimen(8),
        right: appDimen.dimen(5),
        left: appDimen.dimen(5),
      ),
      margin: EdgeInsets.zero,
      elevation: 5,
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ..._controller.bottomBarMenuList.value.map((model) {
                  return BottomAppBarWidget(
                    activeColor: colorScheme.secondary,
                    inActiveColor: colorScheme.primary,
                    model: model,
                    style: textTheme.labelMedium?.copyWith(fontSize: appDimen.dimen(10)),
                    onTap: () {
                      _controller.onBottomMenuOnClick(model);
                    },
                  );
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
