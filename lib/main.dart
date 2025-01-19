import 'package:core_module/core_module.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_union/core/app/app_colors.dart';
import 'package:student_union/core/app/app_routes.dart';
import 'package:student_union/core/app/app_theme.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/services/user/user_api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  ///Initialise the Core module library and other services here
  await CoreModule().init(envPath: 'assets/data/env.json');
  userApiService = UserApiService();

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    CoreModule().init(context: context);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Union',
      initialRoute: rootRoute,
      getPages: appRoute,
      theme: lightMode,
      darkTheme: darkMode,
      // home: MyHomePage(),
    );
  }
}
