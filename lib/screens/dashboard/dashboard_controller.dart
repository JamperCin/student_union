import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:student_union/core-ui/snippets/speech_to_voice/text_to_speech_Api.dart';
import 'package:student_union/core/api/fcm_api.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/core/services/app/app_update_service.dart';
import 'package:student_union/screens/auth/login/login_screen.dart';
import 'package:student_union/screens/dashboard/more/app_update/app_update_screen.dart';

class DashboardController extends BaseController with WidgetsBindingObserver {
  ///Initialise this when the main dashboard is called
  Future<void> initData() async {
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

    if (newBuildNumber > buildNumber &&
        Get.context != null &&
        Get.context!.mounted) {
      if (isMayBeLaterSet) {
        isMayBeLaterSet = false;
        return;
      }
      navUtils.fireTargetOff(AppUpdateScreen(), model: appUpdate);
    }
  }

  Future<void> checkForScreenUpdate() async {
    final event = currentEvent.value;
    if (event is EventTrigger) {
      await Future.delayed(const Duration(milliseconds: 180));
      onBottomMenuOnClick(BottomBarModel(text: event.screen));
    }
  }

  ///List of menu for the bottom navigation bar
  RxList<BottomBarModel> bottomBarMenuList = [
    BottomBarModel(
      asset: icHomeIcon,
      text: 'Home',
      isSelected: true,
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
  ].obs;

  void onBottomMenuOnClick(BottomBarModel model) {
    var mod = bottomBarMenuList.firstWhere((e) => e.isSelected == true);
    if (mod == model) return;

    bottomBarMenuList.value = bottomBarMenuList
        .map((e) => e.copyWith(isSelected: e.text == model.text))
        .toList();

    mod = bottomBarMenuList.firstWhere((e) => e.isSelected == true);
    mod.key?.currentState?.forward();
  }

  Future<void> fetchUserDetails() async {
    final user = await userApiService.fetchUserDetails();

    if (user.status == "401" && Get.context != null && Get.context!.mounted) {
      snackBarSnippet.showCountdownSnackBar(
        Get.context!,
        message: "Session Timeout!. Kindly login again.",
        actionIcon: Icons.timer_off_outlined,
        showCloseIcon: false,
        onProgressCompletion: () async {
          await Future.delayed(const Duration(seconds: 1));
          navUtils.fireTargetOff(LoginScreen());
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
