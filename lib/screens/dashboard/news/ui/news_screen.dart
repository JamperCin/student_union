import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/base_object.dart' show BaseObject;
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/widgets/news_update_widget.dart';
import 'package:student_union/core/model/remote/news_update_model.dart';

import '../controller/news_controller.dart';

class NewsScreen extends BaseScreenStandard {
  final _controller = Get.put(NewsController());
  bool showAppBarIcon = false;

  @override
  bool showAppBar() {
    return true;
  }

  @override
  double appBarElevation() {
    return 10;
  }

  @override
  String appBarTitle() {
    return "News Update";
  }

  @override
  TextStyle? appBarTitleStyle(BuildContext context) {
    return super
        .appBarTitleStyle(context)
        ?.copyWith(fontWeight: FontWeight.w700);
  }


  @override
  Widget body(BuildContext context) {
    return NewsUpdateWidget.withDetails(
      onTap: _controller.onNewsUpdateTap,
    );
  }
}
