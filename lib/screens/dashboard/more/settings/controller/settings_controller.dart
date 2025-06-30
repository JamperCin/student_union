import 'package:core_module/core/def/global_def.dart';
import 'package:flutter/cupertino.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/screens/auth/forgot_password/ui/forgot_password_screen.dart';
import 'package:student_union/screens/dashboard/more/profile/ui/delete_account_profile_screen.dart';

class SettingsController extends BaseController{

  void onChangePasswordOnClick(){
    navUtils.fireTarget(ForgotPasswordScreen());
  }

  ///Confirm deletion of Account from the platform
  void onDeleteAccountOnClick(BuildContext context) {
    navUtils.fireTarget(DeleteAccountProfileScreen());
  }

  void onThemeSwitch(bool isThemeDark) {
    isDarkTheme.value = isThemeDark;
    appPreference.setDarkTheme(isThemeDark);
  }
}