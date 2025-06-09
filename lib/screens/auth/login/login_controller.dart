import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/text_controller_ext.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/services/auth/auth_api_service.dart';
import 'package:student_union/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:student_union/screens/auth/sign_up/sign_up_screen.dart';
import 'package:student_union/screens/dashboard/main_dashboard_screen.dart';

class LoginController extends BaseController {
  var emailTxtCtrl = TextEditingController();
  var passwordTxtCtrl = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    emailTxtCtrl.text = "jampercola@gmail.com";
    passwordTxtCtrl.text = "asdfghjkl";
  }

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

  ///Initialise the login request to the Api
  Future<void> _initLoginRequest(BuildContext context) async {
    HashMap<String, Object> params = HashMap();
    params.putIfAbsent("email", () => emailTxtCtrl.getData());
    params.putIfAbsent("password", () => passwordTxtCtrl.getData());

    const LoaderWidget().showProgressIndicator(context: context);
    final response = await authApiService.login(params);
    const LoaderWidget().hideProgress();

    if (response != null && response.token != null) {
      appPreference.setToken(response.token!);
      appPreference.setUser(response.user);
      navUtils.fireTargetOff(MainDashboardScreen());
    }else{
      snackBarSnippet.snackBarError(response?.errors?.first ?? "Sorry, something went wrong. Kindly try again");
    }
    // if (response != null && response.success) {
    //   navUtils.fireTargetOff(MainDashboardScreen());
    // }
  }
}
