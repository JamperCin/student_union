import 'package:core_module/core_module.dart';
import 'package:student_union/core/def/global_access.dart';

import '../model/remote/customer_model.dart';

class AppPreference {
  static AppPreference? _instance;
  late SharedPreferences preference;

  final String PHONE_NUMBER = "telephone";
  final String USER_DETAILS = "_USER_DETAILS";
  final String PROFILE_IMAGE = "profile_image";
  final String PASSWORD = "password";
  final String TOKEN = "token";
  final String FCM_TOKEN = "fcm_token";
  final String IS_LOGIN = "is_login";
  final String IS_INTRO_SHOWN = "is_intro";
  final String THEME_TYPE = "is_dark_theme";
  final String NOTIFICATION_COUNT = "notification_count";
  final String SELECTED_SPEECH_RATE_VALUE = "selected_speech_rate_value";

  AppPreference._();

  Future<void> initPreference() async {
    preference = await SharedPreferences.getInstance();
    notificationCount.value = getInt(NOTIFICATION_COUNT);
  }

  factory AppPreference() {
    return _instance ??= AppPreference._();
  }

  Future<AppPreference> reset() async {
    _instance = AppPreference._();
    await initPreference();
    return this;
  }

  ///----------------- H E L P E R     M E T H O D S ------------------
  void setBool(String key, bool value) {
    preference.setBool(key, value);
  }

  void setString(String key, String value) {
    preference.setString(key, value);
  }

  void setDouble(String key, double value) {
    preference.setDouble(key, value);
  }

  bool getBool(String key) {
    return preference.getBool(key) ?? false;
  }

  String getString(String key) {
    return preference.getString(key) ?? "";
  }

  double getDouble(String key) {
    return preference.getDouble(key) ?? 0.00;
  }

  int getInt(String key) {
    return preference.getInt(key) ?? 0;
  }

  void setInt(String key, int value) {
    preference.setInt(key, value);
  }

  void setDoubleList(String key, List<double> value) {
    preference.setStringList(key, value.map((e) => e.toString()).toList());
  }

  List<double> getDoubleList(String key) {
    return preference
            .getStringList(key)
            ?.map((e) => double.parse(e))
            .toList() ??
        [];
  }

  ///----------------- H E L P E R     M E T H O D S  E N D S ----------------

  bool isIntroShown() {
    return getBool(IS_INTRO_SHOWN);
  }

  bool isLogin() {
    return getBool(IS_LOGIN);
  }

  void setToken(String token) {
    setString(TOKEN, token);
  }

  void setPassword(String password) {
    setString(PASSWORD, password);
  }

  void setUser(CustomerModel? user) {
    if (user != null) {
      setString(PROFILE_IMAGE, user.profilePic);
      //setString(USER_DETAILS, MapUtils().convertEncode(user));
      appDbPreference.saveItem<CustomerModel>(item: user, key: USER_DETAILS);
    }
    setBool(IS_LOGIN, true);
  }

  CustomerModel getUser() {
    return appDbPreference.getItem<CustomerModel>(
      key: USER_DETAILS,
      parser: (json) => CustomerModel.fromJson(json),
      defaultValue: const CustomerModel(),
    );
  }

  void setDarkTheme(bool isThemeDark) {
    setBool(THEME_TYPE, isThemeDark);
  }

  bool getDarkTheme() {
    return getBool(THEME_TYPE);
  }

  String getPassword() {
    return getString(PASSWORD);
  }

  void logOut() {
    bool theme = getBool(THEME_TYPE);
    bool intro = getBool(IS_INTRO_SHOWN);
    preference.clear();
    setBool(IS_INTRO_SHOWN, intro);
    setBool(THEME_TYPE, theme);
  }

  String getFcmToken() {
    return getString(FCM_TOKEN);
  }

  void setFcmToken(String token) {
    setString(FCM_TOKEN, token);
  }

  void setNotificationCount(int value) {
    setInt(NOTIFICATION_COUNT, value);
  }

  double getSelectedSpeechRateValue() {
    return getDouble(SELECTED_SPEECH_RATE_VALUE) == 0.00
        ? 0.4
        : getDouble(SELECTED_SPEECH_RATE_VALUE);
  }

  void setSelectedSpeechRateValue(double value) {
    setDouble(SELECTED_SPEECH_RATE_VALUE, value);
  }
  
}
