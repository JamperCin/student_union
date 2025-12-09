import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/db/app_preference.dart';
import 'package:student_union/core/def/global_access.dart';

class ProfileController extends BaseController {
  String profilePic = "";
  RxBool isUpdating = false.obs;

  ///
  ///Listener when a profile image is uploaded
  void onProfileImageUploaded(BuildContext context, String url) {
    profilePic = url;
    _initUpdate(context);
  }

  Future<void> _initUpdate(BuildContext context) async {
    if (profilePic.isEmpty) {
      snackBarSnippet.snackBarError("Please first upload a profile image");
      return;
    }

    const LoaderWidget().showProgressIndicator(context: context);

    final params = {
      'user': {"thumbnail_url": profilePic},
    };
    final results = await userApiService.updateUserDetails(params);

    if (results.profilePic.isNotEmpty) {
      userApiService.profilePic.value = profilePic;
      appPreference.setString(AppPreference().PROFILE_IMAGE, profilePic);
      snackBarSnippet.snackBarSuccess("Profile updated successfully");
    } else {
      snackBarSnippet.snackBarError("Failed to update profile image");
    }
    const LoaderWidget().hideProgress();
  }

  // Future<void> _uploadProfileImage() async {
  //   isUpdating.value = true;
  //   final params = {
  //     'user': {"thumbnail_url": profilePic},
  //   };
  //   final results = await userApiService.updateUserDetails(params);
  //   if (results.profilePic.isNotEmpty) {
  //     userApiService.profilePic.value = profilePic;
  //     appPreference.setString(AppPreference().PROFILE_IMAGE, profilePic);
  //     snackBarSnippet.snackBarSuccess("Profile updated successfully");
  //   } else {
  //     snackBarSnippet.snackBarError("Failed to update profile image");
  //   }
  //   isUpdating.value = false;
  // }

  // void onConfirmUpdate(BuildContext context) {
  //   if (profilePic.isEmpty) {
  //     snackBarSnippet.snackBarError("Please first upload a profile image");
  //     return;
  //   }

  //   BottomSheetWidget(
  //     context: context,
  //     height: appDimen.screenHeight * 0.3,
  //     child: ConfirmTransactionLayout(
  //       title: "Update Profile",
  //       subTitle: "Are you sure you want to update your profile?",
  //       buttonTitle: "Update",
  //       cancelAssetColor: Theme.of(context).colorScheme.surface,
  //       buttonStyle: Theme.of(context)
  //           .textTheme
  //           .bodyMedium
  //           ?.copyWith(color: Theme.of(context).colorScheme.surface),
  //       cancelWidget: const SizedBox.shrink(),
  //       onTap: () => _initUpdate(context),
  //     ),
  //   );
  // }
}
