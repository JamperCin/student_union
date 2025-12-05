import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/screens/auth/forgot_password/ui/verify_code_screen.dart';

class ForgotPasswordController extends BaseController {
  final emailTxtCtrl = TextEditingController();

  void onConfirmEmail(BuildContext context) {
    if (!validationUtils.validateEntryEmail(emailTxtCtrl)) {
      return;
    }

    BottomSheetWidget(
      context: context,
      height: appDimen.screenHeight * 0.4,
      child: ConfirmTransactionLayout(
        title: "Confirm your email",
        subTitle:
            "Kindly confirm your email below as we will send you a link to reset your password",
        onTap: () => _onInitPasswordReset(context),
        cancelAssetColor: Theme.of(context).colorScheme.surface,
        buttonStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Text(
          emailTxtCtrl.text,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  ///Initialise password reset
  Future<void> _onInitPasswordReset(BuildContext context) async {
    const LoaderWidget().showProgressIndicator(context: context);

    Map<String, Object> params = {'email': emailTxtCtrl.text.toString().trim()};

    final results = await userApiService.sendResetPasswordLink(params);
    const LoaderWidget().hideProgress();

    ///TODO Clean up this block
    if (results.success) {
      navUtils.fireTarget(
        VerifyCodeScreen(),
        model: emailTxtCtrl.text.toString().trim(),
      );
      // SuccessModel model = const SuccessModel(
      //   title: 'Password Reset link sent',
      //   message:
      //       'A password reset link has been sent to your email address. Kindly check your mail to reset your password.',
      // );
      //
      // navUtils.fireTarget(
      //   SuccessScreen(onTap: () => navUtils.fireTargetOff(LoginScreen())),
      //   model: model,
      // );
    } else {
      //final model
      // navUtils.fireTarget(VerifyCodeScreen(), model: emailTxtCtrl.text.toString().trim());
      // snackBarSnippet.snackBarError(results.error ?? 'Something went wrong');
    }
  }
}
