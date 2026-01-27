import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/screen/base_shared_screen.dart';
import 'package:student_union/core-ui/widgets/create_account_button.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/screens/auth/forgot_password/controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends BaseSharedScreen {
  final _controller = Get.put(ForgotPasswordController());

  @override
  Color? appBarBackgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }

  @override
  Color? appBarIconColor(BuildContext context) {
    return Theme.of(context).colorScheme.inverseSurface;
  }

  @override
  Widget body(BuildContext context) {
    if (isGuestUser.value) return CreateAccountButton();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: appDimen.dimen(24),
        vertical: appDimen.dimen(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: appDimen.dimen(20)),
          Text('Forgot Password?', style: textTheme.headlineMedium),
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
            prefixAsset: icEmailInput,
          ),

          SizedBox(height: appDimen.dimen(60)),
          ButtonWidget(
            textColor: colorScheme.surface,
            onTap: () {
              _controller.onConfirmEmail(context);
            },
            text: 'Proceed',
          ),
          SizedBox(height: appDimen.dimen(20)),
        ],
      ),
    );
  }
}
