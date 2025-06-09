import 'dart:collection';

import 'package:core_module/core/services/base_api_service.dart';
import 'package:core_module/core/utils/file_utils.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/model/devotional_guide_model.dart';
import 'package:student_union/core/services/devotional_guide/devotional_guide_api_interface.dart';

class DevotionalGuideApiService extends BaseApiService
    implements DevotionalGuideApiInterface {
  static DevotionalGuideApiService? _instance;
  final path = "assets/data/devotional_guide.json";
  //final RxList<DevotionalGuideModel> devotionalGuideList = <DevotionalGuideModel>[].obs;

  DevotionalGuideApiService._();

  factory DevotionalGuideApiService() {
    return _instance ??= DevotionalGuideApiService._();
  }

  @override
  Future<List<DevotionalGuideModel>> fetchListOfDevotionalGuide(
      {HashMap? param}) async {
   // devotionalGuideList.clear();

    final results = await _instance?.getListRequest<DevotionalGuideModel>(
      api: "customer/v1/books",
      key: 'books',
      parser: (json) => DevotionalGuideModel.fromJson(json),
    ) ?? [];

   // debugPrint("Devotions : ${results.toString()}");
    //devotionalGuideList.value = results;
    return results;
  }
}
