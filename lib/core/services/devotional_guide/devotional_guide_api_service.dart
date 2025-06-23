import 'dart:collection';

import 'package:core_module/core/services/base_api_service.dart';
import 'package:core_module/core/utils/file_utils.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';
import 'package:student_union/core/services/devotional_guide/devotional_guide_api_interface.dart';

class DevotionalGuideApiService extends BaseApiService
    implements DevotionalGuideApiInterface {
  static DevotionalGuideApiService? _instance;
  final path = "assets/data/devotional_guide.json";

  RxList<DevotionalBookModel> availableBooks = <DevotionalBookModel>[].obs;
  RxList<DevotionalBookModel> purchasedBooks = <DevotionalBookModel>[].obs;

  DevotionalGuideApiService._();

  factory DevotionalGuideApiService() {
    return _instance ??= DevotionalGuideApiService._();
  }

  @override
  Future<List<DevotionalBookModel>> fetchDevotionalBooks(
      {Map<String, dynamic>? param}) async {
    final results = await _instance?.getListRequest<DevotionalBookModel>(
          api: "customer/v1/devotion_years",
          key: 'devotion_years',
          param: param,
          parser: (json) => DevotionalBookModel.fromJson(json),
        ) ??
        [];
    return results;
  }

  @override
  Future<List<DevotionalBookModel>> fetchPurchasedBooks(
      {Map<String, dynamic>? param}) async {
    final results = await _instance?.getListRequest<DevotionalBookModel>(
          api: "customer/v1/purchased_devotions",
          key: 'purchased_devotion_years',
          param: param,
          parser: (json) => DevotionalBookModel.fromJson(json),
        ) ??
        [];
    return results;

   //  final results = await FileUtils().fetchList<DevotionalBookModel>(
   //    path: path,
   //    key: "data",
   //    secondaryKey: "devotions",
   //    parser: (json) => DevotionalBookModel.fromJson(json),
   //  );
   //
   // return results;
  }
}
