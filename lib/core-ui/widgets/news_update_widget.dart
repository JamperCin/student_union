import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/widgets/card_container_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart'
    show ContainerWidget;
import 'package:core_module/core_ui/widgets/icon_button_widget.dart';
import 'package:core_module/core_ui/widgets/network_image_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart'
    show ShimmerWidget;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart' show Gap;
import 'package:student_union/core-ui/widgets/title_text_widget.dart'
    show TitleTextWidget;
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/news_update_model.dart';
import 'package:student_union/screens/dashboard/news/news_screen.dart';

class NewsUpdateWidget extends StatelessWidget {
  final bool withDetails;
  final GestureTapCallback? onShareOnTap;
  final GestureTapCallback? onReadTap;

  const NewsUpdateWidget({super.key})
      : withDetails = false,
        onReadTap = null,
        onShareOnTap = null;

  const NewsUpdateWidget.withDetails({
    super.key,
    this.onReadTap,
    this.onShareOnTap,
  }) : withDetails = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: newsUpdateApiService.fetchNewsUpdate(),
        builder: (context, data) {
          return (data.hasData && data.data != null)
              ? (withDetails
                  ? _newsWithDetails(context, data.data!)
                  : _newsWithLessDetails(context, data.data!))
              : ShimmerWidget.withList(length: 4);
        });
  }

  /// This is the widget that displays news updates with MORE details
  Widget _newsWithDetails(BuildContext context, List<NewsUpdateModel> list) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        ...list.map((e) => CardContainerWidget(
              elevation: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      NetworkImageWidget(
                        url: e.image,
                        height: 70.dp(),
                        width: 70.dp(),
                        borderRadius: 5,
                        placeHolderWidget: ContainerWidget(
                          height: 70.dp(),
                          width: 70.dp(),
                        ),
                      ),
                      Gap(5.dp()),
                      Flexible(
                        child: RichText(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: e.title,
                                  style: textTheme.labelLarge
                                      ?.copyWith(color: colorScheme.primary))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(5.dp()),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: e.description,
                        style: textTheme.labelSmall?.copyWith(fontSize: 8.dp()))
                  ])),
                  // Gap(2.dp()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '3 hours ago',
                        style: textTheme.labelMedium?.copyWith(
                            fontSize: 8.dp(),
                            color: colorScheme.tertiaryContainer),
                      ),
                      Row(
                        children: [
                          IconButtonWidget(
                            icon: Icons.share,
                            iconColor: colorScheme.primary,
                            onTap: onShareOnTap,
                          ),
                          Gap(5.dp()),
                          IconButtonWidget(
                            icon: Icons.volume_up,
                            iconColor: colorScheme.primary,
                            onTap: onReadTap,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )),
      ],
    );
  }

  /// This is the widget that displays news updates with less details
  Widget _newsWithLessDetails(
      BuildContext context, List<NewsUpdateModel> list) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        TitleTextWidget(
          text: "News Updates",
          onTap: () {
            navUtils.fireTarget(NewsScreen(), model: NewsUpdateModel());
          },
        ),
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
                          style: textTheme.labelMedium?.copyWith(
                              fontSize: 8.dp(),
                              color: colorScheme.tertiaryContainer),
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
