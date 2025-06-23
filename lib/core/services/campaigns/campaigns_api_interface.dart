import 'package:student_union/core/model/remote/campaign_model.dart';
import 'package:student_union/core/model/remote/donation_history_model.dart';


abstract class CampaignsApiInterface{
  Future<List<CampaignModel>> fetchListOfCoreMinistries();

}