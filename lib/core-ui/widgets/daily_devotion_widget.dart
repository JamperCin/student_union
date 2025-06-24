import 'dart:convert';

import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/double_extension.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/utils/date_time_utils.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/icon_button_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core_module.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:share_plus/share_plus.dart';
import 'package:student_union/core-ui/snippets/speech_to_voice/text_to_speech_Api.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';
import 'package:student_union/core/res/asset_path.dart';

class DailyDevotionWidget extends StatelessWidget {
  final Function(DevotionalBookModel)? onReadMoreOnTap;

  const DailyDevotionWidget({
    super.key,
    this.onReadMoreOnTap,
  });

  //final text = 'The secret things belong to the Lord our God, but the things revealed belong to us and to our children forever, that we may follow all the words of this law.';
  final lead = '—  ';
  //final script = 'Deuteronomy 29:29';

  @override
  Widget build(BuildContext context) {
    final formatDate = DateTimeUtils()
        .formatDate(DateTime.now().toString(), format: "yyyy-MM-dd");

    final param = {"devotion_year_id": "25", "date": formatDate};

    return FutureBuilder(
      future: devGuideService.fetchPurchasedBooks(param: param),
      builder: (BuildContext context,
          AsyncSnapshot<List<DevotionalBookModel>> snapshot) {
        return snapshot.hasData && snapshot.data != null
            ? _devotionCard(context, snapshot.data!)
            : ShimmerWidget.withList(length: 1);

      },
    );
  }

  Widget _devotionCard(BuildContext context, List<DevotionalBookModel> list) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (list.isEmpty) {
      return const SizedBox.shrink();
    }

    final devotion = list.first.devotion;
    final content = html_parser.parse(devotion?.content ?? '').body?.text ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                text: TextSpan(children: [
                  TextSpan(
                    text: content,
                    style: textTheme.labelMedium?.copyWith(
                        fontSize: 12.dp(), color: colorScheme.tertiary),
                  ),
                ]),
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
                    // backgroundColor: colorScheme.tertiary,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.dp(),
                      vertical: 0.1.dp(),
                    ),
                    child: Center(
                        child: Text(
                      "Read More",
                      style: textTheme.labelMedium,
                    )),
                  ),
                  Row(
                    children: [
                      IconButtonWidget(
                        icon: Icons.share,iconSize: 22.dp(),
                        iconColor: colorScheme.tertiary,
                        onTap: (){
                          SharePlus.instance.share(
                              ShareParams(text: content, title: 'Scripture Union',subject: devotion?.title ?? '')
                          );
                        },
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
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
