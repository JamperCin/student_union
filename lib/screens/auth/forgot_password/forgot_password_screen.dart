import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:student_union/screens/auth/forgot_password/forgot_password_controller.dart';

class ForgotPasswordScreen extends BaseScreenStandard {
  final _controller = Get.put(ForgotPasswordController());

  @override
  bool showAppBar() {
    return true;
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: appDimen.dimen(24),
        vertical: appDimen.dimen(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: appDimen.dimen(20)),
          Text(
            'Forgot Password?',
            style: textTheme.headlineMedium,
          ),
          SizedBox(height: appDimen.dimen(20)),
          Text(
            'You can easily reset your password using your email address. '
            '\n\nEnter your email address below to receive a password reset link',
            style: textTheme.labelSmall,
          ),
          SizedBox(height: appDimen.dimen(40)),
          TextFieldWidget(
            labelText: 'Email',
            hintText: 'Email Eg. example@gmail.com',
            keyboardType: TextInputType.emailAddress,
            controller: _controller.emailTxtCtrl,
          ),
          SizedBox(height: appDimen.dimen(60)),
          ButtonWidget(
            onTap: () {
              _controller.onSubmitEmail(context);
            },
            text: 'Login',
          ),
          SizedBox(height: appDimen.dimen(20)),
        ],
      ),
    );
  }
}
