import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/snippets/snack_bar_snippet.dart';
import 'package:core_module/core_ui/widgets/bottom_sheet_widget.dart';
import 'package:core_module/core_ui/widgets/confirm_transaction_layout.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/db/app_preference.dart';
import 'package:student_union/core/def/global_access.dart';

class ProfileController extends BaseController {

  ///
  ///Listener when a profile image is uploaded
  void onProfileImageUploaded(String url) {
    appPreference.setString(AppPreference().PROFILE_IMAGE, url);
    userApiService.profilePic.value = url;
  }

  Future<void> _initUpdate(BuildContext context) async {
    const LoaderWidget().showProgressIndicator(context: context);

    Map<String, Object> params = {
      "profile_image": userApiService.profilePic.value,
    };
    final results = await userApiService.updateUserDetails(params);
    const LoaderWidget().hideProgress();

    if (results.profilePic.isNotEmpty) {
      snackBarSnippet.snackBarSuccess("Profile updated successfully");
    }
  }

  void onConfirmUpdate(BuildContext context) {
    if (userApiService.profilePic.value.isEmpty) {
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
        cancelWidget: const SizedBox.shrink(),
        onTap: () => _initUpdate(context),
      ),
    );
  }
}
