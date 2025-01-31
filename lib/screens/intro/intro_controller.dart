import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/model/local/intro_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/screens/auth/login/login_screen.dart';


class IntroController extends BaseController {
  final pageIndex = 0.obs;
  final lastPage = false.obs;

  final introData = [
    const IntroModel(
      mainText: 'Daily Quiet Time',
      subText:
          'Make time with God daily by using one \nof the devotional guides to help you \nread the Bible, Pray, and Make notes.',
      assetName: intro2,
    ),
    const IntroModel(
      assetName: intro1,
      mainText: 'Donate To SU GHANA',
      subText: 'Come on board to support SU Ghana \nMinistry as we disciple and nurture children, \nyouth and families.',
    ),
    const IntroModel(
      mainText: 'Community Updates & News',
      subText: 'Join the SU community globally, receive \nupdates on the SU Ghana Ministry, and \nengage with fellow SU members.',
      assetName: intro3,
    ),
    // const IntroModel(
    //   mainText: 'Start Your Day with Devotion',
    //   subText:
    //   'Begin each day with guided devotions and scripture reflections to keep you spiritually grounded and motivated.',
    //   assetName: intro4,
    // ),
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
