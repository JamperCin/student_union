import 'dart:io';

import 'package:core_module/core/def/global_def.dart';
import 'package:flutter/cupertino.dart';
import 'package:student_union/core-ui/screen/base_web.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/remote/campaign_model.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';
import 'package:student_union/core/model/remote/news_update_model.dart';
import 'package:student_union/core/model/remote/upcoming_event_model.dart';
import 'package:student_union/screens/dashboard/devotion/ui/devotion_screen.dart';
import 'package:student_union/screens/dashboard/devotion/ui/purchased_book_details_screen.dart';
import 'package:student_union/screens/dashboard/donate/ui/donations_core_ministries_screen.dart';
import 'package:student_union/screens/dashboard/donate/ui/donations_history_screen.dart';
import 'package:student_union/screens/dashboard/events/all_events_screen.dart';
import 'package:student_union/screens/dashboard/events/event_details_screen.dart';
import 'package:student_union/screens/dashboard/more/notifications/notificationsScreen.dart';
import 'package:student_union/screens/dashboard/more/profile/ui/profile_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/model/local/web_model.dart';
import '../devotion/ui/buy_devotional_book_screen.dart';
import '../donate/ui/donate_to_core_ministry_screen.dart';
import '../news/ui/news_screen.dart';

class HomeController extends BaseController {


  Future<void> onDonationOnClick(DonationModel model) async {
    if (Platform.isIOS) {
      final userEmail = appPreference.getUserEmail();
      var link =
          "https://www.sughana.app/donations?campaign_id=${model.id}&email=$userEmail";
      if (await canLaunchUrl(Uri.parse(link))) {
        launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
      }
    } else {
      navUtils.fireTarget(DonateToCoreMinistryScreen(), model: model);
    }
  }

  void onDevotionTap(DevotionalBookModel model) {
    navUtils.fireTarget(
      model.purchased
          ? PurchasedBookDetailsScreen()
          : BuyDevotionalBookScreen(),
      model: model,
    );
  }

  void onNewsUpdateTap(NewsUpdateModel news) {
    if (news.url.isEmpty) return;
    navUtils.fireTarget(
      BaseWebView(
        model: WebModel(
          url: news.url,
          title: news.title.isEmpty ? "News Update" : news.title,
        ),
      ),
    );
  }

  void onMoreNewsOnClick() {
    navUtils.fireTarget(NewsScreen());
  }

  void onSeeMoreCoreMinistries() {
    navUtils.fireTarget(DonationCoreMinistriesScreen());
  }

  void onSeeMoreDevotionalBooks() {
    navUtils.fireTarget(DevotionsScreen());
  }

  void onSearchOnClick() {}

  void onNotificationOnClick() {
    navUtils.fireTarget(NotificationsScreen());
  }

  void onProfileOnClick() {
    navUtils.fireTarget(ProfileScreen());
  }

  void onSeeMorePaymentHistory() {
    navUtils.fireTarget(DonationsHistoryScreen());
  }

  void onReadMoreOfDevotionalBook(DevotionalBookModel book) {
    navUtils.fireTarget(PurchasedBookDetailsScreen(), model: book);
  }

  void onUpcomingEventTap(BuildContext context, UpcomingEventModel event) {
    navUtils.fireTarget(EventDetailsScreen(event));
  }

  void onSeeAllUpcomingEvents() {
    navUtils.fireTarget(AllEventsScreen());
  }
}
