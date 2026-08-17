import 'dart:convert';
import 'dart:io';

import 'package:core_module/core_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:student_union/core/app/app_routes.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/remote/campaign_model.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';
import 'package:student_union/core/model/remote/news_update_model.dart';
import 'package:student_union/core/model/remote/upcoming_event_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/model/local/web_model.dart';

class HomeController extends BaseController {
  final RxInt refreshTick = 0.obs;

  Future<void> onRefresh() async {
    await _refreshInBackgroundIfChanged(onlyWhenHasCachedData: false);
  }

  Future<void> onTabOpened() async {
    await _refreshInBackgroundIfChanged(onlyWhenHasCachedData: true);
  }

  Future<void> _refreshInBackgroundIfChanged({
    required bool onlyWhenHasCachedData,
  }) async {
    if (onlyWhenHasCachedData && !_hasCachedHomeData()) {
      return;
    }

    final previousSignature = _homeDataSignature();
    try {
      await Future.wait([
        devGuideService.fetchDailyDevotion(forceRefresh: true),
        devGuideService.fetchDevotionalBooks(forceRefresh: true),
        upcomingEventsApiService.fetchUpcomingEvents(forceRefresh: true),
        campaignApiService.fetchListOfCoreMinistries(forceRefresh: true),
        newsUpdateApiService.fetchNewsUpdate(
          param: {"page": "1"},
          forceRefresh: true,
        ),
        paymentApiService.fetchPaymentHistory(
          param: {"page": "1", "payment_type": "campaign_donation"},
          forceRefresh: true,
        ),
      ]);
    } catch (_) {
      // Keep UI refresh resilient even when one endpoint fails.
    }

    final currentSignature = _homeDataSignature();
    if (previousSignature != currentSignature) {
      refreshTick.value++;
    }
  }

  bool _hasCachedHomeData() {
    return devGuideService.hasCachedDailyDevotion() &&
        devGuideService.hasCachedDevotionalBooks() &&
        upcomingEventsApiService.hasCachedUpcomingEvents() &&
        campaignApiService.hasCachedCoreMinistries() &&
        newsUpdateApiService.hasCachedNews(param: {"page": "1"}) &&
        paymentApiService.hasCachedPaymentHistory(
          param: {"page": "1", "payment_type": "campaign_donation"},
        );
  }

  String _homeDataSignature() {
    final data = {
      'daily': _normalizedBooks(devGuideService.getCachedDailyDevotion()),
      'devotional': _normalizedBooks(
        devGuideService.getCachedDevotionalBooks(),
      ),
      'events': _normalizedEvents(
        upcomingEventsApiService.getCachedUpcomingEvents(),
      ),
      'campaigns': campaignApiService
          .getCachedCoreMinistries()
          .map((item) => item.toJson())
          .toList(),
      'news': newsUpdateApiService
          .getCachedNews(param: {"page": "1"})
          .map((item) => item.toJson())
          .toList(),
      'payments': paymentApiService
          .getCachedPaymentHistory(
            param: {"page": "1", "payment_type": "campaign_donation"},
          )
          .map((item) => item.toJson())
          .toList(),
    };

    return jsonEncode(data);
  }

  List<Map<String, dynamic>> _normalizedBooks(List<DevotionalBookModel> books) {
    return books.map((item) {
      final json = Map<String, dynamic>.from(item.toJson());
      json.remove('heroTag');
      return json;
    }).toList();
  }

  List<Map<String, dynamic>> _normalizedEvents(
    List<UpcomingEventModel> events,
  ) {
    return events.map((item) {
      final json = Map<String, dynamic>.from(item.toJson());
      json.remove('heroTag');
      return json;
    }).toList();
  }

  Future<void> onDonationOnClick(DonationModel model) async {
    if (Platform.isIOS) {
      final userEmail = appPreference.getUserEmail();
      var link =
          "https://www.sughana.app/donations?campaign_id=${model.id}&email=$userEmail";
      if (await canLaunchUrl(Uri.parse(link))) {
        launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
      }
    } else {
      AppRouter.pushNamed(AppRouteNames.donateToCoreMinistry, extra: model);
    }
  }

  Future<void> onDevotionTap(DevotionalBookModel model) async {
    bool isOwned = model.purchased;
    if (!isOwned && Platform.isIOS) {
      isOwned = await revenueCatService.ownsBook(model);
    }

    AppRouter.pushNamed(
      isOwned
          ? AppRouteNames.purchasedBookDetails
          : AppRouteNames.buyDevotionalBook,
      extra: model,
    );
  }

  void onNewsUpdateTap(NewsUpdateModel news) {
    if (news.url.isEmpty) return;
    AppRouter.pushNamed(
      AppRouteNames.web,
      extra: WebModel(
        url: news.url,
        title: news.title.isEmpty ? "News Update" : news.title,
      ),
    );
  }

  void onMoreNewsOnClick() {
    AppRouter.goNamed(AppRouteNames.dashboardNews);
  }

  void onSeeMoreCoreMinistries() {
    AppRouter.goNamed(AppRouteNames.dashboardDonation);
  }

  void onSeeMoreDevotionalBooks() {
    AppRouter.goNamed(AppRouteNames.dashboardDevotional);
  }

  void onSearchOnClick() {}

  void onNotificationOnClick() {
    AppRouter.pushNamed(AppRouteNames.notifications);
  }

  void onProfileOnClick() {
    AppRouter.pushNamed(AppRouteNames.profile);
  }

  void onSeeMorePaymentHistory() {
    AppRouter.pushNamed(AppRouteNames.donationsHistory);
  }

  void onReadMoreOfDevotionalBook(DevotionalBookModel book) {
    AppRouter.pushNamed(AppRouteNames.purchasedBookDetails, extra: book);
  }

  void onUpcomingEventTap(BuildContext context, UpcomingEventModel event) {
    AppRouter.pushNamed(AppRouteNames.eventDetails, extra: event);
  }

  void onSeeAllUpcomingEvents() {
    AppRouter.pushNamed(AppRouteNames.allEvents);
  }
}
