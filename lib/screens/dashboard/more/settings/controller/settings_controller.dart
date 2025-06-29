import 'package:core_module/core/def/global_def.dart';
import 'package:flutter/cupertino.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/screens/dashboard/more/profile/ui/delete_account_profile_screen.dart';

class SettingsController extends BaseController{

  void onChangePasswordOnClick(){

  }

  ///Confirm deletion of Account from the platform
  void onDeleteAccountOnClick(BuildContext context) {
    navUtils.fireTarget(DeleteAccountProfileScreen());
  }


}