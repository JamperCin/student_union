import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/base/base_controller.dart';

class DevotionController extends BaseController {
  RxString selectedYear = "${DateTime.now().year}".obs;




  ///Generate list of years starting from current year
  List<String> get list =>
      List<String>.generate(5 + 1, (index) => "${DateTime.now().year - index}");
}
