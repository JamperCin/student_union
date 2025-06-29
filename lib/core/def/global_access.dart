import 'package:core_module/core_module.dart';
import 'package:student_union/core/db/app_preference.dart';
import 'package:student_union/core/services/auth/auth_api_service.dart';
import 'package:student_union/core/services/campaigns/campaigns_api_service.dart';
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
late CampaignApiService campaignApiService;
late NewsUpdateApiService newsUpdateApiService;
late AuthApiService authApiService;
late PaymentApiService paymentApiService;
late NotificationApiService notificationApiService;

///--------------------------------------------------------------

RxBool isDarkTheme = false.obs;