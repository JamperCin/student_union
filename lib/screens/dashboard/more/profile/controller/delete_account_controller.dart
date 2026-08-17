import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/app/app_routes.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/local/success_model.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/core-ui/widgets/app_confirm_transaction_layout.dart';
import 'package:student_union/core/utils/app_bottom_sheet.dart';
import 'package:student_union/core/utils/app_feedback.dart';

class DeleteAccountController extends BaseController {
  ///Confirm the deletion of this account form
  ///the Scripture union platform.
  void onConfirmDeleteAccount(BuildContext context) {
    AppBottomSheet.show(
      context: context,
      height: appDimen.screenHeight * 0.5,
      child: AppConfirmTransactionLayout(
        title: "Confirm deletion of account",
        displayCancelButton: false,
        cancelAssetColor: Theme.of(context).colorScheme.surface,
        buttonStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.surface,
        ),
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
      actionWidget: const SizedBox.shrink(),
      //snackBackgroundColor: orangeXColor,
      actionIconColor: Theme.of(context).colorScheme.tertiary,
      message: "Account deletion will begin in 5 seconds... ",
      onProgressCompletion: () => _initDeleteAccountRequest(context),
    );
  }

  Future<void> _initDeleteAccountRequest(BuildContext context) async {
    const LoaderWidget().showProgressIndicator(context: context);

    final results = await userApiService.deleteUserDetails();
    const LoaderWidget().hideProgress();

    if (results.success) {
      appPreference.logOut();

      SuccessModel model = const SuccessModel(
        title: 'Account Deletion Successful',
        message: 'Your account has been successfully deleted.',
      );
      AppRouter.pushNamed(
        AppRouteNames.success,
        extra: SuccessRouteExtra(
          model: model,
          onDone: () => AppRouter.goNamed(AppRouteNames.login),
        ),
      );
    } else {
      AppFeedback.error(
        decodeErrorMessage(
          results.error ?? "",
          defaultMsg:
              results.error ?? "Account deletion failed. Please try again.",
        ),
        context: context,
      );
    }
  }
}
