import 'package:student_union/core/model/remote/campaign_model.dart';


abstract class CampaignsApiInterface{
  Future<List<CampaignModel>> fetchListOfCoreMinistries();

}