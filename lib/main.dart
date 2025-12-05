import 'dart:io';

import 'package:core_module/core_module.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:student_union/core/api/fcm_api.dart';
import 'package:student_union/core/api/notification_api.dart';
import 'package:student_union/core/app/app_colors.dart';
import 'package:student_union/core/app/app_routes.dart';
import 'package:student_union/core/app/app_theme.dart';
import 'package:student_union/core/db/app_preference.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/core/services/campaigns/campaigns_api_service.dart';
import 'package:student_union/core/services/devotional_guide/devotional_guide_api_service.dart';
import 'package:student_union/core/services/news_update/news_update_api_service.dart';
import 'package:student_union/core/services/notifications/notification_api_service.dart';
import 'package:student_union/core/services/payment/payment_api_service.dart';
import 'package:student_union/core/services/upcoming_events/upcoming_events_api_service.dart';
import 'package:student_union/core/services/user/user_api_service.dart';
import 'core/services/auth/auth_api_service.dart';

@pragma('vm:entry-point')
Future<void> firebaseBackgroundMessageHandler(RemoteMessage msg) async {
  debugPrint("Background messaging ======>>>> ${msg.toMap().toString()}");
  await FcmApi()
      .initializeFirebase(); // Initialize Firebase if not already initialized

  FcmApi().handleFcmMessage(msg);
  // Perform background tasks based on the message data
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse not) {
  // handle action
  debugPrint("on Tap messaging ======>>>> ${not.data.toString()}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FcmApi().initializeFirebase();
  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundMessageHandler);

  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  await _initializeApp();

  // Setup dependency
  final themeController = Get.put(ThemeController());
  await themeController.loadTheme();

  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Light background
      statusBarIconBrightness: Brightness.dark, // Dark icons for Android
      statusBarBrightness: Brightness.light, // Dark icons for iOS
    ),
  );
}

///Initialise the Core module library and other services here
Future<void> _initializeApp() async {
  await Future.delayed(const Duration(seconds: 1));
  appPreference = AppPreference();
  await appPreference.initPreference();

  await CoreModule().init(
    envPath: icEnvPath,
    defaultEnv: EnvType.production,
    loginScreen: 'LoginScreen',
    homePageScreen: 'MainDashboardScreen',
  );
  userApiService = UserApiService();
  appPreference = AppPreference();
  devGuideService = DevotionalGuideApiService();
  upcomingEventsApiService = UpcomingEventsApiService();
  campaignApiService = CampaignApiService();
  newsUpdateApiService = NewsUpdateApiService();
  authApiService = AuthApiService();
  paymentApiService = PaymentApiService();
  notificationApiService = NotificationApiService();
  notificationApi = NotificationApi();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    // Wrap with LayoutBuilder to get proper MediaQuery before building the app
    return LayoutBuilder(
      builder: (context, constraints) {
        final mq = MediaQuery.of(context);
        double ratio = mq.size.height / mq.size.width;
        ratio = Platform.isAndroid && ratio > 1.75 ? ratio : 1.8;

        // Initialize appDimen BEFORE theme usage
        appDimen = AppDimens(context, constantMultiplier: ratio);

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Scripture Union',
          initialRoute: rootRoute,
          getPages: appRoute,
          theme: lightMode, // uses appDimen safely now
          darkTheme: darkMode,
          themeMode:
          themeController.isDark.value ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}



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