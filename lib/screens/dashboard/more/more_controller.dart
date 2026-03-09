import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/app/app_routes.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/core/utils/app_bottom_sheet.dart';
import 'package:student_union/core/utils/you_version_utils.dart';

class MoreController extends BaseController {
  // RxString profilePic =
  //     "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
  //         .obs;

  void onEditProfileOnClick() {
    AppRouter.pushNamed(AppRouteNames.profile);
  }

  void onSettingsOnClick() {
    AppRouter.pushNamed(AppRouteNames.settings);
  }

  void onLogOutOnClick(BuildContext context) {
    AppBottomSheet.showWithTitle(
      context: context,
      height: appDimen.screenHeight * 0.4,
      title: "Log Out",
      child: Padding(
        padding: EdgeInsets.all(10.dp()),
        child: Column(
          children: [
            AssetImageWidget(asset: icWarn, height: 80.dp(), width: 80.dp()),
            Gap(30.dp()),
            Text(
              "Are you sure you want to log Out?",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Gap(30.dp()),
            ButtonWidget(
              onTap: _onLogOutOnClick,
              backgroundColor: Theme.of(context).colorScheme.error,
              text: "Log Out",
            ),
          ],
        ),
      ),
    );
  }

  void _onLogOutOnClick() {
    appPreference.logOut();
    isGuestUser.value = false;
    AppRouter.goNamed(AppRouteNames.login);
  }

  Future<void> onReadBibleOnClick(v) async {
    YouVersionUtils().openBibleReference();
  }

  void onCounsellingOnClick(v) {
    AppRouter.pushNamed(
      AppRouteNames.web,
      extra: WebModel(
        url: "https://tawk.to/socialmediamissionary",
        title: "Counselling & Prayers",
      ),
    );
  }

  void onAboutOnClick() {
    AppRouter.pushNamed(AppRouteNames.about);
  }

  void onPrivacyPolicyOnClick() {
    AppRouter.pushNamed(
      AppRouteNames.web,
      extra: WebModel(
        url: "https://sughana.org/privacy/",
        title: "Privacy Policy",
      ),
    );
  }
}
