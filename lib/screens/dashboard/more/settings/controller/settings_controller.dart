import 'package:core_module/core_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:student_union/core-ui/snippets/speech_to_voice/text_to_speech_Api.dart';
import 'package:student_union/core/app/theme_controller.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/screens/auth/forgot_password/ui/forgot_password_screen.dart';
import 'package:student_union/screens/dashboard/more/profile/ui/delete_account_profile_screen.dart';

class SettingsController extends BaseController {
  void onChangePasswordOnClick() {
    navUtils.fireTarget(ForgotPasswordScreen());
  }

  ///Confirm deletion of Account from the platform
  void onDeleteAccountOnClick(BuildContext context) {
    navUtils.fireTarget(DeleteAccountProfileScreen());
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

    BottomSheetWidget(
      context: context,
      height: appDimen.screenHeight * 0.4,
      title: "Select Speech Rate",
      subChild: ListItemWidget(
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
