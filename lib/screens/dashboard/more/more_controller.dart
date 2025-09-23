import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/bottom_sheet_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/screen/base_web.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/core/utils/you_version_utils.dart';
import 'package:student_union/screens/auth/login/login_screen.dart';
import 'package:student_union/screens/dashboard/more/about/about_screen.dart';
import 'package:student_union/screens/dashboard/more/profile/ui/profile_screen.dart';
import 'package:student_union/screens/dashboard/more/settings/ui/settings_screen.dart';

class MoreController extends BaseController {
  // RxString profilePic =
  //     "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
  //         .obs;

  void onEditProfileOnClick() {
    navUtils.fireTarget(ProfileScreen());
  }

  void onSettingsOnClick() {
    navUtils.fireTarget(SettingsScreen());
  }

  void onLogOutOnClick(BuildContext context) {
    BottomSheetWidget(
      context: context,
      height: appDimen.screenHeight * 0.4,
      title: "Log Out",
      subChild: Padding(
        padding: EdgeInsets.all(10.dp()),
        child: Column(
          children: [
            AssetImageWidget(
              asset: icWarn,
              height: 80.dp(),
              width: 80.dp(),
            ),
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
            )
          ],
        ),
      ),
    );
  }

  void _onLogOutOnClick() {
    appPreference.logOut();
    navUtils.fireTargetOff(LoginScreen());
  }


  Future<void> onReadBibleOnClick(v) async {
    YouVersionUtils().openBibleReference();
  }

  void onCounsellingOnClick(v) {
    navUtils.fireTarget(
      BaseWebView(
          model: WebModel(
        url: "https://tawk.to/socialmediamissionary",
        title: "Counselling & Prayers",
      )),
    );
  }

  void onAboutOnClick() {
    navUtils.fireTarget(AboutScreen());
  }
}
