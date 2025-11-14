import 'dart:async';

import 'package:core_module/core/def/global_def.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/firebase_options.dart';
import 'package:student_union/screens/dashboard/devotion/ui/devotion_screen.dart';
import 'package:student_union/screens/dashboard/donate/ui/donations_history_screen.dart';

class FcmApi {
  static FcmApi? _instance;
  late FirebaseMessaging _firebaseMessaging;

  FcmApi._();

  factory FcmApi() {
    return _instance ??= FcmApi._();
  }

  ///Initialise Firebase
  /// Call this from [main.dart]
  Future<FirebaseApp> initializeFirebase() async {
    return await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<void> init() async {
    _firebaseMessaging = FirebaseMessaging.instance;
    await _registerListeners();
    await _requestNotificationPermission();
  }

  ///Call this function to request for permission on IOS devices to show notifications
  ///Permission needs to be enabled or accepted by user before this function can be used
  Future<void> _requestNotificationPermission() async {
    final settings = await _firebaseMessaging.requestPermission();

    debugPrint('User granted permission: ${settings.authorizationStatus}');
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      await checkForApnToken();
    }
  }


  Future<void> checkForApnToken() async {
    final apnsToken = await _firebaseMessaging.getAPNSToken();
    if (apnsToken != null) {
      final fcm = await _firebaseMessaging.getToken();
      debugPrint("FCM TOKEN: $fcm");
      _sendTokenToSerer(fcm);
    }

  }

  ///Send FCM Token to the server and save it locally to shared preference
  Future<void> _sendTokenToSerer(String? token) async {
    if (token == null) return;
    if (appPreference.getFcmToken() != token) {
      final param = {
        'user': {
          "fcm_id": token,
        }
      };

      final result = await notificationApiService.registerFcmToken(param);
      if (result.fcmToken.isNotEmpty) appPreference.setFcmToken(token);
    } else {
      debugPrint("FCM registered: $token");
    }
  }

  ///Listen to foreground notifications
  Future<void> _registerListeners() async {
    //on Foreground
    FirebaseMessaging.onMessage.listen(_handleForeground);

    //When user clicks on Notification to open app
    FirebaseMessaging.onMessageOpenedApp.listen(_handleOnNotificationOnClick);

    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      debugPrint('New FCM Token: $newToken');
      _sendTokenToSerer(newToken);
    });

  }

  /// Handle foreground messages
  /// This is called when the app is in the foreground and a notification is received
  Future<void> _handleForeground(RemoteMessage msg) async {
    debugPrint(
        "Foreground Running ====>> ${msg.notification?.toMap().toString()}");
    notificationApi.showNotification(
      id: 1,
      title: msg.notification?.title,
      body: msg.notification?.body,
      payload: msg.data,
    );
    handleFcmMessage(msg);
  }

  /// Handle notification click
  /// This is called when the user clicks on a notification and the app is opened from a terminated state
  Future<void> _handleOnNotificationOnClick(RemoteMessage msg) async {
    // Get the initial message if the app was opened from a terminated state
    final initMess = await FirebaseMessaging.instance.getInitialMessage();
    if (initMess != null) {
      msg = initMess;
    }
    // TODO: Handle the notification click
  }

  ///Handle all notifications at one central place
  Future<void> handleFcmMessage(RemoteMessage msg) async {
    notificationCount.value = notificationCount.value + 1;
    appPreference.setNotificationCount(notificationCount.value);

    Map<String, dynamic> data = msg.data;
    debugPrint("Data ====>> ${data.toString()}");

    String type = data.containsKey('payment_type') ? data['payment_type'] : '';
    String status = data.containsKey('status') ? data['status'] : '';

    // switch (type) {
    //   case 'campaign_donation':
    //     navUtils.fireTarget(DonationsHistoryScreen());
    //     break;
    //     case 'devotional_year_purchase':
    //       navUtils.fireTarget(DevotionsScreen());
    //       break;
    //   default:
    //     break;
    //
    // }
  }

  Future<void> handleNotificationInStack() async {
    final msg = await FirebaseMessaging.instance.getInitialMessage();
    if (msg != null) {
      Map<String, dynamic> data = msg.data;
      debugPrint("Data ====>> ${data.toString()}");

      String type =
          data.containsKey('payment_type') ? data['payment_type'] : '';
      String status = data.containsKey('status') ? data['status'] : '';

      switch (type) {
        case 'campaign_donation':
          navUtils.fireTarget(DonationsHistoryScreen());
          break;
        case 'devotional_year_purchase':
          navUtils.fireTarget(DevotionsScreen());
          break;
        default:
          break;
      }
    } else {
      debugPrint("No notification in stack");
      navUtils.fireTargetHome();
    }
  }
}
