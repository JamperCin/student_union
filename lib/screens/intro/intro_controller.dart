import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core/model/local/intro_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/screens/auth/login/login_screen.dart';


class IntroController extends BaseController {
  final pageIndex = 0.obs;
  final lastPage = false.obs;

  final introData = [
    const IntroModel(
      mainText: 'Connect, Access and Get Informed',
      subText:
          'Stay connected with the vibrant community of students across Ghana. Access resources, updates, and initiatives designed to empower students nationwide.',
      assetName: intro2,
    ),
    const IntroModel(
      assetName: intro1,
      mainText: 'Support Through Giving',
      subText: ' Make a difference by contributing to our projects. Easily donate through the app and help us build a stronger future for students.',
    ),
    const IntroModel(
      mainText: 'Spreading Faith and Hope',
      subText:
          ' Join us in sharing the message of God. Access inspirational content and become part of a mission to uplift and encourage others.',
      assetName: intro3,
    ),
    const IntroModel(
      mainText: 'Start Your Day with Devotion',
      subText:
      'Begin each day with guided devotions and scripture reflections to keep you spiritually grounded and motivated.',
      assetName: intro4,
    ),
  ];

  void onPageChanged(int newIndex) {
    pageIndex.value = newIndex;
    lastPage.value = newIndex == introData.length - 1;
  }

  void onGoToNext(PageController pageController) {
    if (lastPage.value) {
      onSkipOnClick();
      return;
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
  }

  void onGoToPrevious(PageController pageController) {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
  }

  void onSkipOnClick() {
    navUtils.fireTargetOff(LoginScreen());
    appPreference.setBool(appPreference.IS_INTRO_SHOWN, true);
  }
}
