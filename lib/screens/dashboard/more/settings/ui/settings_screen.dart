import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:student_union/core-ui/widgets/simple_card_item.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/res/asset_path.dart';

import '../controller/settings_controller.dart';

class SettingsScreen extends BaseScreenStandard {
  final _controller = Get.put(SettingsController());

  @override
  String appBarTitle() {
    return 'Settings';
  }

  @override
  bool showAppBar() {
    return true;
  }

  @override
  TextStyle? appBarTitleStyle(BuildContext context) {
    return super
        .appBarTitleStyle(context)
        ?.copyWith(fontWeight: FontWeight.w700);
  }

  @override
  Widget body(BuildContext context) {
    final prefixSize = 25.dp();
    const elevation = 0.0;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 10.dp(),
        horizontal: 10.dp(),
      ),
      child: Column(
        children: [
          SimpleCardItem(
            title: "Change Password",
            prefixAsset: icChangePassword,
            prefixAssetHeight: prefixSize,
            elevation: elevation,
            onTap: (v) {
              _controller.onChangePasswordOnClick;
            },
          ),
          Gap(10.dp()),
          SimpleCardItem(
            title: "Dark Theme",
            prefixAsset: icTheme,
            elevation: elevation,
            prefixAssetHeight: prefixSize,
            suffixWidget: Obx(
              () => Switch(
                value: isDarkTheme.value,
                onChanged: (isThemeDark) {
                  isDarkTheme.value = isThemeDark;
                },
                inactiveThumbColor: colorScheme.tertiary,
                activeColor: colorScheme.tertiary,
                inactiveTrackColor: colorScheme.primary,
                activeTrackColor: colorScheme.primary,
              ),
            ),
          ),
          Gap(10.dp()),
          SimpleCardItem(
            title: "Notification Settings",
            prefixAsset: icNotification,
            prefixAssetHeight: prefixSize,
            elevation: elevation,
          ),
          Gap(10.dp()),
          SimpleCardItem(
            title: "Delete Account",
            elevation: elevation,
            prefixAsset: icDeleteAccount,
            prefixAssetHeight: prefixSize,
          ),
          Gap(10.dp()),
        ],
      ),
    );
  }
}
