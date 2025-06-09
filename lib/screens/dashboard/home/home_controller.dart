import 'package:core_module/core/def/global_def.dart';
import 'package:student_union/core-ui/screen/base_web.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/model/devotional_guide_model.dart';
import 'package:student_union/core/model/news_update_model.dart';
import 'package:student_union/screens/dashboard/devotion/ui/devotion_screen.dart';
import 'package:student_union/screens/dashboard/donate/ui/donations_core_ministries_screen.dart';
import 'package:student_union/screens/dashboard/more/profile/profile_screen.dart';

import '../../../core/model/core_ministry_model.dart';
import '../../../core/model/local/web_model.dart';
import '../devotion/ui/devotion_details_screen.dart';
import '../donate/ui/donate_to_core_ministry_screen.dart';
import '../news/ui/news_screen.dart';

class HomeController extends BaseController{

  void onSettingsOnClick() {
    //navUtils.fireTarget(ProfileScreen());
  }

  void onDonationOnClick(CoreMinistryModel model) {
    navUtils.fireTarget(DonateToCoreMinistryScreen(), model: model);
  }

  void onDevotionTap(DevotionalGuideModel model) {
    navUtils.fireTarget(DevotionDetailsScreen(), model: model);
  }

  void onNewsUpdateTap(NewsUpdateModel news) {
    navUtils.fireTarget(
      BaseWebView(),
      model: WebModel(
        url: news.url,//"https://www.catholic.org/bible/daily_reading/",
        title: news.title.isEmpty ? "News Update" : news.title,
      ),
    );
  }

  void onMoreNewsOnClick() {
    navUtils.fireTarget(NewsScreen(), model: const NewsUpdateModel());
  }

  void onSeeMoreCoreMinistries() {
    navUtils.fireTarget(DonationCoreMinistriesScreen(),
        model: const CoreMinistryModel());
  }

  void onSeeMoreDevotionalBooks() {
    navUtils.fireTarget(DevotionsScreen(),
        model: const DevotionalGuideModel());
  }

  void onSearchOnClick() {

  }

  void onNotificationOnClick() {

  }

  void onProfileOnClick() {
    navUtils.fireTarget(ProfileScreen());
  }
}