import 'package:flutter/material.dart';
import 'package:core_module/core_module.dart';
import 'package:student_union/core/app/app_colors.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/screens/auth/login/login_controller.dart';

class LoginScreen extends BaseScreenDecorated {
  final _controller = Get.put(LoginController());

  @override
  String decoPageAsset() {
    return icSu;
  }

  @override
  Color backgroundColor(BuildContext context) {
    return primaryGreenColor;
  }

  @override
  Color decoBgBlurColor(BuildContext context) {
    return Colors.transparent;
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
  double decoPageTopPadding() {
    return 0;
  }

  @override
  Widget page(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(70.dp()),
          Center(
            child: AssetImageWidget(
              height: appDimen.dimen(180),
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
            'Sign In to continue',
            style: textTheme.labelSmall?.copyWith(color: colorScheme.tertiary),
          ),
          SizedBox(height: appDimen.dimen(40)),
          TextFieldWidget(
            labelText: 'Email',
            hintText: 'Email Eg. example@gmail.com',
            textCapitalization: TextCapitalization.none,
            focusColor: colorScheme.tertiary,
            borderColor: colorScheme.tertiary,
            labelStyle: textTheme.labelSmall?.copyWith(
              color: colorScheme.tertiary,
            ),
            hintStyle: textTheme.bodySmall?.copyWith(
              color: colorScheme.outline,
            ),
            style: textTheme.bodySmall?.copyWith(color: darkColor),
            prefixAsset: icEmailInput,
            backgroundColor: colorScheme.tertiary,
            keyboardType: TextInputType.emailAddress,
            controller: _controller.emailTxtCtrl,
          ),
          SizedBox(height: appDimen.dimen(10)),
          TextFieldWidget.withPassword(
            labelText: 'Password',
            hintText: 'Enter your password',
            controller: _controller.passwordTxtCtrl,
            labelStyle: textTheme.labelSmall?.copyWith(
              color: colorScheme.tertiary,
            ),
            hintStyle: textTheme.bodySmall?.copyWith(
              color: colorScheme.outline,
            ),
            style: textTheme.bodySmall?.copyWith(color: darkColor),
            prefixAsset: icPasswordInput,
            backgroundColor: colorScheme.tertiary,
          ),
          SizedBox(height: appDimen.dimen(20)),
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: TextButtonWidget.withTextOnly(
          //     text: 'Forgot Password',
          //     style: textTheme.bodyMedium?.copyWith(
          //       color: colorScheme.tertiary,
          //     ),
          //     onTap: _controller.onForgotPasswordClicked,
          //   ),
          // ),
          SizedBox(height: appDimen.dimen(40)),
          ButtonWidget(
            backgroundColor: colorScheme.secondary,
            onTap: () {
              _controller.onLoginOnClick(context);
            },
            text: 'SIGN IN',
          ),
          SizedBox(height: appDimen.dimen(20)),
          // const DividerWidget.withChild(text: 'Or'),
          SizedBox(height: appDimen.dimen(20)),
          // const ThirdPartyAuthWidget(),
          // SizedBox(height: appDimen.dimen(20)),
          Center(
            child: TextButtonWidget(
              onTap: _controller.onSignUpClicked,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don\'t have an Account? ',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.tertiary,
                      ),
                    ),
                    TextSpan(
                      text: 'Sign Up',
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
        ],
      ),
    );
  }
}
