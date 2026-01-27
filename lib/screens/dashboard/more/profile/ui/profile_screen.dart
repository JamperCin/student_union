import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/screen/base_shared_screen.dart';
import 'package:student_union/core-ui/widgets/create_account_button.dart';
import 'package:student_union/core/db/app_preference.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/screens/dashboard/more/profile/controller/profile_controller.dart';

class ProfileScreen extends BaseSharedScreen {
  final _controller = Get.put(ProfileController());

  ProfileScreen() {
    _controller.profilePic = '';
  }

  @override
  String appBarTitle() {
    return "Profile";
  }

  @override
  Widget body(BuildContext context) {
    if (isGuestUser.value) return CreateAccountButton();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: appDimen.dimen(20),
        horizontal: appDimen.dimen(16),
      ),
      child: Column(
        children: [
          Gap(60.dp()),
          _controller.isUpdating.value
              ? SizedBox(
                  height: 140.dp(),
                  width: 140.dp(),
                  child: CircularProgressIndicator(
                    color: colorScheme.primary,
                    backgroundColor: colorScheme.onPrimary,
                  ),
                )
              : FileImagePickerWidget(
                  url: appPreference.getString(AppPreference().PROFILE_IMAGE),
                  radius: 100.dp(),
                  containerSize: 140.dp(),
                  heroTag: "Profile_img_ui_xyz",
                  iconColor: colorScheme.surface,
                  placeholder: icUserIc,
                  onFileUploaded: (url) =>
                      _controller.onProfileImageUploaded(context, url),
                  apiParser: (json) =>
                      json['url'] != null ? json['url'] as String : '',
                ),
          Gap(60.dp()),
          CardContainerWidget(
            child: TextFieldWidget(
              labelText: 'Full Name',
              hintText: 'Ex. John Doe',
              isEnabled: false,
              controller: TextEditingController(
                text: appPreference.getUser().name,
              ),
              disabledColor: colorScheme.inverseSurface,
              prefixIcon: AssetImageWidget(
                asset: icProfileInput,
                height: 20.dp(),
                width: 20.dp(),
              ),
            ),
          ),
          Gap(20.dp()),
          CardContainerWidget(
            child: TextFieldWidget(
              labelText: 'Email',
              hintText: 'example@mail.com',
              isEnabled: false,
              disabledColor: colorScheme.inverseSurface,
              controller: TextEditingController(
                text: appPreference.getUserEmail(),
              ),
              prefixIcon: AssetImageWidget(
                asset: icEmailInput,
                height: 20.dp(),
                width: 20.dp(),
              ),
            ),
          ),
          // Gap(70.dp()),
          // ButtonWidget(
          //   text: "Save",
          //   textColor: colorScheme.surface,
          //   onTap:()=> _controller.onConfirmUpdate(context),
          // ),
          Gap(20.dp()),
        ],
      ),
    );
  }
}
