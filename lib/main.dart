import 'package:core_module/core/app/app_dimens.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/enum/env_type.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_union/core/app/app_colors.dart';
import 'package:student_union/core/app/app_routes.dart';
import 'package:student_union/core/app/app_theme.dart';
import 'package:student_union/core/db/app_preference.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/core/services/user/user_api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  await _initializeApp();

  runApp(const MyApp());

  // Set status bar color
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: orangePrimaryColor, // Set the status bar color
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
  await CoreModule().init(
    envPath: icEnvPath,
    defaultEnv: EnvType.staging,
    loginScreen: 'LoginScreen',
    homePageScreen: 'MainDashboardScreen',
  );
  userApiService = UserApiService();
  appPreference = AppPreference();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    appDimen = AppDimens(context);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scripture Union',
      initialRoute: rootRoute,
      getPages: appRoute,
      theme: lightMode,
      darkTheme: darkMode,
      // home: MyHomePage(),
    );
  }
}
