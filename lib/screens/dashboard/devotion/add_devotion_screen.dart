import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/base_object.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';

import '../../../core/model/news_update_model.dart';
import 'devotion_controller.dart';

class AddDevotionScreen extends BaseScreenStandard {
  final _controller = Get.put(DevotionController());
  bool showAppBarIcon = false;

  @override
  bool showAppBar() {
    return true;
  }

  @override
  Color appBarBackgroundColor(BuildContext context) {
    return colorScheme.tertiary;
  }

  @override
  double appBarElevation() {
    return 5;
  }

  @override
  String appBarTitle() {
    return "Devotionals";
  }

  @override
  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      elevation: 10,
      toolbarHeight: appBarHeight(),
      backgroundColor: appBarBackgroundColor(context),
      leading: appBarLeadingIcon(context),
      surfaceTintColor: appBarBackgroundColor(context),
      title: appBarTitleWidget(context) ??
          Text(
            appBarTitle(),
            style: appBarTitleStyle(context),
          ),
      actions: actions(),
    );
  }

  @override
  TextStyle? appBarTitleStyle(BuildContext context) {
    return super
        .appBarTitleStyle(context)
        ?.copyWith(fontWeight: FontWeight.w700);
  }

  @override
  Widget? appBarLeadingIcon(BuildContext context) {
    return showAppBarIcon
        ? super.appBarLeadingIcon(context)
        : const SizedBox.shrink();
  }

  @override
  void setModel(BaseObject baseObject) {
    super.setModel(baseObject);
    if (baseObject is NewsUpdateModel) {
      showAppBarIcon = true;
    } else {
      showAppBarIcon = false;
    }
  }

  @override
  List<Widget> actions() {
    return [
      ContainerWidget(
        padding: EdgeInsets.symmetric(horizontal: 10.dp()),
        height: 40.dp(),
        margin: EdgeInsets.only(right: 5.dp()),
        borderColor: colorScheme.primary,
        child: Obx(
          ()=> DropdownButton<String>(
            value: _controller.selectedYear.value,
            //icon: Icon(Icons.arrow_drop_down),
            iconSize: 24.dp(),
            elevation: 16,
            style: textTheme.bodyMedium?.copyWith(color: colorScheme.primary),
            underline: Container(
              height: 0,
              color: Colors.transparent,
            ),
            onChanged: (String? newValue) {
              _controller.selectedYear.value = newValue!;
            },
            items: _controller.list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      )
    ];
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        TitleTextWidget(text: "text"),
        Gap(5.dp()),

      ],
    );
  }
}
