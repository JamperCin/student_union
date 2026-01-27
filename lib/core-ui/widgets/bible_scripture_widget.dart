import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/snippets/speech_to_voice/text_to_speech_Api.dart';
import 'package:student_union/core-ui/widgets/draggable_bottom_sheet.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';
import 'package:student_union/core/res/asset_path.dart';

class BibleScriptureWidget {
  final DevotionalBookModel book;
  final BuildContext context;

  BibleScriptureWidget({required this.book, required this.context});

  void viewScripture() {
    DraggableBottomSheetWidget().show(
      context: context,
      backgroundImageAsset: icDevotionBg,
      children: _buildScriptureContent(),
    );
  }

  List<Widget> _buildScriptureContent() {
    final lead = '—  ';
    final devotion = book.devotion;
    final content = devotion?.referenceText ?? '';
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              book.devotion?.title ?? '',
              style: textTheme.labelLarge?.copyWith(
                fontSize: 16.dp(),
                color: colorScheme.tertiary,
              ),
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
      Gap(16.dp()),
      Text(
        content,
        style: textTheme.labelMedium?.copyWith(
          fontSize: 14.dp(),
          wordSpacing: 3.0,
          //  letterSpacing: 1.5,
          color: colorScheme.tertiary,
        ),
      ),
      Gap(40.dp()),
    ];
  }
}
