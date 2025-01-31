import 'package:core_module/core/def/global_def.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/screens/dashboard/profile/profile_screen.dart';

class HomeController extends BaseController{

  void onSettingsOnClick() {
    navUtils.fireTarget(ProfileScreen());
  }
}