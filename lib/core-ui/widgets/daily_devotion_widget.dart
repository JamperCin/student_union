import 'package:flutter/material.dart';
import 'package:core_module/core_module.dart';
import 'package:student_union/core-ui/snippets/speech_to_voice/text_to_speech_Api.dart';
import 'package:student_union/core-ui/widgets/bible_scripture_widget.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/core/utils/share_file_utils.dart';

class DailyDevotionWidget extends StatelessWidget {
  final Function(DevotionalBookModel)? onReadMoreOnTap;

  DailyDevotionWidget({super.key, this.onReadMoreOnTap});

  final lead = '—  ';
  RxBool hasStartedSharing = false.obs;
  //final script = 'Deuteronomy 29:29';

  @override
  Widget build(BuildContext context) {
    // final formatDate = DateTimeUtils()
    //     .formatDate(DateTime.now().toString(), format: "yyyy-MM-dd");
    //
    // final param = {"date": formatDate};

    return FutureBuilder(
      future: devGuideService.fetchDailyDevotion(),
      builder:
          (
            BuildContext context,
            AsyncSnapshot<List<DevotionalBookModel>> snapshot,
          ) {
            return snapshot.hasData && snapshot.data != null
                ? _devotionCard(context, snapshot.data!)
                : ShimmerWidget.withList(length: 1);
          },
    );
  }

  Widget _devotionCard(BuildContext context, List<DevotionalBookModel> list) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (list.isEmpty || list.first.devotion == null) {
      return const SizedBox.shrink();
    }

    final devotion = list.first.devotion;
    final content = devotion?.referenceText ?? '';
    //html_parser.parse(devotion?.content ?? '').body?.text ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(20.dp()),
        const TitleTextWidget(text: "Passage for Today"),
        Gap(5.dp()),
        ContainerWidget(
          backgroundImage: icDevotionBg,
          borderColor: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 5.dp(), vertical: 8.dp()),
          width: appDimen.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: content,
                      style: textTheme.labelMedium?.copyWith(
                        fontSize: 12.dp(),
                        color: colorScheme.tertiary,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(5.dp()),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: lead,
                      style: textTheme.labelMedium?.copyWith(
                        fontSize: 12.dp(),
                        color: colorScheme.secondary,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    TextSpan(
                      text: devotion?.reference ?? '',
                      style: textTheme.labelMedium?.copyWith(
                        fontSize: 12.dp(),
                        color: colorScheme.secondary,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(5.dp()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerWidget(
                    onTap: () => onReadMoreOnTap?.call(list.first),
                    borderRadius: 20,
                    borderColor: colorScheme.tertiary,
                    // text: "Read",
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.dp(),
                      vertical: 0.1.dp(),
                    ),
                    child: Center(
                      child: Text(
                        "Read More",
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.tertiary,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButtonWidget(
                        icon: Icons.menu_book_rounded,
                        iconSize: 25.dp(),
                        iconColor: colorScheme.tertiary,
                        onTap: () {
                          BibleScriptureWidget(
                            context: context,
                            book: list.first,
                          ).viewScripture();
                        },
                      ),
                      Obx(
                        () => hasStartedSharing.value
                            ? const CircularProgressIndicator.adaptive(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                                strokeWidth: 5,
                                backgroundColor: Colors.white,
                              )
                            : IconButtonWidget(
                                icon: Icons.share,
                                iconSize: 22.dp(),
                                iconColor: colorScheme.tertiary,
                                onTap: () async {
                                  await onShareDevotionOnTap(list.first);
                                },
                              ),
                      ),
                      Gap(10.dp()),
                      Obx(
                        () => IconButtonWidget(
                          icon: TextToSpeechApi().isReadingAloud.value
                              ? Icons.volume_off_rounded
                              : Icons.volume_up,
                          iconSize: 25.dp(),
                          iconColor: colorScheme.tertiary,
                          onTap: () {
                            TextToSpeechApi().regulateSpeech(content);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> onShareDevotionOnTap(DevotionalBookModel book) async {
    if (book.devotion == null) {
      return;
    }

    hasStartedSharing.value = true;
    StringBuffer contentBuffer = StringBuffer();
    //final content =html_parser.parse(book.value.devotion?.content ?? '').body?.text ?? '';

    contentBuffer.writeln(book.devotion?.title ?? '');
    contentBuffer.writeln('\n');
    contentBuffer.writeln(book.devotion?.referenceText ?? '');
    contentBuffer.write('(${book.devotion?.reference})');
    //contentBuffer.writeln('\n');
    //contentBuffer.writeln(content);

    await ShareFileUtils().saveAndShareImage(
      imageUrl: book.thumbnail,
      title: contentBuffer.toString(),
    );
    hasStartedSharing.value = false;
  }
}
