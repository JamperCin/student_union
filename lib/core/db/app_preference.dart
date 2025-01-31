import 'dart:collection';

import 'package:core_module/core/db/app_db_preference.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/utils/map_utils.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core/model/remote/base_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static AppPreference? _instance;
  late SharedPreferences preference;

  // final String FULL_NAME = "full_name";
  // final String FIRST_NAME = "first_name";
  // final String LAST_NAME = "surname";
  // final String EMAIL = "email";
  // final String GENDER = "gender";
  final String PHONE_NUMBER = "telephone";

  // final String COUNTRY = "country";
  final String USER_DETAILS = "_USER_DETAILS";
  final String FOR_NAME = "forname";

  // final String USERNAME = "username";
  // final String ADDRESS = "address";
  final String PASSWORD = "password";
  final String TOKEN = "token";
  final String IS_LOGIN = "is_login";
  final String IS_INTRO_SHOWN = "is_intro";

  // final String NEED_VERIFICATION = "need_verification";
  // final String IS_USER_ACTIVE = "IS_USER_ACTIVE";
  // final String IS_USER_BLOCKED = "IS_USER_BLOCKED";
  // final String PERSON_ID = "PERSON_ID";
  // final String USER_ID = "USER_ID";
  // final String PERSON_TYPE_ID = "PERSON_TYPE_ID";
  // final String PERSON_TYPE = "PERSON_TYPE";
  // final String VERIFIED_TOKEN = "VERIFIED_TOKEN";
  // final String SECURITY_PIN = "SECURITY_PIN";
  // final String MENU_CAT_LIST = "MENU_CAT_LIST";
  // final String CONTACT_PERMISSION_ALLOWED = "CONTACT_PERMISSION_ALLOWED";
  // final String SECURITY_QUESTIONS = "SECURITY_QUESTIONS_ADDED";
  // final String PROFILE_PIC = "profile_pic_url";
  // final String PRIME_WALLET_BALANCE = "prime_wallet_balance";
  final String PRIME_WALLET = "prime_wallet_";

  // final String PRIME_WALLET_CURRENCY = "prime_wallet_currency";
  // final String PRIME_WALLET_ID = "prime_wallet_id";
  // final String IS_REVIEW_POP_SHOWN = "IS_REVIEW_POP_SHOWN";
  // final String IS_GIFTING_INTRO_SHOWN = "IS_GIFTING_INTRO_SHOWN";
  // final String IS_RE_GIFTING_INTRO_SHOWN = "IS_RE_GIFTING_INTRO_SHOWN";
  // final String FCM = "prime_fcm_token";
  // final String NOTIFY_DAILY_REMINDER = "NOTIFY_DAILY_REMINDER";
  // final String PLACES = "PLACES_SUGGESTED";
  // final String SELECTED_LOCATION = "SELECTED_LOCATION";
  // final String LOCATION = "LOCATION";
  // final String DATE_JOINED = "DATE_JOINED";
  // final String DAILY_TIP = "DAILY_TIP";
  // final String PREF_LOCATION = "PREF_LOCATION";
  // final String PREF_LOCATION_LIST = "PREF_LOCATION_LIST";
  // final String IMAGE_PERMISSION_ALLOWED = "IMAGE_PERMISSION_ALLOWED";
  // final String LOCATION_PERMISSION_ALLOWED = "LOCATION_PERMISSION_ALLOWED";

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

  // void saveUserDetails(Customer customer) {
  //   if (customer.phoneNumber.isEmpty) {
  //     return;
  //   }
  //
  //   setString(USER_DETAILS, MapUtils().convertEncode(customer));

    // preference.setString(EMAIL, customer.email);
    //
    // preference.setString(DATE_JOINED, customer.joinedSince);
    //
    // preference.setString(PHONE_NUMBER, customer.phoneNumber);
    // preference.setBool(IS_USER_ACTIVE, customer.active);
    // preference.setBool(IS_USER_BLOCKED, customer.blocked);
    //
    // preference.setInt(USER_ID, customer.id);
    //
    // preference.setString(
    //     VERIFIED_TOKEN, customer.verificationToken);
    //
    // Person? person = customer.person;
    //
    // if (person != null) {
    //   preference.setInt(PERSON_TYPE_ID, person.personTypeId);
    //   preference.setInt(PERSON_ID, person.personId);
    //
    //   preference.setString(PERSON_TYPE, person.personType);
    //
    //   preference.setString(PROFILE_PIC, person.profilePicUrl);
    //
    //   preference.setString(FIRST_NAME, person.firstName);
    //   preference.setString(LAST_NAME, person.surname);
    //   preference.setString(FULL_NAME, person.fullName);
    // }
 // }

  // void savePrimeWalletDetails(Account account) {
  //   setString(PRIME_WALLET, MapUtils().convertEncode(account));
  //
  //   /*preference.setDouble(PRIME_WALLET_BALANCE, account.availableBalance);
  //
  //   preference.setString(PRIME_WALLET_CURRENCY, account.currency);
  //
  //   preference.setInt(PRIME_WALLET_ID, account.id);*/
  // }

  void setToken(String token) {
    setString(TOKEN, token);
  }
}
