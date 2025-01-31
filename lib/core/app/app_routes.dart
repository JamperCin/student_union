import 'package:core_module/core_ui/base_screen/base_screen_impl.dart';
import 'package:get/get.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/screens/auth/login/login_screen.dart';
import 'package:student_union/screens/dashboard/main_dashboard_screen.dart';
import 'package:student_union/screens/intro/intro_screen.dart';

const String rootRoute = "/";

final appRoute = [
   GetPage(name: rootRoute, page: () => _getPage()),
  GetPage(name: '/LoginScreen', page: () => LoginScreen()),
  GetPage(name: '/MainDashboardScreen', page: () => MainDashboardScreen()),
];

BaseScreenImpl _getPage() {
  if (appPreference.isIntroShown()) {

    if (!appPreference.isLogin()) {
      return LoginScreen();
    }

    return MainDashboardScreen();
  } else {
    return IntroScreen();
  }
}
