import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:student_union/screens/auth/forgot_password/controller/verify_code_controller.dart';

class VerifyCodeScreen extends BaseScreenStandard {
  final _controller = Get.put(VerifyCodeController());

  @override
  bool showAppBar() {
    return true;
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
        ));
  }
}
