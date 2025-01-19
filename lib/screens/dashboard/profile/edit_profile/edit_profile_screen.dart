import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends BaseScreenStandard {
  @override
  bool showAppBar() {
    return true;
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          vertical: appDimen.dimen(20), horizontal: appDimen.dimen(16)),
      child: Column(
        children: [
          Center(
            child: Text(
              "Edit Profile",
              style: textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: appDimen.dimen(5)),
          Center(
            child: Text(
              "Edit your profile details below",
              style:
                  textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: appDimen.dimen(60)),
          TextFieldWidget(
            labelText: 'Full Name',
            hintText: 'Ex. John Doe',
          ),
          SizedBox(height: appDimen.dimen(10)),
          TextFieldWidget(
            labelText: 'Email',
            hintText: 'example@mail.com',
          ),
          SizedBox(height: appDimen.dimen(50)),
          ButtonWidget(
            text: "Update Profile",
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
