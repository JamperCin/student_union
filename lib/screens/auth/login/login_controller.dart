import 'dart:collection';

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/app/app_routes.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/utils/app_feedback.dart';

class LoginController extends BaseController {
  var emailTxtCtrl = TextEditingController();
  var passwordTxtCtrl = TextEditingController();

  // @override
  // void onInit() {
  //   super.onInit();
  //   emailTxtCtrl.text = "jampercola@gmail.com";
  //   passwordTxtCtrl.text = "asdfghjkl";
  // }

  void onSignUpClicked() {
    AppRouter.pushNamed(AppRouteNames.signUp);
  }

  void onForgotPasswordClicked() {
    AppRouter.pushNamed(AppRouteNames.forgotPassword);
  }

  ///OnClick listener to the LogIn Button
  void onLoginOnClick(BuildContext context) {
    isGuestUser.value = false;
    final email = emailTxtCtrl.getData().trim();
    final password = passwordTxtCtrl.getData().trim();

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

    _initLoginRequest(context);
  }

  /// Initializes the login request to the API.
  ///
  /// This asynchronous method performs the following steps:
  /// 1. Creates a `HashMap` to store the login parameters (email and password).
  /// 2. Retrieves the email from `emailTxtCtrl`, converts it to lowercase, and adds it to the parameters.
  /// 3. Retrieves the password from `passwordTxtCtrl` and adds it to the parameters.
  /// 4. Displays a progress indicator to the user.
  /// 5. Makes an API call to the `authApiService.login` endpoint with the prepared parameters.
  /// 6. Hides the progress indicator after the API call completes.
  /// 7. Checks if the API response is not null and contains a token.
  /// 8. If the response is valid:
  ///    a. Stores the authentication token using `appPreference.setToken()`.
  ///    b. Stores the user information using `appPreference.setUser()`.
  ///    c. Navigates the user to the `MainDashboardScreen` and removes the current login screen from the navigation stack.
  ///
  /// - Parameters:
  ///   - `context`: The `BuildContext` used to show and hide the progress indicator.
  Future<void> _initLoginRequest(BuildContext context) async {
    // Prepare the parameters for the login request.
    HashMap<String, Object> params = HashMap();
    params.putIfAbsent("email", () => emailTxtCtrl.getData().toLowerCase());
    params.putIfAbsent("password", () => passwordTxtCtrl.getData());

    // Show a loading indicator while the request is in progress.
    const LoaderWidget().showProgressIndicator(context: context);
    final response = await authApiService.login(params);
    const LoaderWidget().hideProgress();

    // Process the API response.
    if (response != null && response.token != null) {
      appPreference.setToken(response.token!);
      appPreference.setUser(response.user);
      appPreference.setPassword(passwordTxtCtrl.getData());
      AppRouter.goHome();
    } else {
      AppFeedback.error(
        decodeErrorMessage(
          response?.errors?.last ?? response?.error ?? "",
          defaultMsg:
              response?.errors?.last ??
              response?.error ??
              "Sorry, an error occurred during login. Kindly try again",
        ),
        context: context,
      );
    }
  }

  void onGuestLoginClicked() {}

  bool _isValidEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+\-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$",
    ).hasMatch(email);
  }
}
