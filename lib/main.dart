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
  await FcmApi().initializeFirebase();// Initialize Firebase if not already initialized

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

  runApp(const MyApp());

  // Set status bar color
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: primaryGreenColor, // Set the status bar color
      statusBarBrightness:
          Brightness.light, // For iOS (light text on status bar)
      statusBarIconBrightness:
          Brightness.light, // For Android (light icons on status bar)
    ),
  );
}

///Initialise the Core module library and other services here
Future<void> _initializeApp() async {
  await Future.delayed(const Duration(seconds: 1));
  appPreference = AppPreference();
  await appPreference.initPreference();
  isDarkTheme.value = appPreference.getDarkTheme();

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ratio = MediaQuery.of(context).size.height / MediaQuery.of(context).size.width;
    //debugPrint("Ratio: $ratio");
    appDimen = AppDimens(context,constantMultiplier: ratio - 0.15);

    return Obx(
      ()=> GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scripture Union',
        initialRoute: rootRoute,
        getPages: appRoute,
        theme: isDarkTheme.value ? darkMode : lightMode,
       // darkTheme: darkMode,
        // home: MyHomePage(),
      ),
    );
  }
}
