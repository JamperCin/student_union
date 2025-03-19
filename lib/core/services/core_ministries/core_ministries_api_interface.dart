import 'package:student_union/core/model/devotional_guide_model.dart';
import 'package:student_union/core/model/donation_history_model.dart';

import '../../model/core_ministry_model.dart';

abstract class CoreMinistriesApiInterface{
  Future<List<CoreMinistryModel>> fetchListOfCoreMinistries();
  Future<List<DonationHistoryModel>> fetchListDonationHistory();

}