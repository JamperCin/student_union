import 'dart:collection';

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/screens/auth/forgot_password/ui/forgot_password_screen.dart';
import 'package:student_union/screens/auth/sign_up/sign_up_screen.dart';
import 'package:student_union/screens/dashboard/main_dashboard_screen.dart';

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
    navUtils.fireTarget(SignUpScreen());
  }

  void onForgotPasswordClicked() {
    navUtils.fireTarget(ForgotPasswordScreen());
  }

  ///OnClick listener to the LogIn Button
  void onLoginOnClick(BuildContext context) {
    if (validationUtils.validateEntryEmail(emailTxtCtrl) &&
        validationUtils.validateDataEntry(passwordTxtCtrl)) {
      _initLoginRequest(context);
    }
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
      navUtils.fireTargetOff(MainDashboardScreen());
    }else {
      snackBarSnippet.snackBarError(
        decodeErrorMessage(
          response?.errors?.last ?? response?.error ?? "",
          defaultMsg: "Sorry, an error occurred during login. Kindly try again",
        ),
      );
    }
  }
}
