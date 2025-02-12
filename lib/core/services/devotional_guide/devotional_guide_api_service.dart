import 'package:core_module/core/services/base_api_service.dart';
import 'package:core_module/core/utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/model/devotional_guide_model.dart';
import 'package:student_union/core/services/devotional_guide/devotional_guide_api_interface.dart';

class DevotionalGuideApiService extends BaseApiService
    implements DevotionalGuideApiInterface {
  static DevotionalGuideApiService? _instance;
  final path = "assets/data/devotional_guide.json";

  DevotionalGuideApiService._();

  factory DevotionalGuideApiService() {
    return _instance ??= DevotionalGuideApiService._();
  }

  @override
  Future<List<DevotionalGuideModel>> fetchListOfDevotionalGuide() async {
    await Future.delayed(const Duration(seconds: 2));
    final results = await FileUtils().fetchList<DevotionalGuideModel>(
      path: path,
      objectKey: 'data',
      key: 'devotions',
      parser: (json) => DevotionalGuideModel.fromJson(json),
    );

    debugPrint("Devotions : ${results.toString()}");
    return results;
  }

  @override
  Future<List<DevotionalGuideModel>> fetchListOfCoreMinistries() async{
    await Future.delayed(const Duration(seconds: 2));
    final results = await FileUtils().fetchList<DevotionalGuideModel>(
      path: "assets/data/core_ministries.json",
      objectKey: 'data',
      key: 'ministries',
      parser: (json) => DevotionalGuideModel.fromJson(json),
    );

    debugPrint("Mini : ${results.toString()}");
    return results;
  }
}
