import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/drop_down_widget.dart';
import 'package:core_module/core_ui/widgets/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/widgets/devotional_guide_widget.dart';
import 'package:student_union/core/enums/book_type.dart';

import '../controller/devotion_controller.dart';

class DevotionsScreen extends BaseScreenStandard {
  final _controller = Get.put(DevotionController());

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
  TextStyle? appBarTitleStyle(BuildContext context) {
    return super
        .appBarTitleStyle(context)
        ?.copyWith(fontWeight: FontWeight.w700);
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
                index == 0 ? BookType.availableBooks : BookType.purchasedBooks;
          },
        ),
        Expanded(
          child: Obx(
            () => _controller.bookTypeFilter.value == BookType.availableBooks
                ? DevotionalGuideWidget.withAvailableBooks(
                    yearFilter: _controller.selectedYear.value,
                    onTap: _controller.onDevotionTap,
                    axis: Axis.vertical,
                  )
                : DevotionalGuideWidget.withPurchasedBooks(
                    yearFilter: _controller.selectedYear.value,
                    onTap: _controller.onPurchasedBookOnClick,
                  ),
          ),
        )
      ],
    );
  }
}
