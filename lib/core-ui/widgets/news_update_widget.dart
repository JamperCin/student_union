import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/widgets/card_container_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart' show ContainerWidget;
import 'package:core_module/core_ui/widgets/network_image_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart'
    show ShimmerWidget;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart' show Gap;
import 'package:student_union/core-ui/widgets/title_text_widget.dart'
    show TitleTextWidget;
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/news_update_model.dart';

class NewsUpdateWidget extends StatelessWidget {
  const NewsUpdateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleTextWidget(text: "News Updates"),
        Gap(5.dp()),
        FutureBuilder(
            future: newsUpdateApiService.fetchNewsUpdate(),
            builder: (context, data) {
              return (data.hasData && data.data != null)
                  ? _newsUpdateWidget(context, data.data!)
                  : ShimmerWidget(width: appDimen.screenWidth);
            }),
      ],
    );
  }

  Widget _newsUpdateWidget(BuildContext context, List<NewsUpdateModel> list) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        ...list.map((e) => CardContainerWidget(
              elevation: 1,
              child: Row(
                children: [
                  NetworkImageWidget(
                    url: e.image,
                    height: 70.dp(),
                    width: 70.dp(),
                    placeHolderWidget: ContainerWidget(
                      height: 70.dp(),
                      width: 70.dp(),
                    ),
                  ),
                  Gap(5.dp()),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            maxLines: 1,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: e.title, style: textTheme.labelMedium)
                            ])),
                        RichText(
                            maxLines: 2,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: e.description,
                                  style: textTheme.labelSmall
                                      ?.copyWith(fontSize: 8.dp()))
                            ])),
                        Gap(5.dp()),
                        Text(
                          '3 hours ago',
                          style:
                              textTheme.labelMedium?.copyWith(fontSize: 8.dp(), color: colorScheme.tertiaryContainer),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
