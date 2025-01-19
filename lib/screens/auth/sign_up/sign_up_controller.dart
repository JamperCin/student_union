import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/screens/auth/login/login_screen.dart';
import 'package:student_union/screens/dashboard/main_dashboard_screen.dart';

class SignUpController extends BaseController {
  RxString profilePic =
      "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
          .obs;

  TextEditingController dayCtrl = TextEditingController();
  TextEditingController monthCtrl = TextEditingController();

  ///Go to the Login Screen
  void onSignInOnClick() {
    // Get.to(() => LoginScreen());
    navUtils.fireTarget(LoginScreen());
  }

  ///Go to the Login Screen
  void onContinueToProfileOnClick() {
    //Get.to(() => SignUpProfileScreen());
   // navUtils.fireTarget(SignUpProfileScreen());
  }

  void onTermsAndCondOnClick(bool isChecked) {}

  Future<void> onSignUpOnClick(BuildContext context) async {
    const LoaderWidget().showProgressIndicator(context: context);
    //TODO final response = await authService.login(params);
    await Future.delayed(const Duration(seconds: 2));
    const LoaderWidget().hideProgress();

    navUtils.fireTarget(MainDashboardScreen());
  }

  void onPickProfilePic() {}

  void onCompleteProfileOnClick() {
    //Get.to(() => OtpVerificationScreen());
   // navUtils.fireTarget(OtpVerificationScreen());
  }
}
