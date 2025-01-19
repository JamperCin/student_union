import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/snippets/third_party_auth/third_party_auth_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/checkbox_widget.dart';
import 'package:core_module/core_ui/widgets/day_month_picker_widget.dart';
import 'package:core_module/core_ui/widgets/divider_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_union/screens/auth/sign_up/sign_up_controller.dart';

class SignUpScreen extends BaseScreenStandard {
  final _controller = Get.put(SignUpController());

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
              "Create Account",
              style: textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: appDimen.dimen(5)),
          Center(
            child: Text(
              "Fill in your information below or register wih your social account",
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
          // TextFieldWidget.withPhoneNumber(
          //   labelText: 'Phone number',
          //   hintText: '000 0000 0000',
          // ),
          // SizedBox(height: appDimen.dimen(10)),
          TextFieldWidget(
            labelText: 'Email',
            hintText: 'example@mail.com',
          ),
          SizedBox(height: appDimen.dimen(10)),
          TextFieldWidget.withPassword(
            labelText: 'Password',
            hintText: '********',
          ),
          // SizedBox(height: appDimen.dimen(10)),
          // DayMonthPickerWidget(
          //   labelText: 'Select your date of birth',
          //   dayCtrl: _controller.dayCtrl,
          //   monthCtrl: _controller.monthCtrl,
          // ),
          SizedBox(height: appDimen.dimen(1)),
          CheckboxWidget(
            text: 'Agree with Terms And Conditions',
            onChange: _controller.onTermsAndCondOnClick,
          ),
          SizedBox(height: appDimen.dimen(20)),
          ButtonWidget(
            text: "Sign Up",
            onTap: (){
              _controller.onSignUpOnClick(context);
            },
          ),
          SizedBox(height: appDimen.dimen(10)),
          TextButtonWidget(
            onTap: _controller.onSignInOnClick,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Already have an Account? ',
                  style: textTheme.labelMedium,
                ),
                TextSpan(
                  text: 'Sign In',
                  style: textTheme.bodyMedium?.copyWith(color: Colors.blue),
                ),
              ]),
            ),
          ),
          SizedBox(height: appDimen.dimen(20)),
          const DividerWidget.withChild(text: 'Or Sign Up'),
          SizedBox(height: appDimen.dimen(20)),
          const ThirdPartyAuthWidget(),
          SizedBox(height: appDimen.dimen(20)),
        ],
      ),
    );
  }
}
