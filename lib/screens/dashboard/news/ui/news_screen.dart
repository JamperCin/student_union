import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/screen/base_shared_screen.dart';
import 'package:student_union/core-ui/widgets/news_update_widget.dart';

import '../controller/news_controller.dart';

class NewsScreen extends BaseSharedScreen {
  final _controller = Get.put(NewsController());


  @override
  String appBarTitle() {
    return "News Update";
  }


  @override
  Widget body(BuildContext context) {
    return NewsUpdateWidget.withDetails(
      onTap: _controller.onNewsUpdateTap,
    );
  }
}
