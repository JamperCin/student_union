import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/local/success_model.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/screens/auth/login/login_screen.dart';
import 'package:student_union/screens/shared/success_screen.dart';

class DeleteAccountController extends BaseController {
  ///Confirm the deletion of this account form
  ///the Scripture union platform.
  void onConfirmDeleteAccount(BuildContext context) {
    BottomSheetWidget(
      context: context,
      height: appDimen.screenHeight * 0.45,
      child: ConfirmTransactionLayout(
        title: "Confirm deletion of account",
        displayCancelButton: false,
        titleStyle: Theme.of(context).textTheme.titleLarge,
        subTitle: "Are you sure you want to delete your account?",
        buttonTitle: 'Delete Account',
        child: AssetImageWidget(asset: icDanger),
        onTap: () => _initDeleteAccount(context),
      ),
    );
  }

  void _initDeleteAccount(BuildContext context) {
    snackBarSnippet.showCountdownSnackBar(
      context,
      actionIcon: Icons.delete_forever,
      actionIconColor: Theme.of(context).colorScheme.tertiary,
      message: "Account deletion will begin in 5 seconds... ",
      onProgressCompletion: () => _initDeleteAccountRequest(context),
    );
  }

  Future<void> _initDeleteAccountRequest(BuildContext context) async {
    const LoaderWidget().showProgressIndicator(context: context);

    final results = await userApiService.deleteUserDetails();
    const LoaderWidget().hideProgress();

    SuccessModel model = const SuccessModel(
      title: 'Account Deletion Successful',
      message: 'Your account has been successfully deleted.',
    );
    navUtils.fireTarget(SuccessScreen(
      onTap: () {
        navUtils.fireTargetOff(LoginScreen());
      },
    ), model: model);
  }
}
