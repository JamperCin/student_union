import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/enums/book_type.dart';
import 'package:student_union/core/model/devotional_guide_model.dart';
import 'package:student_union/core/model/success_model.dart';

import '../../../shared/success_screen.dart';
import '../ui/devotion_details_screen.dart';

class DevotionController extends BaseController {
  RxString selectedYear = "${DateTime.now().year}".obs;
  Rx<BookType> bookTypeFilter = BookType.availableBooks.obs;


  ///Generate list of years starting from current year
  List<String> get list =>
      List<String>.generate(5 + 1, (index) => "${DateTime.now().year - index}");

  onDevotionTap(DevotionalGuideModel model) {
    navUtils.fireTarget(DevotionDetailsScreen(), model: model);
  }

  Future<void> onInitiateBuyOnClick(BuildContext context, DevotionalGuideModel model) async {
    const LoaderWidget().showProgressIndicator(context: context);
    await Future.delayed(const Duration(seconds: 2));
    const LoaderWidget().hideProgress();

    navUtils.fireTargetOff(
      SuccessScreen(),
      model: SuccessModel(
        title: "Success",
        message: "You have successfully purchased this devotion with title ${model.title}",
      ),
    );
  }
}
