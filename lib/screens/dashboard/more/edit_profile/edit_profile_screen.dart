import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/network_image_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/res/asset_path.dart';

class EditProfileScreen extends BaseScreenStandard {
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
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 120.dp(),
                maxWidth: 120.dp(),
              ),
              child: Stack(
                children: [
                  ContainerWidget.withCircular(
                    padding: EdgeInsets.all(1.dp()),
                    borderColor: colorScheme.primary,
                    color: Colors.transparent,
                    child: NetworkImageWidget.withCircular(
                      url: userApiService.profilePic.value,
                      radius: 60.dp(),
                    ),
                  ),
                  Align(
                    child: AssetImageWidget(
                      asset: icCamera,
                      height: 30.dp(),
                      width: 30.dp(),
                    ),
                    alignment: Alignment.bottomRight,
                  )
                ],
              ),
            ),
          ),
          Gap(60.dp()),
          TextFieldWidget(
            labelText: 'Full Name',
            hintText: 'Ex. John Doe',
            isEnabled: false,
            controller: TextEditingController(text: "John Smith"),
            borderColor: colorScheme.tertiary,
            prefixIcon: AssetImageWidget(
              asset: icProfileInput,
              height: 20.dp(),
              width: 20.dp(),
            ),
          ),
          Gap(10.dp()),
          TextFieldWidget(
            labelText: 'Email',
            hintText: 'example@mail.com',isEnabled: false,
            borderColor: colorScheme.tertiary,
            controller: TextEditingController(text: "johnny.smith@su.com"),
            prefixIcon: AssetImageWidget(
              asset: icEmailInput,
              height:20.dp(),
              width: 20.dp(),
            ),
          ),
          SizedBox(height: appDimen.dimen(50)),
          ButtonWidget(
            text: "Save",
            onTap: () {
              // _controller.onSignUpOnClick(context);
            },
          ),
          SizedBox(height: appDimen.dimen(20)),
        ],
      ),
    );
  }
}
