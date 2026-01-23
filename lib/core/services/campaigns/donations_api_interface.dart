import 'package:student_union/core/model/remote/campaign_model.dart';

abstract class DonationsApiInterface {
  Future<List<DonationModel>> fetchListOfCoreMinistries();
}
