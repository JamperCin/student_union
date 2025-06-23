import 'dart:convert';

import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/base_object.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:core_module/core_ui/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/screen/base_web.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/screens/dashboard/devotion/controller/purchased_book_controller.dart';

class PurchasedBookDetailsScreen extends BaseScreenStandard {
  final _controller = Get.put(PurchasedBookController());

  @override
  bool showAppBar() {
    return true;
  }

  @override
  void setModel(BaseObject baseObject) {
    super.setModel(baseObject);
    _controller.setPurchasedBook(baseObject as DevotionalBookModel);
  }

  @override
  String appBarTitle() {
    return _controller.book.value.name;
  }

  @override
  TextStyle? appBarTitleStyle(BuildContext context) {
    return super
        .appBarTitleStyle(context)
        ?.copyWith(fontWeight: FontWeight.w700);
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.dp()),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget(
                      asset: icCalendar,
                      text: _controller.selectedDate.value,
                      assetBgColor: colorScheme.primary,
                      width: appDimen.screenWidth * 0.5,
                      onTap: () => _controller.onPickCalendar(context),
                    ),
                    // Gap(20.dp()),
                    // Text(
                    //   "10 / 120",
                    //   style: textTheme.bodyMedium,
                    // )
                  ],
                ),
                Gap(16.dp()),
                ContainerWidget(
                  color: colorScheme.primary,
                  borderRadius: 0,
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.dp(),
                    vertical: 5.dp(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          (_controller.book.value.devotion?.reference ?? '')
                              .toUpperCase(),
                          style: textTheme.labelLarge
                              ?.copyWith(color: colorScheme.surface),
                        ),
                      ),
                      Gap(5.dp()),
                      Flexible(
                        child: Text(
                          _controller.selectedDateTimeline.value.toUpperCase(),
                          style: textTheme.labelMedium
                              ?.copyWith(color: colorScheme.surface),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(5.dp()),
                ContainerWidget(
                  color: colorScheme.inversePrimary,
                  borderRadius: 0,
                  width: appDimen.screenWidth,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.dp(),
                    vertical: 5.dp(),
                  ),
                  child: Text(
                    _controller.book.value.devotion?.title ?? '',
                    style: textTheme.labelLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _controller.isLoadingContent.value
                ? const LoaderWidget.withIndicator()
                : (_controller.book.value.devotion?.content ?? '').isEmpty
                    ? NoDataWidget(
                        asset: icDevotion,
                        title: "No Content Found",
                        description:
                            "Your devotional content appears here. There is no content available for the selected date.",
                      )
                    : BaseWebView(
                        model: WebModel(
                          showAppBar: false,
                          content: _controller.book.value.devotion?.content,
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
