import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/drop_down_widget.dart';
import 'package:core_module/core_ui/widgets/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/widgets/devotional_guide_widget.dart';
import 'package:student_union/core/enums/book_type.dart';

import '../controller/devotion_controller.dart';

class DevotionsScreen extends BaseScreenWithTabs {
  final _controller = Get.put(DevotionController());

  @override
  String appBarTitle() {
    return "Devotionals";
  }

  @override
  TextStyle? appBarTitleStyle(BuildContext context) {
    return super
        .appBarTitleStyle(context)
        ?.copyWith(fontWeight: FontWeight.w700);
  }

  @override
  List<Widget> actions() {
    return [
      DropDownWidget(
          initialItem: _controller.selectedYear.value,
          list: _controller.list,
          onItemSelected: (value) {
            _controller.selectedYear.value = value;
          })
    ];
  }

  @override
  int initialIndex() {
    return _controller.bookTypeFilter.value == BookType.availableBooks ? 0 : 1;
  }

  @override
  List<Widget> tabs() {
    return [
      const Tab(text: "Available Books"),
      const Tab(text: "Purchased Books"),
    ];
  }


  @override
  List<Widget> tabsViews() {
    return [
      Obx(
        () => DevotionalGuideWidget.withAvailableBooks(
          yearFilter: _controller.selectedYear.value,
          onTap: _controller.onDevotionTap,
          axis: Axis.vertical,
        ),
      ),
      Obx(
        () => DevotionalGuideWidget.withPurchasedBooks(
          yearFilter: _controller.selectedYear.value,
          onTap: _controller.onPurchasedBookOnClick,
        ),
      )
    ];
  }

}
