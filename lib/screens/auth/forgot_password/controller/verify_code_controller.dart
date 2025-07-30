import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/local/success_model.dart';
import 'package:student_union/screens/auth/login/login_screen.dart';
import 'package:student_union/screens/shared/success_screen.dart';

class VerifyCodeController extends BaseController {
  ///On Pin Entry complete
  Future<void> onPinEntryComplete(BuildContext context, String code) async {
    const LoaderWidget().showProgressIndicator(context: context);
    final results = await userApiService.verifyOtpCode({
      'code': code,
      'email': Get.arguments,
    });

    const LoaderWidget().hideProgress();

    if (results.success) {
      SuccessModel model = const SuccessModel(
        title: 'Password Reset link sent',
        message:
            'A password reset link has been sent to your email address. Kindly check your mail to reset your password.',
      );

      navUtils.fireTargetOff(
        SuccessScreen(onTap: () => navUtils.fireTargetOff(LoginScreen())),
        model: model,
      );
    } else {
      snackBarSnippet.snackBarError(results.error ?? 'Something went wrong');
    }
  }
}
