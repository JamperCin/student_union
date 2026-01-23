import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/remote/news_update_model.dart';
import 'package:student_union/core/res/asset_path.dart';

class NewsUpdateWidget extends StatelessWidget {
  final bool withDetails;
  final Function(NewsUpdateModel)? onShareOnTap;
  final Function(NewsUpdateModel)? onReadTap;
  final Function()? onMoreOnTap;
  final Function(NewsUpdateModel)? onTap;
  int page = 1;
  RxInt selectedIndex = 0.obs;

  NewsUpdateWidget({super.key, this.onTap, this.onMoreOnTap})
    : withDetails = false,
      onReadTap = null,
      onShareOnTap = null;

  NewsUpdateWidget.withDetails({
    super.key,
    this.onReadTap,
    this.onShareOnTap,
    this.onTap,
  }) : withDetails = true,
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
      },
    );
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
            'News update appears here. You do not have any news currently available.',
      );
    }

    return ListViewWidget<NewsUpdateModel>(
      list: list,
      onLoadMore: () => _onLoadMoreNews(page = page + 1),
      onRefresh: () => _onLoadMoreNews(page = 1),
      listItemWidget: (e) {
        return InkWell(
          onTap: () {
            if (onTap != null) {
              onTap!(e);
            }
          },
          child: CardContainerWidget(
            padding: EdgeInsets.symmetric(
              horizontal: 10.dp(),
              vertical: 10.dp(),
            ),
            color: colorScheme.surfaceContainerHigh,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NetworkImageWidget(
                  url: e.image,
                  height: 80.dp(),
                  width: 80.dp(),
                  borderRadius: 5,
                  fit: BoxFit.cover,
                  // placeHolderWidget: ContainerWidget(
                  //   height: 80.dp(),
                  //   width: 80.dp(),
                  // ),
                ),
                Gap(10.dp()),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: e.title,
                              style: textTheme.labelLarge?.copyWith(
                                color: colorScheme.primary,
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
                              text: e.description,
                              style: textTheme.labelSmall?.copyWith(
                                fontSize: 12.dp(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(5.dp()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateTimeUtils().formatDate(e.createdAt),
                            style: textTheme.labelMedium?.copyWith(
                              fontSize: 10.dp(),
                              color: colorScheme.surfaceDim,
                            ),
                          ),
                          Row(
                            children: [
                              if (onShareOnTap != null)
                                IconButtonWidget(
                                  icon: Icons.share,
                                  iconSize: 20,
                                  iconColor: colorScheme.primary,
                                  onTap: () {
                                    onShareOnTap?.call(e);
                                  },
                                ),
                              Gap(5.dp()),
                              if (onReadTap != null)
                                IconButtonWidget(
                                  icon: Icons.volume_up,
                                  iconSize: 23,
                                  iconColor: colorScheme.primary,
                                  onTap: () {
                                    onReadTap?.call(e);
                                  },
                                ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// This is the widget that displays news updates with less details
  Widget _newsWithLessDetails(
    BuildContext context,
    List<NewsUpdateModel> list,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return list.isEmpty
        ? const SizedBox.shrink()
        : Column(
            children: [
              Gap(20.dp()),
              TitleTextWidget(text: "News Updates", onTap: onMoreOnTap),
              CarouselSlider.builder(
                itemCount: list.length,
                itemBuilder: (context, index, realIndex) {
                  NewsUpdateModel model = list[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.dp()),
                    child: _newsItemWidget(context, model),
                  );
                },
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  enableInfiniteScroll: true,
                  initialPage: list.length > 1 ? 1 : 0,
                  height: 150.dp(),
                  viewportFraction: 0.9,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    selectedIndex.value = index;
                  },
                ),
              ),
              Gap(10.dp()),
              Center(
                child: PodWidget(
                  podLength: list.length,
                  currentIndex: selectedIndex,
                ),
              ),
              Gap(20.dp()),
            ],
          );
  }

  Widget _newsItemWidget(BuildContext context, NewsUpdateModel e) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () => onTap?.call(e),
      child: CardContainerWidget(
        elevation: 5,
        child: Row(
          children: [
            NetworkImageWidget(
              url: e.image,
              height: 100.dp(),
              width: 100.dp(),
              fit: BoxFit.cover,
              placeHolderWidget: ContainerWidget(
                height: 100.dp(),
                width: 100.dp(),
              ),
            ),
            Gap(5.dp()),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    maxLines: 2,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: e.title,
                          style: textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: e.description,
                          style: textTheme.labelSmall?.copyWith(
                            fontSize: 12.dp(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(5.dp()),
                  Text(
                    DateTimeUtils().formatDate(e.createdAt),
                    style: textTheme.labelMedium?.copyWith(
                      fontSize: 10.dp(),
                      color: colorScheme.tertiaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///Load more Purchased books
  Future<List<NewsUpdateModel>> _onLoadMoreNews(int page) async {
    Map<String, Object> param = {"page": page.toString()};
    return await newsUpdateApiService.fetchNewsUpdate(param: param);
  }
}
