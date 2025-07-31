import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/firebase_options.dart';

class FcmApi {
  static FcmApi? _instance;
  late FirebaseMessaging _firebaseMessaging;
  late BuildContext context;


  FcmApi._();

  factory FcmApi() {
    return _instance ??= FcmApi._();
  }

  ///Initialise Firebase
  /// Call this from [main.dart]
  Future<FirebaseApp> initializeFirebase() async {
    return  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<void> init(BuildContext context) async {
    this.context = context;
    _firebaseMessaging = FirebaseMessaging.instance;

    await _requestNotificationPermission();
    await _registerForeAndBackgroundListeners();
  }

  ///Call this function to request for permission on IOS devices to show notifications
  ///Permission needs to be enabled or accepted by user before this function can be used
  Future<void> _requestNotificationPermission() async {
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    debugPrint('User granted permission: ${settings.authorizationStatus}');
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      await _checkForFcmToken();
    }
  }

  ///Get token from FCM
  Future<void> _checkForFcmToken() async {
    await _firebaseMessaging.getToken().then((token) {
      debugPrint("FCM TOKEN ==== \n $token");
      if (token != null) _sendTokenToSerer(token);
    });
  }

  ///Send FCM Token to the server and save it locally to shared preference
  Future<void> _sendTokenToSerer(String token) async {
    if (appPreference.getFcmToken() != token) {
      final param = {
        'user': {
          "fcm_id": token,
        }
      };

      await notificationApiService.registerFcmToken(param);
      appPreference.setFcmToken(token);
    } else {
      print("push registered");
    }
  }

  ///Listen to foreground notifications
  Future<void> _registerForeAndBackgroundListeners() async {
    //on Foreground
    FirebaseMessaging.onMessage.listen(_handleForeground);

    //When user clicks on Notification to open app
    FirebaseMessaging.onMessageOpenedApp.listen(_handleOnNotificationOnClick);
  }

  Future<void> _handleForeground(RemoteMessage msg) async {
    debugPrint("Foreground messaging ======>>>> ${msg.toMap().toString()}");

  }

  Future<void> _handleOnNotificationOnClick(RemoteMessage msg) async {
    final initMess = await FirebaseMessaging.instance.getInitialMessage();
    if (initMess != null) {
      msg = initMess;
    }

  }

  Future<void> handleBackgroundMessageOnClick() async {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {});
    print("HANDLING --->  NTN");
  }
}
