import 'package:flutter/cupertino.dart';
import 'package:student_union/core/base/base_controller.dart';

class VerifyCodeController extends BaseController {
  ///On Pin Entry complete
  Future<void> onPinEntryComplete(BuildContext context, String code) async {
    // const LoaderWidget().showProgressIndicator(context: context);
    // final results = await userApiService.verifyOtpCode({
    //   'code': code,
    //   'email': Get.arguments,
    // });

    // const LoaderWidget().hideProgress();

    // if (results.success) {
    //   SuccessModel model = const SuccessModel(
    //     title: 'Password Reset link sent',
    //     message:
    //         'A password reset link has been sent to your email address. Kindly check your mail to reset your password.',
    //   );

    //   navUtils.fireTargetOff(
    //     SuccessScreen(onTap: () => navUtils.fireTargetOff(LoginScreen())),
    //     model: model,
    //   );
    // } else {
    //   snackBarSnippet.snackBarError(results.error ?? 'Something went wrong');
    // }
  }
}
