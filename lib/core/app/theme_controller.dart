import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_union/core/db/app_preference.dart';

class ThemeController extends GetxController {
  RxBool isDark = false.obs;

  Future<void> loadTheme() async {
    isDark.value = AppPreference().getDarkTheme();
  }

  void toggleTheme() {
    isDark.value = !isDark.value;
    AppPreference().setDarkTheme(isDark.value);
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: isDark.value ? Colors.black : Colors.white,
        statusBarIconBrightness:
        isDark.value ? Brightness.light : Brightness.dark,
        statusBarBrightness:
        isDark.value ? Brightness.dark : Brightness.light,
      ),
    );
  }
}