import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/widgets/simple_card_item.dart';
import 'package:student_union/core/app/theme_controller.dart';
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
              _controller.onChangePasswordOnClick();
            },
          ),
          Gap(10.dp()),
          Obx(
            () => SimpleCardItem(
              title: Get.find<ThemeController>().isDark.value ? "Dark Theme" : "Light Theme",
              //prefixAsset: icTheme,
              prefixWidget: Icon(
                Get.find<ThemeController>().isDark.value ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                color: colorScheme.primary,
              ),
              elevation: elevation,
              prefixAssetHeight: prefixSize,
              suffixWidget: SizedBox(
                height: 25.dp(),
                child: Switch(
                  value: Get.find<ThemeController>().isDark.value,
                  onChanged: _controller.onThemeSwitch,
                  inactiveThumbColor: colorScheme.surface,
                  activeColor: colorScheme.surface,
                  inactiveTrackColor: colorScheme.primary,
                  activeTrackColor: colorScheme.primary,
                ),
              ),
            ),
          ),
          // Gap(10.dp()),
          // SimpleCardItem(
          //   title: "Notification Settings",
          //   prefixAsset: icNotification,
          //   prefixAssetHeight: prefixSize,
          //   elevation: elevation,
          // ),
          Gap(10.dp()),
          SimpleCardItem(
            title: "Delete Account",
            elevation: elevation,
            prefixAsset: icDeleteAccount,
            prefixAssetHeight: prefixSize,
            onTap: (v) {
              _controller.onDeleteAccountOnClick(context);
            },
          ),
          Gap(10.dp()),
        ],
      ),
    );
  }
}
