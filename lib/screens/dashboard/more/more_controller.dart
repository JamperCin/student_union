import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/res/assets_path.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/bottom_sheet_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:student_union/core-ui/screen/base_web.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:student_union/screens/auth/login/login_screen.dart';

import 'package:student_union/screens/dashboard/donate/ui/donations_history_screen.dart';
import 'package:student_union/screens/dashboard/more/about/about_screen.dart';
import 'package:student_union/screens/dashboard/more/edit_profile/edit_profile_screen.dart';
import 'package:student_union/screens/dashboard/more/faqs/faqs_screen.dart';
import 'package:student_union/screens/dashboard/more/settings/ui/settings_screen.dart';

import 'notifications/notificationsScreen.dart';

class MoreController extends BaseController {
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

  void onInviteOnClick() {}

  void onFaqOnClick() {
    navUtils.fireTarget(FaqScreen());
  }

  void onLogOutOnClick(BuildContext context) {
    BottomSheetWidget(
      context: context,
      title: "",
      subChild: Padding(
        padding:  EdgeInsets.all(10.dp()),
        child: Column(
          children: [
            AssetImageWidget(
              asset: icWarn,
              height: 80.dp(),
              width: 80.dp(),
            ),
            Gap(30.dp()),
            Text(
              "Are you sure you want to log Out?",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Gap(30.dp()),
            ButtonWidget.withOutLine(
              onTap: () {
                navUtils.fireTargetOff(LoginScreen());
              },
              borderColor: Theme.of(context).colorScheme.error,
              text: "Yes",
            )
          ],
        ),
      ),
    );
  }

  void onReadBibleOnClick(v) {
    navUtils.fireTarget(BaseWebView(),
        model: WebModel(
            url: "https://tawk.to/socialmediamissionary", title: "Read Bible"));
  }
}
