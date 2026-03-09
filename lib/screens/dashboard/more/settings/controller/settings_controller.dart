import 'package:core_module/core_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:student_union/core/app/app_routes.dart';
import 'package:student_union/core/app/theme_controller.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/utils/app_bottom_sheet.dart';

class SettingsController extends BaseController {
  void onChangePasswordOnClick() {
    AppRouter.pushNamed(AppRouteNames.forgotPassword);
  }

  ///Confirm deletion of Account from the platform
  void onDeleteAccountOnClick(BuildContext context) {
    AppRouter.pushNamed(AppRouteNames.deleteAccount);
  }

  void onThemeSwitch(bool isThemeDark) {
    Get.find<ThemeController>().toggleTheme();
  }

  List<Map<String, double>> getSpeechRatesList() {
    return [
      {"Fast Reading": 0.6},
      {"Normal Reading": 0.4},
      {"Slow Reading": 0.1},
    ];
  }

  void onChangeSpeechSettings(BuildContext context) {
    double selectedSpeechRateValue = appPreference.getSelectedSpeechRateValue();
    MapEntry<String, double>? speech = getSpeechRatesList()
        .firstWhere(
          (element) => element.values.first == selectedSpeechRateValue,
          orElse: () => {"Normal Reading": 0.4},
        )
        .entries
        .first;

    String selectedSpeechRateKey = speech.key;

    AppBottomSheet.showWithTitle(
      context: context,
      height: appDimen.screenHeight * 0.4,
      title: "Select Speech Rate",
      child: ListItemWidget(
        items: getSpeechRatesList().map((e) => e.keys.first).toList(),
        selectedItem: selectedSpeechRateKey,
        onTap: (item) {
          selectedSpeechRateKey = item;
          selectedSpeechRateValue = getSpeechRatesList().firstWhere(
            (element) => element.keys.first == item,
          )[item]!;
          appPreference.setSelectedSpeechRateValue(selectedSpeechRateValue);
        },
      ),
    );
  }
}
