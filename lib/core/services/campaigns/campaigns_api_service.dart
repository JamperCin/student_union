import 'package:core_module/core/services/base_api_service.dart';
import 'package:core_module/core/utils/file_utils.dart' show FileUtils;
import 'package:student_union/core/model/remote/campaign_model.dart';
import 'package:student_union/core/services/campaigns/campaigns_api_interface.dart';

class CampaignApiService extends BaseApiService
    implements CampaignsApiInterface {
  static CampaignApiService? _instance;
  final path = "assets/data/core_ministries.json";

  CampaignApiService._();

  factory CampaignApiService() {
    return _instance ??= CampaignApiService._();
  }

  @override
  Future<List<CampaignModel>> fetchListOfCoreMinistries() async {
   // await Future.delayed(const Duration(seconds: 2));
    // final results = await FileUtils().fetchList<CampaignModel>(
    //   path: path,
    //   key: 'data',
    //   secondaryKey: 'ministries',
    //   parser: (json) => CampaignModel.fromJson(json),
    // );
    //

    final results = await _instance?.getListRequest<CampaignModel>(
      api: 'customer/v1/campaigns',
      key: 'campaigns',
      parser: (json) => CampaignModel.fromJson(json),
    ) ?? [];

    return results;
  }

}
