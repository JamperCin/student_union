import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/snippets/file_image_picker/file_image_picker_widget.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/card_container_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/network_image_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core_module.dart';
import 'package:student_union/core/db/app_preference.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/screens/dashboard/more/profile/profile_controller.dart';

class ProfileScreen extends BaseScreenStandard {
  final _controller = Get.put(ProfileController());

  @override
  bool showAppBar() {
    return true;
  }

  @override
  String appBarTitle() {
    return "Profile";
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          vertical: appDimen.dimen(20), horizontal: appDimen.dimen(16)),
      child: Column(
        children: [
          FileImagePickerWidget(
            url: appPreference.getString(AppPreference().PROFILE_IMAGE),
            radius: 100.dp(),
            containerSize: 140.dp(),
            placeholder: icUserIc,
            onFileUploaded: _controller.onProfileImageUploaded,
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
                  text: appPreference.getUser()?.name ?? ''),
              disabledColor: colorScheme.tertiary,
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
              disabledColor: colorScheme.tertiary,
              controller: TextEditingController(
                  text: appPreference.getUser()?.email ?? ''),
              prefixIcon: AssetImageWidget(
                asset: icEmailInput,
                height: 20.dp(),
                width: 20.dp(),
              ),
            ),
          ),
          Gap(70.dp()),
          ButtonWidget(text: "Save", onTap: _controller.onSaveOnClick),
          Gap(20.dp()),
        ],
      ),
    );
  }
}
