import 'package:core_module/core/def/global_definitions.dart';
import 'package:get/get.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:student_union/screens/auth/login/login_screen.dart';
import 'package:student_union/screens/dashboard/donate/donations_history_screen.dart';
import 'package:student_union/screens/dashboard/profile/about/about_screen.dart';
import 'package:student_union/screens/dashboard/profile/edit_profile/edit_profile_screen.dart';
import 'package:student_union/screens/dashboard/profile/faqs/faqs_screen.dart';
import 'package:student_union/screens/dashboard/profile/notifications/notificationsScreen.dart';
import 'package:student_union/screens/dashboard/profile/settings/settings_screen.dart';

class ProfileController extends BaseController {
  RxString profilePic =
      "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
          .obs;

  void onEditProfileOnClick() {
    navUtils.fireTarget(EditProfileScreen());
  }

  void onChangePasswordOnClick() {
    navUtils.fireTarget(ForgotPasswordScreen());
  }

  void onDonationHistoryOnClick() {
    navUtils.fireTarget(DonationsHistoryScreen());
  }

  void onNotificationOnClick() {
    navUtils.fireTarget(NotificationsScreen());
  }

  void onSettingsOnClick() {
    navUtils.fireTarget(SettingsScreen());
  }

  void onAboutOnClick() {
    navUtils.fireTarget(AboutScreen());
  }

  void onInviteOnClick() {
  }

  void onFaqOnClick() {
    navUtils.fireTarget(FaqScreen());
  }

  void onLogOutOnClick() {
    navUtils.fireTargetOff(LoginScreen());
  }
}
