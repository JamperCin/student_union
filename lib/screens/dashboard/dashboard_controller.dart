import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/bottom_bar_model.dart';
import 'package:core_module/core/res/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:get/get.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/res/asset_path.dart';

class DashboardController extends BaseController {
  ///Initialise this when the main dashboard is called
  Future<void> initData() async {
    await Future.delayed(const Duration(milliseconds: 180));
    await userApiService.fetchUserDetails();
  }

  ///List of menu for the bottom navigation bar
  RxList<BottomBarModel> bottomBarMenuList = [
    BottomBarModel(
      asset: icHomeIcon,
      text: 'Home',
      isSelected: true,
      iconSize: 26.dp(),
      key: GlobalKey<AnimatorWidgetState>(),
    ),
    BottomBarModel(
      asset: icDevotion,
      text: 'Devotional',
      iconSize: 26.dp(),
      key: GlobalKey<AnimatorWidgetState>(),
    ),
    BottomBarModel(
      asset: icDonate,
      text: 'Donation',
      iconSize: 26.dp(),
      key: GlobalKey<AnimatorWidgetState>(),
    ),
    BottomBarModel(
      asset: icNews,
      text: "News Update",
      iconSize: 26.dp(),
      key: GlobalKey<AnimatorWidgetState>(),
    ),
    BottomBarModel(
      asset: icMenu,
      text: "More",
      iconSize: 26.dp(),
      key: GlobalKey<AnimatorWidgetState>(),
    ),
  ].obs;

  void onBottomMenuOnClick(BottomBarModel model) {
    bottomBarMenuList.value = bottomBarMenuList.value
        .map((e) => e.copyWith(isSelected: e.text == model.text))
        .toList();

    model.key?.currentState?.forward();
  }
}
