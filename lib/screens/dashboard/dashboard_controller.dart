import 'dart:async';

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:student_union/core-ui/snippets/speech_to_voice/text_to_speech_Api.dart';
import 'package:student_union/core/api/fcm_api.dart';
import 'package:student_union/core/app/app_routes.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/core/services/app/app_update_service.dart';
import 'package:student_union/screens/dashboard/devotion/controller/devotion_controller.dart';
import 'package:student_union/screens/dashboard/donate/controller/donations_controller.dart';
import 'package:student_union/screens/dashboard/home/home_controller.dart';
import 'package:student_union/screens/dashboard/news/controller/news_controller.dart';

class DashboardController extends BaseController with WidgetsBindingObserver {
  bool _hasInitialized = false;

  ///Initialise this when the main dashboard is called
  Future<void> initData() async {
    if (_hasInitialized) return;
    _hasInitialized = true;

    await Future.delayed(const Duration(milliseconds: 180));
    await fetchUserDetails();
    await checkForScreenUpdate();
    await checkForAppUpdate();
    await FcmApi().init();
  }

  //Check if there is a new app update available
  Future<void> checkForAppUpdate() async {
    final appUpdate = await AppUpdateService().checkForUpdate();
    if (appUpdate.versionCode.isEmpty) {
      return;
    }
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    int newBuildNumber = NumberUtils().parseInt(appUpdate.versionCode);
    int buildNumber = NumberUtils().parseInt(packageInfo.buildNumber);
    debugPrint(
      "Current Build Number: $buildNumber, New Build Number: $newBuildNumber",
    );

    final context = AppRouter.rootNavigatorKey.currentContext;
    if (newBuildNumber > buildNumber && context != null && context.mounted) {
      if (isMayBeLaterSet) {
        isMayBeLaterSet = false;
        return;
      }
      AppRouter.goNamed(AppRouteNames.appUpdate, extra: appUpdate);
    }
  }

  Future<void> checkForScreenUpdate() async {
    final event = currentEvent.value;
    if (event is EventTrigger) {
      await Future.delayed(const Duration(milliseconds: 180));
      final index = _tabIndexFromLabel(event.screen);
      AppRouter.goToTabByLabel(event.screen);
      onTabOpened(index);
    }
  }

  ///List of menu for the bottom navigation bar
  final List<BottomBarModel> bottomBarMenuList = [
    BottomBarModel(
      asset: icHomeIcon,
      text: 'Home',
      iconSize: 22.dp(),
      key: GlobalKey<AnimatorWidgetState>(),
    ),
    BottomBarModel(
      asset: icDevotion,
      text: 'Devotional',
      iconSize: 22.dp(),
      key: GlobalKey<AnimatorWidgetState>(),
    ),
    BottomBarModel(
      asset: icDonate,
      text: 'Donation',
      iconSize: 22.dp(),
      key: GlobalKey<AnimatorWidgetState>(),
    ),
    BottomBarModel(
      asset: icNews,
      text: "News Update",
      iconSize: 22.dp(),
      key: GlobalKey<AnimatorWidgetState>(),
    ),
    BottomBarModel(
      asset: icMenu,
      text: "More",
      iconSize: 22.dp(),
      key: GlobalKey<AnimatorWidgetState>(),
    ),
  ];

  void onBottomMenuOnClick(int index) {
    bottomBarMenuList[index].key?.currentState?.forward();
    onTabOpened(index);
  }

  void onTabOpened(int index) {
    switch (index) {
      case 0:
        if (Get.isRegistered<HomeController>()) {
          unawaited(Get.find<HomeController>().onTabOpened());
        }
        break;
      case 1:
        if (Get.isRegistered<DevotionController>()) {
          unawaited(Get.find<DevotionController>().onTabOpened());
        }
        break;
      case 2:
        if (Get.isRegistered<DonationsController>()) {
          unawaited(Get.find<DonationsController>().onTabOpened());
        }
        break;
      case 3:
        if (Get.isRegistered<NewsController>()) {
          unawaited(Get.find<NewsController>().onTabOpened());
        }
        break;
    }
  }

  int _tabIndexFromLabel(String screen) {
    switch (screen.toLowerCase()) {
      case 'devotional':
        return 1;
      case 'donation':
        return 2;
      case 'news update':
      case 'news':
        return 3;
      case 'more':
        return 4;
      default:
        return 0;
    }
  }

  Future<void> fetchUserDetails() async {
    if (isGuestUser.value) return;
    final user = await userApiService.fetchUserDetails();

    final context = AppRouter.rootNavigatorKey.currentContext;
    if (user.status == "401" && context != null && context.mounted) {
      snackBarSnippet.showCountdownSnackBar(
        context,
        message: "Session Timeout!. Kindly login again.",
        actionIcon: Icons.timer_off_outlined,
        showCloseIcon: false,
        onProgressCompletion: () async {
          await Future.delayed(const Duration(seconds: 1));
          appPreference.logOut();
          isGuestUser.value = false;
          AppRouter.goNamed(AppRouteNames.login);
        },
      );

      return;
    }
    appPreference.setUser(user);
    userApiService.profilePic.value = user.profilePic;
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.hidden) {
      TextToSpeechApi().stop();
    }
  }
}
