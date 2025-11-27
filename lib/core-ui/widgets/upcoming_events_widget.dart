import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/utils/date_time_utils.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/network_image_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core_module.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/remote/upcoming_event_model.dart';

class UpcomingEventsWidget extends StatelessWidget {
  final Function(UpcomingEventModel)? onTap;
  final Function()? onSeeAllOnTap;
  RxInt selectedIndex = 0.obs;
  int page = 1;

  UpcomingEventsWidget({super.key, this.onTap, this.onSeeAllOnTap});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: upcomingEventsApiService.fetchUpcomingEvents(),
      builder: (context, data) {
        return (data.hasData && data.data != null)
            ? _eventsGridWidget(context, data.data!)
            : ShimmerWidget.withList(length: onSeeAllOnTap != null ? 1 : 5);
      },
    );
  }

  Widget _eventsGridWidget(
    BuildContext context,
    List<UpcomingEventModel> list,
  ) {
    if (list.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Gap(20.dp()),
        TitleTextWidget(text: "Upcoming Events", onTap: onSeeAllOnTap),
        Gap(5.dp()),
        CarouselSlider.builder(
          itemCount: list.length,
          itemBuilder: (context, index, realIndex) {
            UpcomingEventModel model = list[index];
            return _eventItemWidget(context, model);
          },
          options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            height: 210.dp(),
            enableInfiniteScroll: true,
            initialPage: list.length > 1 ? 1 : 0,
            viewportFraction: 0.8,
            autoPlay: true,
            onPageChanged: (index, reason) {
              selectedIndex.value = index;
            },
          ),
        ),
        Gap(10.dp()),
        Center(
          child: PodWidget(podLength: list.length, currentIndex: selectedIndex),
        ),
        Gap(10.dp()),
      ],
    );
  }

  Widget _eventItemWidget(BuildContext context, UpcomingEventModel model) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final height = 180.dp();

    return InkWell(
      onTap: () => onTap?.call(model),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.dp()),
        child: Column(
          children: [
            NetworkImageWidget(
              height: height,
              width: appDimen.screenWidth,
              url: model.image,
              fit: BoxFit.cover,
              placeHolderWidget: ContainerWidget(
                height: height,
                width: appDimen.screenWidth,
              ),
            ),
            Gap(2.dp()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.name,
                  style: textTheme.labelSmall?.copyWith(fontSize: 8.dp()),
                ),
                Text(
                  DateTimeUtils().formatDate(
                    model.date,
                    format: "dd MMM, yyyy",
                  ),
                  style: textTheme.labelMedium?.copyWith(fontSize: 8.dp()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
