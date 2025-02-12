import 'package:student_union/core/db/app_preference.dart';
import 'package:student_union/core/services/devotional_guide/devotional_guide_api_service.dart';
import 'package:student_union/core/services/upcoming_events/upcoming_events_api_service.dart';
import 'package:student_union/core/services/user/user_api_service.dart';

late UserApiService userApiService;
late AppPreference appPreference;
late DevotionalGuideApiService devGuideService;
late UpcomingEventsApiService upcomingEventsApiService;