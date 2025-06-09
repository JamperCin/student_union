import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/db/app_preference.dart';
import 'package:student_union/core/def/global_access.dart';

class ProfileController extends BaseController {

  void onProfileImageUploaded(String url) {
    userApiService.profilePic.value = appPreference.getString(AppPreference().PROFILE_IMAGE);
    appPreference.setString(AppPreference().PROFILE_IMAGE, url);
  }

  void onSaveOnClick() {

  }
}
