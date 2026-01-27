import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/screen/base_shared_screen.dart';
import 'package:student_union/core-ui/screen/base_web.dart';
import 'package:student_union/core-ui/snippets/speech_to_voice/text_to_speech_Api.dart';
import 'package:student_union/core-ui/widgets/bible_scripture_widget.dart';
import 'package:student_union/core/app/app_colors.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/screens/dashboard/devotion/controller/purchased_book_controller.dart';

class PurchasedBookDetailsScreen extends BaseSharedScreen {
  final _controller = Get.put(PurchasedBookController());

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
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.dp(),
              vertical: 10.dp(),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => SizedBox(
                        width: appDimen.screenWidth * 0.52,
                        height: 50.dp(),
                        child: FilledButton.icon(
                          onPressed: () => _controller.onPickCalendar(context),
                          label: Text(
                            _controller.selectedDate.value,
                            style: textTheme.bodyLarge?.copyWith(
                              color: colorScheme.tertiary,
                            ),
                          ),
                          icon: Icon(Icons.calendar_today, size: 18.dp()),
                          style: FilledButton.styleFrom(
                            backgroundColor: primaryGreenColor,
                            foregroundColor: colorScheme.tertiary,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.dp(),
                              vertical: 8.dp(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // ButtonWidget(
                    //   asset: icCalendar,
                    //   backgroundColor: primaryGreenColor,
                    //   text: _controller.selectedDate.value,
                    //   textColor: colorScheme.tertiary,
                    //   assetColor: colorScheme.tertiary,
                    //   assetBgColor: colorScheme.tertiary.withAlpha(104),
                    //   width: appDimen.screenWidth * 0.55,
                    //   onTap: () => _controller.onPickCalendar(context),
                    // ),
                    Gap(10.dp()),
                    Row(
                      children: [
                        Obx(
                          () => IconButtonWidget(
                            icon:
                                _controller.textToSpeechApi.isReadingAloud.value
                                ? Icons.volume_off_rounded
                                : Icons.volume_up,
                            iconSize: 25.dp(),
                            iconColor: colorScheme.inverseSurface,
                            onTap: _controller.onReadAloudOnTap,
                          ),
                        ),
                        Gap(10.dp()),
                        Obx(
                          () => _controller.hasStartedSharing.value
                              ? const CircularProgressIndicator.adaptive(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                  strokeWidth: 2,
                                )
                              : IconButtonWidget(
                                  icon: Icons.share,
                                  iconSize: 25.dp(),
                                  iconColor: colorScheme.inverseSurface,
                                  onTap: _controller.onShareDevotionOnTap,
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
                //Gap(5.dp()),
                // InkWell(
                //   onTap: () {},
                //   child: Text(
                //     "Read bible text first",
                //     style: textTheme.labelSmall?.copyWith(fontSize: 10.dp()),
                //   ),
                // ),
                Gap(16.dp()),
                ContainerWidget(
                  onTap: () {},
                  color: primaryGreenColor,
                  borderRadius: 0,
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.dp(),
                    vertical: 2.dp(),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Obx(
                              () => Text(
                                (_controller.book.value.devotion?.reference ??
                                        '')
                                    .toUpperCase(),
                                style: textTheme.labelLarge?.copyWith(
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                          Gap(5.dp()),
                          Flexible(
                            flex: 0,
                            child: IconButtonWidget(
                              icon: Icons.menu_book_rounded,
                              iconSize: 25.dp(),
                              iconColor: colorScheme.tertiary,
                              onTap: () {
                                BibleScriptureWidget(
                                  context: context,
                                  book: _controller.book.value,
                                ).viewScripture();
                              },
                            ),
                            // child: Text(
                            //   _controller.selectedDateTimeline.value
                            //       .toUpperCase(),
                            //   style: textTheme.labelMedium?.copyWith(
                            //     color: whiteColor,
                            //   ),
                            // ),
                          ),
                        ],
                      ),

                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Read bible text first",
                          textAlign: TextAlign.start,
                          style: textTheme.labelSmall?.copyWith(
                            fontSize: 10.dp(),
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(5.dp()),
                ContainerWidget(
                  color: colorScheme.inversePrimary,
                  borderRadius: 0,
                  onTap: () {},
                  width: appDimen.screenWidth,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.dp(),
                    vertical: 5.dp(),
                  ),
                  child: Text(
                    _controller.book.value.devotion?.title ?? '',
                    style: textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: darkColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(12.dp()),
          Obx(
            () => Expanded(
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
                          backgroundColor:
                              Theme.of(context).brightness == Brightness.light
                              ? colorScheme.surface
                              : greyTertiaryColor,
                          content: _controller.book.value.devotion?.content,
                          sections: _controller.getDevotionSections(),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: _controller.onOpenBibleTextOnTap,
      shape: CircleBorder(),
      backgroundColor: colorScheme.surfaceBright,
      heroTag: "youversion_fab_tag",
      child: AssetImageWidget(
        asset: icYouVersion,
        height: 30.dp(),
        width: 30.dp(),
      ),
    );
  }
}
