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
      asset: icDevotion,
      text: 'Home',
      isSelected: true,
      key: GlobalKey<AnimatorWidgetState>(),
    ),
    BottomBarModel(
      asset: icAddDevotion,
      text: 'Devotion',
      key: GlobalKey<AnimatorWidgetState>(),
    ),
    BottomBarModel(
      asset: icDonate,
      text: 'Donate',
      key: GlobalKey<AnimatorWidgetState>(),
    ),
    BottomBarModel(
      asset: icNews,
      text: "News",
      key: GlobalKey<AnimatorWidgetState>(),
    ),
    BottomBarModel(
      asset: icProfile,
      text: "Profile",
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
