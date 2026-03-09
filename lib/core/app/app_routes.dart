import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_union/core-ui/screen/base_web.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/local/success_model.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/core/model/remote/app_update_model.dart';
import 'package:student_union/core/model/remote/campaign_model.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';
import 'package:student_union/core/model/remote/upcoming_event_model.dart';
import 'package:student_union/screens/auth/forgot_password/ui/forgot_password_screen.dart';
import 'package:student_union/screens/auth/login/login_screen.dart';
import 'package:student_union/screens/auth/sign_up/sign_up_screen.dart';
import 'package:student_union/screens/dashboard/devotion/ui/buy_devotional_book_screen.dart';
import 'package:student_union/screens/dashboard/devotion/ui/devotion_screen.dart';
import 'package:student_union/screens/dashboard/devotion/ui/purchased_book_details_screen.dart';
import 'package:student_union/screens/dashboard/donate/ui/donate_to_core_ministry_screen.dart';
import 'package:student_union/screens/dashboard/donate/ui/donations_core_ministries_screen.dart';
import 'package:student_union/screens/dashboard/donate/ui/donations_history_screen.dart';
import 'package:student_union/screens/dashboard/events/all_events_screen.dart';
import 'package:student_union/screens/dashboard/events/event_details_screen.dart';
import 'package:student_union/screens/dashboard/home/home_screen.dart';
import 'package:student_union/screens/dashboard/main_dashboard_screen.dart';
import 'package:student_union/screens/dashboard/more/about/about_screen.dart';
import 'package:student_union/screens/dashboard/more/app_update/app_update_screen.dart';
import 'package:student_union/screens/dashboard/more/more_screen.dart';
import 'package:student_union/screens/dashboard/more/notifications/notificationsScreen.dart';
import 'package:student_union/screens/dashboard/more/profile/ui/delete_account_profile_screen.dart';
import 'package:student_union/screens/dashboard/more/profile/ui/profile_screen.dart';
import 'package:student_union/screens/dashboard/more/settings/ui/settings_screen.dart';
import 'package:student_union/screens/dashboard/news/ui/news_screen.dart';
import 'package:student_union/screens/intro/intro_screen.dart';
import 'package:student_union/screens/shared/success_screen.dart';

class AppRouteNames {
  static const String intro = 'intro';
  static const String login = 'login';
  static const String signUp = 'sign-up';
  static const String forgotPassword = 'forgot-password';

  static const String dashboardHome = 'dashboard-home';
  static const String dashboardDevotional = 'dashboard-devotional';
  static const String dashboardDonation = 'dashboard-donation';
  static const String dashboardNews = 'dashboard-news';
  static const String dashboardMore = 'dashboard-more';

  static const String web = 'web';
  static const String notifications = 'notifications';
  static const String profile = 'profile';
  static const String settings = 'settings';
  static const String deleteAccount = 'delete-account';
  static const String about = 'about';
  static const String donationsHistory = 'donations-history';
  static const String donateToCoreMinistry = 'donate-to-core-ministry';
  static const String buyDevotionalBook = 'buy-devotional-book';
  static const String purchasedBookDetails = 'purchased-book-details';
  static const String allEvents = 'all-events';
  static const String eventDetails = 'event-details';
  static const String success = 'success';
  static const String appUpdate = 'app-update';
}

class AppRoutePaths {
  static const String root = '/';
  static const String intro = '/intro';
  static const String login = '/login';
  static const String signUp = '/sign-up';
  static const String forgotPassword = '/forgot-password';

  static const String dashboardHome = '/dashboard/home';
  static const String dashboardDevotional = '/dashboard/devotional';
  static const String dashboardDonation = '/dashboard/donation';
  static const String dashboardNews = '/dashboard/news';
  static const String dashboardMore = '/dashboard/more';

  static const String web = '/web';
  static const String notifications = '/notifications';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String deleteAccount = '/delete-account';
  static const String about = '/about';
  static const String donationsHistory = '/donations-history';
  static const String donateToCoreMinistry = '/donate-to-core-ministry';
  static const String buyDevotionalBook = '/buy-devotional-book';
  static const String purchasedBookDetails = '/purchased-book-details';
  static const String allEvents = '/all-events';
  static const String eventDetails = '/event-details';
  static const String success = '/success';
  static const String appUpdate = '/app-update';
}

class SuccessRouteExtra {
  final SuccessModel model;
  final VoidCallback? onDone;

  SuccessRouteExtra({required this.model, this.onDone});
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutePaths.root,
  navigatorKey: AppRouter.rootNavigatorKey,
  redirect: AppRouter.redirect,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutePaths.intro,
      name: AppRouteNames.intro,
      builder: (_, __) => IntroScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.login,
      name: AppRouteNames.login,
      builder: (_, __) => LoginScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.signUp,
      name: AppRouteNames.signUp,
      builder: (_, __) => SignUpScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.forgotPassword,
      name: AppRouteNames.forgotPassword,
      builder: (_, __) => ForgotPasswordScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainDashboardScreen(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutePaths.dashboardHome,
              name: AppRouteNames.dashboardHome,
              builder: (_, __) => HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutePaths.dashboardDevotional,
              name: AppRouteNames.dashboardDevotional,
              builder: (_, __) => DevotionsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutePaths.dashboardDonation,
              name: AppRouteNames.dashboardDonation,
              builder: (_, __) => DonationCoreMinistriesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutePaths.dashboardNews,
              name: AppRouteNames.dashboardNews,
              builder: (_, __) => NewsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutePaths.dashboardMore,
              name: AppRouteNames.dashboardMore,
              builder: (_, __) => MoreScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      path: AppRoutePaths.web,
      name: AppRouteNames.web,
      builder: (_, state) {
        final webModel = state.extra is WebModel
            ? state.extra! as WebModel
            : WebModel();
        return BaseWebView(model: webModel);
      },
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      path: AppRoutePaths.notifications,
      name: AppRouteNames.notifications,
      builder: (_, __) => NotificationsScreen(),
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      path: AppRoutePaths.profile,
      name: AppRouteNames.profile,
      builder: (_, __) => ProfileScreen(),
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      path: AppRoutePaths.settings,
      name: AppRouteNames.settings,
      builder: (_, __) => SettingsScreen(),
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      path: AppRoutePaths.deleteAccount,
      name: AppRouteNames.deleteAccount,
      builder: (_, __) => DeleteAccountProfileScreen(),
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      path: AppRoutePaths.about,
      name: AppRouteNames.about,
      builder: (_, __) => AboutScreen(),
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      path: AppRoutePaths.donationsHistory,
      name: AppRouteNames.donationsHistory,
      builder: (_, __) => DonationsHistoryScreen(),
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      path: AppRoutePaths.donateToCoreMinistry,
      name: AppRouteNames.donateToCoreMinistry,
      builder: (_, state) {
        final donation = state.extra is DonationModel
            ? state.extra! as DonationModel
            : const DonationModel();
        return DonateToCoreMinistryScreen(donation: donation);
      },
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      path: AppRoutePaths.buyDevotionalBook,
      name: AppRouteNames.buyDevotionalBook,
      builder: (_, state) {
        final book = state.extra is DevotionalBookModel
            ? state.extra! as DevotionalBookModel
            : const DevotionalBookModel();
        return BuyDevotionalBookScreen(book: book);
      },
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      path: AppRoutePaths.purchasedBookDetails,
      name: AppRouteNames.purchasedBookDetails,
      builder: (_, state) {
        final book = state.extra is DevotionalBookModel
            ? state.extra! as DevotionalBookModel
            : const DevotionalBookModel();
        return PurchasedBookDetailsScreen(book: book);
      },
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      path: AppRoutePaths.allEvents,
      name: AppRouteNames.allEvents,
      builder: (_, __) => AllEventsScreen(),
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      path: AppRoutePaths.eventDetails,
      name: AppRouteNames.eventDetails,
      builder: (_, state) {
        final event = state.extra is UpcomingEventModel
            ? state.extra! as UpcomingEventModel
            : const UpcomingEventModel();
        return EventDetailsScreen(event);
      },
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      path: AppRoutePaths.success,
      name: AppRouteNames.success,
      builder: (_, state) {
        final extra = state.extra;

        if (extra is SuccessRouteExtra) {
          return SuccessScreen(model: extra.model, onTap: extra.onDone);
        }

        final model = extra is SuccessModel ? extra : const SuccessModel();
        return SuccessScreen(model: model);
      },
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      path: AppRoutePaths.appUpdate,
      name: AppRouteNames.appUpdate,
      builder: (_, state) {
        final model = state.extra is AppUpdateModel
            ? state.extra! as AppUpdateModel
            : AppUpdateModel();
        return AppUpdateScreen(model: model);
      },
    ),
  ],
);

class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root-nav');

  static final Set<String> _authPaths = <String>{
    AppRoutePaths.login,
    AppRoutePaths.signUp,
    AppRoutePaths.forgotPassword,
  };
  static final Set<String> _publicPathsWhenLoggedOut = <String>{
    AppRoutePaths.login,
    AppRoutePaths.signUp,
    AppRoutePaths.forgotPassword,
    AppRoutePaths.web,
    AppRoutePaths.success,
  };

  static String? redirect(BuildContext context, GoRouterState state) {
    final path = state.uri.path;
    final introShown = appPreference.isIntroShown();
    final authenticated = _isAuthenticated();

    if (path == AppRoutePaths.root) {
      if (!introShown) return AppRoutePaths.intro;
      if (!authenticated) return AppRoutePaths.login;
      return AppRoutePaths.dashboardHome;
    }

    if (!introShown) {
      return path == AppRoutePaths.intro ? null : AppRoutePaths.intro;
    }

    if (!authenticated) {
      return _publicPathsWhenLoggedOut.contains(path)
          ? null
          : AppRoutePaths.login;
    }

    if (path == AppRoutePaths.intro || _authPaths.contains(path)) {
      return AppRoutePaths.dashboardHome;
    }

    return null;
  }

  static bool _isAuthenticated() {
    return appPreference.isLogin() ||
        appPreference.getString(appPreference.TOKEN).isNotEmpty ||
        isGuestUser.value;
  }

  static Future<T?> pushNamed<T extends Object?>(String name, {Object? extra}) {
    return appRouter.pushNamed<T>(name, extra: extra);
  }

  static void goNamed(String name, {Object? extra}) {
    appRouter.goNamed(name, extra: extra);
  }

  static void goHome() {
    appRouter.goNamed(AppRouteNames.dashboardHome);
  }

  static void goToTabByLabel(String screen) {
    switch (screen.toLowerCase()) {
      case 'devotional':
        appRouter.goNamed(AppRouteNames.dashboardDevotional);
        break;
      case 'donation':
        appRouter.goNamed(AppRouteNames.dashboardDonation);
        break;
      case 'news update':
      case 'news':
        appRouter.goNamed(AppRouteNames.dashboardNews);
        break;
      case 'more':
        appRouter.goNamed(AppRouteNames.dashboardMore);
        break;
      default:
        appRouter.goNamed(AppRouteNames.dashboardHome);
        break;
    }
  }

  static void goToTabByIndex(int index) {
    switch (index) {
      case 1:
        appRouter.goNamed(AppRouteNames.dashboardDevotional);
        break;
      case 2:
        appRouter.goNamed(AppRouteNames.dashboardDonation);
        break;
      case 3:
        appRouter.goNamed(AppRouteNames.dashboardNews);
        break;
      case 4:
        appRouter.goNamed(AppRouteNames.dashboardMore);
        break;
      default:
        appRouter.goNamed(AppRouteNames.dashboardHome);
        break;
    }
  }

  static bool pop<T extends Object?>([T? result]) {
    if (!appRouter.canPop()) return false;
    appRouter.pop(result);
    return true;
  }
}
