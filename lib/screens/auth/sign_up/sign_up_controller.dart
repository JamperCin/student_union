import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/text_controller_ext.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/screens/auth/login/login_screen.dart';
import 'package:student_union/screens/dashboard/main_dashboard_screen.dart';

class SignUpController extends BaseController {
  RxString profilePic =
      "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
          .obs;

  TextEditingController emailTxtCtrl = TextEditingController();
  TextEditingController fullNameCtrl = TextEditingController();
  TextEditingController passwordTxtCtrl = TextEditingController();
  bool isTermsAndCondChecked = false;

  ///Go to the Login Screen
  void onSignInOnClick() {
    navUtils.fireTarget(LoginScreen());
  }

  ///Go to the Login Screen
  // void onContinueToProfileOnClick() {
  //   //Get.to(() => SignUpProfileScreen());
  //  // navUtils.fireTarget(SignUpProfileScreen());
  // }

  void onTermsAndCondOnClick(bool isChecked) {
    isTermsAndCondChecked = isChecked;
  }

  ///OnClick listener to the sigUn Button
  Future<void> onSignUpOnClick(BuildContext context) async {
    if (validationUtils.validateDataEntry(fullNameCtrl,
            err: 'Full name required') &&
        validationUtils.validateEntryEmail(emailTxtCtrl) &&
        validationUtils.validateDataEntry(passwordTxtCtrl, err: 'Password required')) {
      if (!isTermsAndCondChecked) {
        snackBarSnippet.snackBarError("Please accept the Terms and Conditions");
        return;
      }
      _initSignUpRequest(context);
    }
  }

  ///Initialise the Sign Up request to the Api
  Future<void> _initSignUpRequest(BuildContext context) async {
    HashMap<String, Object> params = HashMap();
    params.putIfAbsent("email", () => emailTxtCtrl.getData().toLowerCase());
    params.putIfAbsent("password", () => passwordTxtCtrl.getData());
    params.putIfAbsent("name", () => fullNameCtrl.getData());

    const LoaderWidget().showProgressIndicator(context: context);
    final response = await authApiService.signUp(params);
    const LoaderWidget().hideProgress();

    debugPrint("Response: ${response?.toJson().toString()}");

    if (response != null && response.token != null) {
      appPreference.setToken(response.token!);
      appPreference.setUser(response.user);
      navUtils.fireTargetOff(MainDashboardScreen());
    }else{
      snackBarSnippet.snackBarError(response?.errors?.first ?? "Sorry, something went wrong. Kindly try again");
    }
  }

  void onPickProfilePic() {}

  void onCompleteProfileOnClick() {
    //Get.to(() => OtpVerificationScreen());
    // navUtils.fireTarget(OtpVerificationScreen());
  }
}

