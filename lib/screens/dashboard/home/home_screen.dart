import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/widgets/top_header_widget.dart';
import 'package:student_union/screens/dashboard/home/home_controller.dart';

class HomeScreen extends BaseScreenStandard{
final _controller = Get.put(HomeController());

  @override
  bool showAppBar() {
    return false;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
       children: [
        const TopHeaderWidget(),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(appDimen.dimen(10)),
            height: appDimen.screenHeight,
            width: appDimen.screenWidth,
            color: colorScheme.surface,
            child: _homeBody(context),
          ),
        ),
      ],
    );
  }

  Widget _homeBody(BuildContext context) {
    return ListView(
      children: [],
    );
  }
}