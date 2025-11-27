import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/screen/base_web.dart';
import 'package:student_union/core-ui/snippets/speech_to_voice/text_to_speech_Api.dart';
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

  // @override
  // String appBarTitle() {
  //   return _controller.book.value.name;
  // }

  // @override
  // TextStyle? appBarTitleStyle(BuildContext context) {
  //   return super
  //       .appBarTitleStyle(context)
  //       ?.copyWith(fontWeight: FontWeight.w700);
  // }

  @override
  Widget body(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (canPop, onPop) {
        TextToSpeechApi().stop();
      },
      child: Obx(
        () => Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.dp()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(
                        asset: icCalendar,
                        text: _controller.selectedDate.value,
                        textColor: colorScheme.surface,
                        assetColor: colorScheme.surface,
                        assetBgColor: colorScheme.surface.withOpacity(.3),
                        width: appDimen.screenWidth * 0.5,
                        onTap: () => _controller.onPickCalendar(context),
                      ),
                      Gap(10.dp()),
                      Obx(
                        () => IconButtonWidget(
                          icon: _controller.textToSpeechApi.isReadingAloud.value
                              ? Icons.volume_off_rounded
                              : Icons.volume_up,
                          iconSize: 25.dp(),
                          iconColor: colorScheme.inverseSurface,
                          onTap: _controller.onReadAloudOnTap,
                        ),
                      ),
                      Gap(10.dp()),
                      IconButtonWidget(
                        icon: Icons.share,
                        iconSize: 25.dp(),
                        iconColor: colorScheme.inverseSurface,
                        onTap: _controller.onShareDevotionOnTap,
                      ),
                    ],
                  ),
                  Gap(5.dp()),
                  Text("Read Bible text first",
                      style: textTheme.labelSmall?.copyWith(fontSize: 10.dp())),
                  Gap(12.dp()),
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
                            _controller.selectedDateTimeline.value
                                .toUpperCase(),
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
                      ? const NoDataWidget(
                          asset: icDevotion,
                          title: "No Content Found",
                          description:
                              "Your devotional content appears here. There is no content available for the selected date.",
                        )
                      : Container(
                          color: colorScheme.tertiary,
                          child: BaseWebView(
                            model: WebModel(
                              showAppBar: false,
                              content: _controller.book.value.devotion?.content,
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: _controller.onOpenBibleTextOnTap,
      shape: CircleBorder(),
      backgroundColor: colorScheme.surfaceBright,
      child: AssetImageWidget(
        asset: icYouVersion,
        height: 30.dp(),
        width: 30.dp(),
      ),
    );
  }
}
