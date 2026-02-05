import 'dart:collection';

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/screen/base_web.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/local/success_model.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/screens/auth/login/login_screen.dart';
import 'package:student_union/screens/shared/success_screen.dart';

class SignUpController extends BaseController {
  RxString profilePic =
      "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
          .obs;

  TextEditingController emailTxtCtrl = TextEditingController();
  TextEditingController fullNameCtrl = TextEditingController();
  TextEditingController passwordTxtCtrl = TextEditingController();
  TextEditingController confirmPasswordTxtCtrl = TextEditingController();
  bool isTermsAndCondChecked = false;

  ///Go to the Login Screen
  void onSignInOnClick() {
    navUtils.fireTarget(LoginScreen());
  }

  //Go to the Login Screen
  void onPrivacyPolicyOnClick() {
    navUtils.fireTarget(
      BaseWebView(
        model: WebModel(
          url: "https://sughana.org/privacy/",
          title: "Privacy Policy",
        ),
      ),
    );
  }

  void onTermsAndCondOnClick(bool isChecked) {
    isTermsAndCondChecked = isChecked;
  }

  ///OnClick listener to the sigUn Button
  Future<void> onSignUpOnClick(BuildContext context) async {
    if (validationUtils.validateDataEntry(
          fullNameCtrl,
          err: 'Full name required',
        ) &&
        validationUtils.validateEntryEmail(emailTxtCtrl) &&
        validationUtils.validatePasswords(
          passwordTxtCtrl,
          confirmPasswordTxtCtrl,
        )) {
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
      //Navigate to Success Screen and then to Login Screen
      onSuccessSignUp();
    } else {
      snackBarSnippet.snackBarError(
        decodeErrorMessage(
          response?.errors?.last ?? response?.error ?? "",
          defaultMsg:
              "Sorry, an error occurred during sign up. Kindly try again",
        ),
      );
    }
  }

  //User needs to verify email before logging in
  void onSuccessSignUp() {
    isGuestUser.value = false;
    navUtils.fireTargetOff(
      SuccessScreen(
        onTap: () {
          navUtils.fireTargetOff(LoginScreen());
        },
      ),
      model: SuccessModel(
        title: "Account Created Successfully!",
        message:
            "Your account has been successfully created. Please check your inbox or spam folder to verify your email before logging in.",
      ),
    );
  }

  void onPickProfilePic() {}

  void onCompleteProfileOnClick() {
    //Get.to(() => OtpVerificationScreen());
    // navUtils.fireTarget(OtpVerificationScreen());
  }
}
