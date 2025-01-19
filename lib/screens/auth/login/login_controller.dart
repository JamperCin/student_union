import 'dart:collection';

import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core/extensions/text_controller_ext.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/services/auth/auth_api_service.dart';
import 'package:student_union/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:student_union/screens/dashboard/main_dashboard_screen.dart';



class LoginController extends BaseController {
  var emailTxtCtrl = TextEditingController();
  var passwordTxtCtrl = TextEditingController();
  final authService = AuthApiService();

  @override
  void onInit() {
    super.onInit();
    emailTxtCtrl.text = "jampercola@gmail.com";
    passwordTxtCtrl.text = "Cola360";
  }


  void onSignUpClicked() {
    //navUtils.fireTarget(SignUpScreen());
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
   //TODO final response = await authService.login(params);
    await Future.delayed(const Duration(seconds: 2));
    const LoaderWidget().hideProgress();

    navUtils.fireTargetOff(MainDashboardScreen());
  }




}
