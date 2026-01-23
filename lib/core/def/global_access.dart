import 'package:core_module/core_module.dart';
import 'package:student_union/core/api/notification_api.dart';
import 'package:student_union/core/db/app_preference.dart';
import 'package:student_union/core/enums/book_type.dart';
import 'package:student_union/core/services/auth/auth_api_service.dart';
import 'package:student_union/core/services/campaigns/donations_api_service.dart';
import 'package:student_union/core/services/devotional_guide/devotional_guide_api_service.dart';
import 'package:student_union/core/services/news_update/news_update_api_service.dart';
import 'package:student_union/core/services/notifications/notification_api_service.dart';
import 'package:student_union/core/services/payment/payment_api_service.dart';
import 'package:student_union/core/services/upcoming_events/upcoming_events_api_service.dart';
import 'package:student_union/core/services/user/user_api_service.dart';

late UserApiService userApiService;
late AppPreference appPreference;
late DevotionalGuideApiService devGuideService;
late UpcomingEventsApiService upcomingEventsApiService;
late DonationsService campaignApiService;
late NewsUpdateApiService newsUpdateApiService;
late AuthApiService authApiService;
late PaymentApiService paymentApiService;
late NotificationApiService notificationApiService;
late NotificationApi notificationApi;

///--------------------------------------------------------------

RxInt notificationCount = 0.obs;
Rxn<dynamic> currentEvent = Rxn<dynamic>();

bool isMayBeLaterSet = false;

class EventTrigger {
  BookType? bookType;
  String screen;
  BaseObject? model;

  EventTrigger({this.bookType, required this.screen, this.model});
}

String decodeErrorMessage(
  String error, {
  String defaultMsg = "Sorry, something went wrong. Kindly try again",
}) {
  if (error.contains("EMAIL_EXISTS")) {
    return "The email address is already in use by another account.";
  } else if (error.contains("INVALID_LOGIN_CREDENTIALS")) {
    return "The email or password provided is incorrect. Please try again.";
  } else if (error.contains("USER_DISABLED")) {
    return "The user account has been disabled by an administrator. Please contact support for assistance.";
  } else if (error.contains("EMAIL_NOT_FOUND")) {
    return "There is no user record corresponding to this identifier. The user may have been deleted.";
  } else {
    return defaultMsg;
  }
}
