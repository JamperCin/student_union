import 'package:core_module/core/app/app_dimens.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/enum/env_type.dart';
import 'package:core_module/core_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:student_union/firebase_options.dart';
import 'core/services/auth/auth_api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    appDimen = AppDimens(context,constantMultiplier: 1.75);

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
