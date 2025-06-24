import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/card_container_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart'
    show ContainerWidget;
import 'package:core_module/core_ui/widgets/icon_button_widget.dart';
import 'package:core_module/core_ui/widgets/list_view_widget.dart';
import 'package:core_module/core_ui/widgets/network_image_widget.dart';
import 'package:core_module/core_ui/widgets/no_data_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart'
    show ShimmerWidget;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart' show Gap;
import 'package:student_union/core-ui/widgets/title_text_widget.dart'
    show TitleTextWidget;
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/remote/news_update_model.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/screens/dashboard/news/ui/news_screen.dart';

class NewsUpdateWidget extends StatelessWidget {
  final bool withDetails;
  final Function(NewsUpdateModel)? onShareOnTap;
  final Function(NewsUpdateModel)? onReadTap;
  final Function()? onMoreOnTap;
  final Function(NewsUpdateModel)? onTap;
  int page = 1;

  NewsUpdateWidget({
    super.key,
    this.onTap,
    this.onMoreOnTap,
  })  : withDetails = false,
        onReadTap = null,
        onShareOnTap = null;

  NewsUpdateWidget.withDetails({
    super.key,
    this.onReadTap,
    this.onShareOnTap,
    this.onTap,
  })  : withDetails = true,
        onMoreOnTap = null;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _onLoadMoreNews(page = 1),
        builder: (context, data) {
          return (data.hasData && data.data != null)
              ? (withDetails
                  ? _newsWithDetails(context, data.data!)
                  : _newsWithLessDetails(context, data.data!))
              : ShimmerWidget.withList(length: withDetails ? 4 : 1);
        });
  }

  /// This is the widget that displays news updates with MORE details
  Widget _newsWithDetails(BuildContext context, List<NewsUpdateModel> list) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (list.isEmpty) {
      return const NoDataWidget(
        asset: icNews,
        title: "You have no news here",
        description:
            'News update appears here. You do not have any news currently availabe.',
      );
    }

    return ListViewWidget<NewsUpdateModel>(
      items: list.obs,
      onLoadMore: () => _onLoadMoreNews(page = page + 1),
      onRefresh: () => _onLoadMoreNews(page = 1),
      parser: (e) {
        return InkWell(
          onTap: () {
            if (onTap != null) {
              onTap!(e);
            }
          },
          child: CardContainerWidget(
            elevation: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        maxLines: 4,
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
                      style: textTheme.labelSmall?.copyWith(fontSize: 12.dp()))
                ])),
                // Gap(2.dp()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '3 hours ago',
                      style: textTheme.labelMedium?.copyWith(
                          fontSize: 10.dp(),
                          color: colorScheme.tertiaryContainer),
                    ),
                    Row(
                      children: [
                        IconButtonWidget(
                          icon: Icons.share,
                          iconSize: 20,
                          iconColor: colorScheme.primary,
                          onTap: () {
                            if (onShareOnTap != null) {
                              onShareOnTap!(e);
                            }
                          },
                        ),
                        Gap(5.dp()),
                        IconButtonWidget(
                          icon: Icons.volume_up,
                          iconSize: 23,
                          iconColor: colorScheme.primary,
                          onTap: () {
                            if (onReadTap != null) {
                              onReadTap!(e);
                            }
                          },
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  /// This is the widget that displays news updates with less details
  Widget _newsWithLessDetails(
      BuildContext context, List<NewsUpdateModel> list) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return list.isEmpty
        ? const SizedBox.shrink()
        : Column(
            children: [
              Gap(20.dp()),
              TitleTextWidget(text: "News Updates", onTap: onMoreOnTap),
              ...list.map((e) => InkWell(
                    onTap: () => onTap?.call(e),
                    child: CardContainerWidget(
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
                                        text: e.title,
                                        style: textTheme.labelMedium?.copyWith(
                                            fontWeight: FontWeight.w600),
                                      )
                                    ])),
                                RichText(
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: e.description,
                                            style: textTheme.labelSmall
                                                ?.copyWith(fontSize: 12.dp()))
                                      ],
                                    )),
                                Gap(5.dp()),
                                Text(
                                  '3 hours ago',
                                  style: textTheme.labelMedium?.copyWith(
                                      fontSize: 10.dp(),
                                      color: colorScheme.tertiaryContainer),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          );
  }

  ///Load more Purchased books
  Future<List<NewsUpdateModel>> _onLoadMoreNews(int page) async {
    Map<String, Object> param = {
      "page": page.toString(),
    };
    return await newsUpdateApiService.fetchNewsUpdate(param: param);
  }
}
