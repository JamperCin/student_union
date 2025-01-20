import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core/res/assets_image_path.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/card_container_widget.dart';
import 'package:core_module/core_ui/widgets/profile_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_union/core-ui/widgets/top_header_widget.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/screens/dashboard/profile/profile_controller.dart';

class ProfileScreen extends BaseScreenStandard {
  final _controller = Get.put(ProfileController());

  @override
  bool safeArea() {
    return true;
  }

  @override
  Color backgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.shadow.withOpacity(0.5);
  }

  @override
  bool showAppBar() {
    return false;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        const TopHeaderWidget.withEmail(),
        Expanded(
            child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: appDimen.dimen(10),
            horizontal: appDimen.dimen(10),
          ),
          child: Column(
            children: [
              CardContainerWidget(
                heading: 'ACCOUNT MANAGEMENT',
                child: Column(
                  children: [
                    ProfileMenuWidget(
                      asset: icProfile,
                      onTap: _controller.onEditProfileOnClick,
                      text: "Edit Profile",
                    ),
                    ProfileMenuWidget(
                      asset: icPassword,
                      onTap: _controller.onChangePasswordOnClick,
                      text: "Change Password",
                    ),
                  ],
                ),
              ),
              SizedBox(height: appDimen.dimen(20)),
              CardContainerWidget(
                heading: 'DONATIONS',
                child: Column(
                  children: [
                    ProfileMenuWidget(
                      asset: icNotification,
                      onTap: _controller.onDonationHistoryOnClick,
                      text: "Donation History",
                    ),
                  ],
                ),
              ),
              SizedBox(height: appDimen.dimen(20)),
              CardContainerWidget(
                heading: 'PREFERENCE AND SETTINGS',
                child: Column(
                  children: [
                    ProfileMenuWidget(
                      asset: icNotification,
                      onTap: _controller.onNotificationOnClick,
                      text: "Notifications",
                    ),
                    ProfileMenuWidget(
                      asset: icSettings,
                      onTap: _controller.onSettingsOnClick,
                      text: "Settings",
                    ),
                  ],
                ),
              ),
              SizedBox(height: appDimen.dimen(20)),
              CardContainerWidget(
                heading: 'SUPPORT AND FEEDBACK',
                child: Column(
                  children: [
                    ProfileMenuWidget(
                      asset: icAbout,
                      onTap: _controller.onAboutOnClick,
                      text: "About",
                    ),
                    ProfileMenuWidget(
                      asset: icSupport,
                      onTap: _controller.onFaqOnClick,
                      text: "FAQs",
                    ),
                    ProfileMenuWidget(
                      asset: icInvite,
                      onTap: _controller.onInviteOnClick,
                      text: "Invite Friends",
                    ),
                  ],
                ),
              ),
              SizedBox(height: appDimen.dimen(20)),
              CardContainerWidget(
                padding: EdgeInsets.symmetric(
                  vertical: appDimen.dimen(1),
                ),
                child: Column(
                  children: [
                    ProfileMenuWidget(
                      asset: icLogOut,
                      assetColor: colorScheme.error,
                      onTap: _controller.onLogOutOnClick,
                      text: "Log Out",
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
