import 'package:core_module/core/services/base_api_service.dart';
import 'package:core_module/core/utils/file_utils.dart' show FileUtils;
import 'package:flutter/material.dart';
import 'package:student_union/core/model/devotional_guide_model.dart';
import 'package:student_union/core/services/core_ministries/core_ministries_api_interface.dart';

class CoreMinistriesApiService extends BaseApiService implements CoreMinistriesApiInterface{
  static CoreMinistriesApiService? _instance;
  final path = "assets/data/core_ministries.json";

  CoreMinistriesApiService._();

  factory CoreMinistriesApiService(){
    return _instance ??= CoreMinistriesApiService._();
  }

  @override
  Future<List<DevotionalGuideModel>> fetchListOfCoreMinistries() async{
    await Future.delayed(const Duration(seconds: 2));
    final results = await FileUtils().fetchList<DevotionalGuideModel>(
      path: path,
      objectKey: 'data',
      key: 'ministries',
      parser: (json) => DevotionalGuideModel.fromJson(json),
    );

    debugPrint("Mini : ${results.toString()}");
    return results;
  }
}