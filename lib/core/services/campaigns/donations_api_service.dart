import 'package:core_module/core/services/base_api_service.dart';
import 'package:student_union/core/model/remote/campaign_model.dart';
import 'package:student_union/core/services/campaigns/donations_api_interface.dart';

class DonationsService extends BaseApiService implements DonationsApiInterface {
  static DonationsService? _instance;
  final path = "assets/data/core_ministries.json";

  DonationsService._();

  factory DonationsService() {
    return _instance ??= DonationsService._();
  }

  @override
  Future<List<DonationModel>> fetchListOfCoreMinistries() async {
    final results =
        await _instance?.getListRequest<DonationModel>(
          api: 'customer/v1/campaigns',
          key: 'campaigns',
          parser: (json) => DonationModel.fromJson(json),
        ) ??
        [];

    //Sort the results in ascending order based on createAt sample : 2025-12-11T15:00:51.226Z by using Datetime.parse
    results.sort((a, b) {
      DateTime dateA = DateTime.parse(a.createdAt);
      DateTime dateB = DateTime.parse(b.createdAt);
      return dateA.compareTo(dateB);
    });

    return results;
  }
}
