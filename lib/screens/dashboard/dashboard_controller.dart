import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/bottom_bar_model.dart';
import 'package:core_module/core_module.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/snippets/speech_to_voice/text_to_speech_Api.dart';
import 'package:student_union/core/api/fcm_api.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/res/asset_path.dart';

class DashboardController extends BaseController with WidgetsBindingObserver {
  ///Initialise this when the main dashboard is called
  Future<void> initData() async {
    await Future.delayed(const Duration(milliseconds: 180));
    await fetchUserDetails();
    await checkForScreenUpdate();
    await FcmApi().init();
  }

  Future<void> checkForScreenUpdate() async {
    final event = Get.arguments;
    if (event is EventTrigger) {
      await Future.delayed(const Duration(milliseconds: 180));
      onBottomMenuOnClick(BottomBarModel(text: event.screen));
    }
  }

  Future<void> requestFcmToken() async{
    final fcm = FirebaseMessaging.instance;
    // Request permission (for iOS especially)
    await fcm.requestPermission();

    final token = await fcm.getToken();

    final param = {
      'user': {
        "fcm_id": token,
      }
    };

    await notificationApiService.registerFcmToken(param);
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

    final mod = bottomBarMenuList.firstWhere((e) => e.isSelected == true);
    mod.key?.currentState?.forward();
  }

  Future<void> fetchUserDetails() async {
    final user = await userApiService.fetchUserDetails();
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
