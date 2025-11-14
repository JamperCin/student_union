import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_impl.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/screens/auth/login/login_screen.dart';
import 'package:student_union/screens/dashboard/devotion/ui/devotion_screen.dart';
import 'package:student_union/screens/dashboard/devotion/ui/purchased_book_details_screen.dart';
import 'package:student_union/screens/dashboard/main_dashboard_screen.dart';
import 'package:student_union/screens/intro/intro_screen.dart';

const String rootRoute = "/";
const String routeScreen = "/MainDashboardScreen/Devotional/PurchasedBookDetailsScreen";

final appRoute = [
  GetPage(name: rootRoute, page: () => _getPage()),
  GetPage(name: '/LoginScreen', page: () => LoginScreen()),
  GetPage(name: '/MainDashboardScreen/Devotional', page: () => DevotionsScreen()),
  GetPage(name: '/MainDashboardScreen', page: () => MainDashboardScreen(), children: [
    GetPage(name: '/Devotional', page: () => DevotionsScreen(), children: [
      GetPage(name: '/PurchasedBookDetailsScreen', page: () => PurchasedBookDetailsScreen()),
    ]),
  ]),

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
