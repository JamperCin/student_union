import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/base_screen/base_screen_dec.dart';
import 'package:core_module/core_ui/snippets/third_party_auth/third_party_auth_widget.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/checkbox_widget.dart';
import 'package:core_module/core_ui/widgets/divider_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/screens/auth/sign_up/sign_up_controller.dart';

class SignUpScreen extends BaseScreenDecorated {
  final _controller = Get.put(SignUpController());

  @override
  String decoPageAsset() {
    return icSu;
  }

  @override
  bool showAppBar() {
    return true;
  }

  @override
  double decoPageTopPadding() {
    return appDimen.dimen(1);
  }

  @override
  Color appBarBackgroundColor(BuildContext context) {
    return backgroundColor(context);
  }

  @override
  Color backgroundColor(BuildContext context) {
    return colorScheme.primary;
  }

  @override
  Color appBarIconColor(BuildContext context) {
    return colorScheme.tertiary;
  }

  @override
  Positioned decoBackPosition() {
    return Positioned.fill(
      child: AssetImageWidget(
        height: appDimen.screenHeight,
        width: appDimen.screenWidth,
        asset: icBackground,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget page(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: AssetImageWidget(
              height: appDimen.dimen(150),
              width: appDimen.dimen(250),
              asset: icSu,
            ),
          ),
          SizedBox(height: appDimen.dimen(20)),
          Text(
            'Hello!',
            style: textTheme.bodyMedium?.copyWith(color: colorScheme.secondary),
          ),
          SizedBox(height: appDimen.dimen(1)),
          Text(
            'Sign Up to continue',
            style: textTheme.labelSmall?.copyWith(color: colorScheme.tertiary),
          ),
          SizedBox(height: appDimen.dimen(40)),
          TextFieldWidget(
            labelText: 'Full Name',
            hintText: 'Ex. John Doe',
            labelStyle:
                textTheme.labelSmall?.copyWith(color: colorScheme.tertiary),
            prefixIcon: AssetImageWidget(
              asset: icProfileInput,
              height: appDimen.dimen(10),
              width: appDimen.dimen(10),
            ),
          ),
          SizedBox(height: appDimen.dimen(10)),
          TextFieldWidget(
            labelText: 'Email',
            hintText: 'example@mail.com',
            labelStyle:
                textTheme.labelSmall?.copyWith(color: colorScheme.tertiary),
            prefixIcon: AssetImageWidget(
              asset: icEmailInput,
              height: appDimen.dimen(2),
              width: appDimen.dimen(2),
            ),
          ),
          SizedBox(height: appDimen.dimen(10)),
          TextFieldWidget.withPassword(
            labelText: 'Password',
            hintText: '********',
            labelStyle:
                textTheme.labelSmall?.copyWith(color: colorScheme.tertiary),
            prefixIcon: AssetImageWidget(
              asset: icPasswordInput,
              height: appDimen.dimen(10),
              width: appDimen.dimen(10),
            ),
          ),
          SizedBox(height: appDimen.dimen(1)),
          CheckboxWidget(
            text: 'Agree with Terms And Conditions',
            unCheckedValue: colorScheme.tertiary,
            activeColor: colorScheme.secondary,
            onChange: _controller.onTermsAndCondOnClick,
            style: textTheme.labelSmall?.copyWith(color: colorScheme.tertiary),
          ),
          SizedBox(height: appDimen.dimen(50)),
          ButtonWidget(
            backgroundColor: colorScheme.secondary,
            text: "SIGN UP",
            onTap: () {
              _controller.onSignUpOnClick(context);
            },
          ),
          SizedBox(height: appDimen.dimen(10)),
          Center(
            child: TextButtonWidget(
              onTap: _controller.onSignInOnClick,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Already have an Account? ',
                    style: textTheme.labelSmall
                        ?.copyWith(color: colorScheme.tertiary),
                  ),
                  TextSpan(
                    text: 'Sign In',
                    style: textTheme.labelMedium
                        ?.copyWith(color: colorScheme.secondary),
                  ),
                ]),
              ),
            ),
          ),
          SizedBox(height: appDimen.dimen(20)),
          // const DividerWidget.withChild(text: 'Or Sign Up With'),
          // SizedBox(height: appDimen.dimen(20)),
          // const ThirdPartyAuthWidget(),
          // SizedBox(height: appDimen.dimen(20)),
        ],
      ),
    );
  }
}
