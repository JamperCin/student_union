import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/app/app_colors.dart';
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
    return primaryGreenColor;
  }

  @override
  Color decoBgBlurColor(BuildContext context) {
    return Colors.transparent;
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
            controller: _controller.fullNameCtrl,
            hintStyle: textTheme.bodySmall?.copyWith(
              color: colorScheme.outline,
            ),
            style: textTheme.bodySmall?.copyWith(color: darkColor),
            focusColor: colorScheme.tertiary,
            backgroundColor: colorScheme.tertiary,
            labelStyle: textTheme.labelSmall?.copyWith(
              color: colorScheme.tertiary,
            ),
            prefixAsset: icProfileInput,
          ),
          SizedBox(height: appDimen.dimen(10)),
          TextFieldWidget(
            labelText: 'Email',
            hintText: 'example@mail.com',
            hintStyle: textTheme.bodySmall?.copyWith(
              color: colorScheme.outline,
            ),
            style: textTheme.bodySmall?.copyWith(color: darkColor),
            textCapitalization: TextCapitalization.none,
            controller: _controller.emailTxtCtrl,
            focusColor: colorScheme.tertiary,
            backgroundColor: colorScheme.tertiary,
            labelStyle: textTheme.labelSmall?.copyWith(
              color: colorScheme.tertiary,
            ),
            prefixAsset: icEmailInput,
          ),
          SizedBox(height: appDimen.dimen(10)),
          TextFieldWidget.withPassword(
            labelText: 'Password',
            hintText: '********',
            hintStyle: textTheme.bodySmall?.copyWith(
              color: colorScheme.outline,
            ),
            style: textTheme.bodySmall?.copyWith(color: darkColor),
            controller: _controller.passwordTxtCtrl,
            focusColor: colorScheme.tertiary,
            backgroundColor: colorScheme.tertiary,
            labelStyle: textTheme.labelSmall?.copyWith(
              color: colorScheme.tertiary,
            ),
            prefixAsset: icPasswordInput,
          ),
          SizedBox(height: appDimen.dimen(1)),
          CheckboxWidget(
            text: 'Agree with Privacy Policy & Terms & Conditions',
            unCheckedValue: colorScheme.tertiary,
            activeColor: colorScheme.secondary,
            onChange: _controller.onTermsAndCondOnClick,
            onTextClick: _controller.onPrivacyPolicyOnClick,
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
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already have an Account? ',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.tertiary,
                      ),
                    ),
                    TextSpan(
                      text: 'Sign In',
                      style: textTheme.labelMedium?.copyWith(
                        color: colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
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
