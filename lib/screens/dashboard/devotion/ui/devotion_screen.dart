import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/base_object.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/drop_down_widget.dart';
import 'package:core_module/core_ui/widgets/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:student_union/core-ui/widgets/devotional_guide_widget.dart';

import '../../../../core/model/news_update_model.dart';
import '../controller/devotion_controller.dart';

class DevotionsScreen extends BaseScreenStandard {
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

  /*@override
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
  }*/

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
      DropDownWidget(
        selectedItem: _controller.selectedYear,
        list: _controller.list,
      )
    ];
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Gap(5.dp()),
        TabBarWidget(
          tabs: const [
            Tab(text: "Available Books"),
            Tab(text: "Purchased Books"),
          ],
          onTap: (index) {
            _controller.bookTypeFilter.value =
                index == 0 ? "available" : "purchased";
          },
        ),
        Expanded(
          child: Obx(() => _controller.bookTypeFilter.value.isNotEmpty
              ? DevotionalGuideWidget.withVerticalGrid(
                  bookFilter: _controller.bookTypeFilter.value,
                  yearFilter: _controller.selectedYear.value,
            onTap: _controller.onDevotionTap,
                )
              : const SizedBox.shrink()),
        )
      ],
    );
  }
}
