import 'dart:collection';

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/app/app_routes.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/local/success_model.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/core/utils/app_feedback.dart';

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
    AppRouter.pushNamed(AppRouteNames.login);
  }

  //Go to the Login Screen
  void onPrivacyPolicyOnClick() {
    AppRouter.pushNamed(
      AppRouteNames.web,
      extra: WebModel(
        url: "https://sughana.org/privacy/",
        title: "Privacy Policy",
      ),
    );
  }

  void onTermsAndCondOnClick(bool isChecked) {
    isTermsAndCondChecked = isChecked;
  }

  ///OnClick listener to the sigUn Button
  Future<void> onSignUpOnClick(BuildContext context) async {
    final fullName = fullNameCtrl.getData().trim();
    final email = emailTxtCtrl.getData().trim();
    final password = passwordTxtCtrl.getData().trim();
    final confirmPassword = confirmPasswordTxtCtrl.getData().trim();

    if (fullName.isEmpty) {
      AppFeedback.error("Full name required", context: context);
      return;
    }

    if (!_isValidEmail(email)) {
      AppFeedback.error(
        "Please enter a valid email address.",
        context: context,
      );
      return;
    }

    if (password.isEmpty) {
      AppFeedback.error("Password required", context: context);
      return;
    }

    if (password.length < 6) {
      AppFeedback.error(
        "Passwords length cannot be less than 6 characters.",
        context: context,
      );
      return;
    }

    if (password != confirmPassword) {
      AppFeedback.error("Passwords do not match.", context: context);
      return;
    }

    if (!isTermsAndCondChecked) {
      AppFeedback.error(
        "Please accept the Terms and Conditions",
        context: context,
      );
      return;
    }

    _initSignUpRequest(context);
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
      await revenueCatService.identifyUser(
        response.user?.email.isNotEmpty == true
            ? response.user!.email
            : emailTxtCtrl.getData().toLowerCase(),
      );
      //Navigate to Success Screen and then to Login Screen
      onSuccessSignUp();
    } else {
      if (!context.mounted) return;
      AppFeedback.error(
        decodeErrorMessage(
          response?.errors?.last ?? response?.error ?? "",
          defaultMsg:
              response?.errors?.last ??
              response?.error ??
              "Sorry, an error occurred during sign up. Kindly try again",
        ),
        context: context,
      );
    }
  }

  //User needs to verify email before logging in
  void onSuccessSignUp() {
    isGuestUser.value = false;
    AppRouter.goNamed(
      AppRouteNames.success,
      extra: SuccessRouteExtra(
        onDone: () {
          appPreference.logOut();
          isGuestUser.value = false;
          AppRouter.goNamed(AppRouteNames.login);
        },
        model: SuccessModel(
          title: "Account Created Successfully!",
          message:
              "Your account has been successfully created. Please check your inbox or spam folder to verify your email before logging in.",
        ),
      ),
    );
  }

  void onPickProfilePic() {}

  void onCompleteProfileOnClick() {
    //Get.to(() => OtpVerificationScreen());
    // navUtils.fireTarget(OtpVerificationScreen());
  }

  bool _isValidEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+\-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$",
    ).hasMatch(email);
  }
}
