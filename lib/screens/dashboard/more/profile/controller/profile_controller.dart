import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/widgets/bottom_sheet_widget.dart';
import 'package:core_module/core_ui/widgets/confirm_transaction_layout.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/db/app_preference.dart';
import 'package:student_union/core/def/global_access.dart';

class ProfileController extends BaseController {
  String profilePic = "";

  ///
  ///Listener when a profile image is uploaded
  void onProfileImageUploaded(String url) {
    profilePic = url;
  }

  Future<void> _initUpdate(BuildContext context) async {
    const LoaderWidget().showProgressIndicator(context: context);

    final params = {
      'user': {
        "thumbnail_url": profilePic,
      }
    };
    final results = await userApiService.updateUserDetails(params);
    const LoaderWidget().hideProgress();

    if (results.profilePic.isNotEmpty) {
      userApiService.profilePic.value = profilePic;
      appPreference.setString(AppPreference().PROFILE_IMAGE, profilePic);
      snackBarSnippet.snackBarSuccess("Profile updated successfully");
    }
  }

  void onConfirmUpdate(BuildContext context) {
    if (profilePic.isEmpty) {
      snackBarSnippet.snackBarError("Please first upload a profile image");
      return;
    }


    BottomSheetWidget(
      context: context,
      height: appDimen.screenHeight * 0.3,
      child: ConfirmTransactionLayout(
        title: "Update Profile",
        subTitle: "Are you sure you want to update your profile?",
        buttonTitle: "Update",
        cancelAssetColor: Theme.of(context).colorScheme.surface,
        buttonStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Theme.of(context).colorScheme.surface),
        cancelWidget: const SizedBox.shrink(),
        onTap: () => _initUpdate(context),
      ),
    );
  }
}
