import 'package:core_module/core/def/global_def.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/model/devotional_guide_model.dart';
import 'package:student_union/screens/dashboard/profile/profile_screen.dart';

import '../../../core/model/core_ministry_model.dart';
import '../devotion/ui/devotion_details_screen.dart';
import '../donate/ui/donate_to_core_ministry_screen.dart';

class HomeController extends BaseController{

  void onSettingsOnClick() {
    //navUtils.fireTarget(ProfileScreen());
  }

  void onDonationOnClick(CoreMinistryModel model) {
    navUtils.fireTarget(DonateToCoreMinistryScreen(), model: model);
  }

  onDevotionTap(DevotionalGuideModel model) {
    navUtils.fireTarget(DevotionDetailsScreen(), model: model);
  }
}