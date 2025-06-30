import 'dart:collection';

import 'package:core_module/core/db/app_db_preference.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/utils/map_utils.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core/model/remote/base_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_union/core/model/remote/sign_up_response.dart';

import '../model/remote/customer_model.dart';

class AppPreference {
  static AppPreference? _instance;
  late SharedPreferences preference;

  final String PHONE_NUMBER = "telephone";

  // final String COUNTRY = "country";
  final String USER_DETAILS = "_USER_DETAILS";
  final String FOR_NAME = "forname";

   final String PROFILE_IMAGE = "profile_image";
  // final String ADDRESS = "address";
  final String PASSWORD = "password";
  final String TOKEN = "token";
  final String IS_LOGIN = "is_login";
  final String IS_INTRO_SHOWN = "is_intro";
  final String THEME_TYPE = "is_dark_theme";

  AppPreference._();

  Future<void> initPreference() async {
    preference = await SharedPreferences.getInstance();
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

  ///----------------- H E L P E R     M E T H O D S  E N D S ----------------

  // String getToken() {
  //   return "Bearer ${getString(TOKEN)}";
  // }

  bool isIntroShown() {
    return getBool(IS_INTRO_SHOWN);
  }

  bool isLogin() {
    return getBool(IS_LOGIN);
  }

  /*dynamic getSavedObject(String key) {
    String json = getString(key);
    if (json.isNotEmpty) {
      return MapUtils().convertDecode(json);
    } else {
      return null;
    }
  }*/


  void saveLoginDetails(
    BaseResponseModel response, {
    String? foreName,
    String? password,
  }) {
    appDbPreference.setToken(response.data?['token']);
    setBool(IS_LOGIN, true);
    if (foreName != null) {
      setString(PHONE_NUMBER, foreName);
    }
    if (password != null) {
      setString(PASSWORD, password);
    }
  }

  void setToken(String token) {
    setString(TOKEN, token);
  }

  void setUser(CustomerModel? user) {
    if (user != null) {
      setString(USER_DETAILS, MapUtils().convertEncode(user));
      appDbPreference.saveItem<CustomerModel>(item: user, key: USER_DETAILS);
    }
  }

  T? getSavedObject<T>(String key, T Function(dynamic) parser) {
    String json = getString(key);
    if (json.isNotEmpty) {
      return MapUtils().stringToObject(json, parser);
    } else {
      return null;
    }
  }

  CustomerModel? getUser() {
    return getSavedObject<CustomerModel>(USER_DETAILS, (json) => CustomerModel.fromJson(json));
  }

  void setDarkTheme(bool isThemeDark) {
    setBool(THEME_TYPE, isThemeDark);
  }

  bool getDarkTheme() {
    return getBool(THEME_TYPE);
  }

}
