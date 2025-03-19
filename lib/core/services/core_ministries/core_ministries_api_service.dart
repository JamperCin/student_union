import 'package:core_module/core/services/base_api_service.dart';
import 'package:core_module/core/utils/file_utils.dart' show FileUtils;
import 'package:flutter/material.dart';
import 'package:student_union/core/model/devotional_guide_model.dart';
import 'package:student_union/core/model/donation_history_model.dart';
import 'package:student_union/core/services/core_ministries/core_ministries_api_interface.dart';

import '../../model/core_ministry_model.dart';

class CoreMinistriesApiService extends BaseApiService implements CoreMinistriesApiInterface{
  static CoreMinistriesApiService? _instance;
  final path = "assets/data/core_ministries.json";

  CoreMinistriesApiService._();

  factory CoreMinistriesApiService(){
    return _instance ??= CoreMinistriesApiService._();
  }

  @override
  Future<List<CoreMinistryModel>> fetchListOfCoreMinistries() async{
    await Future.delayed(const Duration(seconds: 2));
    final results = await FileUtils().fetchList<CoreMinistryModel>(
      path: path,
      objectKey: 'data',
      key: 'ministries',
      parser: (json) => CoreMinistryModel.fromJson(json),
    );

    debugPrint("Mini : ${results.toString()}");
    return results;
  }

  @override
  Future<List<DonationHistoryModel>> fetchListDonationHistory() async{
    await Future.delayed(const Duration(seconds: 2));
    final results = await FileUtils().fetchList<DonationHistoryModel>(
      path: path,
      objectKey: 'data',
      key: 'ministries',
      parser: (json) => DonationHistoryModel.fromJson(json),
    );
    return results;
  }
}