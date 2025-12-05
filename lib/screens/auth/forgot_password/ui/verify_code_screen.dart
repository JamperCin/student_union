import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/screen/base_shared_screen.dart';
import 'package:student_union/screens/auth/forgot_password/controller/verify_code_controller.dart';

class VerifyCodeScreen extends BaseSharedScreen {
  final _controller = Get.put(VerifyCodeController());

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
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.dp(), vertical: 16.dp()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(20.dp()),
          Text(
            'Enter verification Code',
            style: textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          Gap(20.dp()),
          Text(
            'Enter the 6-digit code sent to your email below to reset your password.',
            style: textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
          Gap(70.dp()),
          PinEntryWidget(
            codeLength: 6,
            boxDecor: false,
            onCodeSubmitted: (code) {
              dismissKeyBoard(context);
              _controller.onPinEntryComplete(context, code);
            },
          ),
          Gap(40.dp()),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'clear code',
              style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }
}
