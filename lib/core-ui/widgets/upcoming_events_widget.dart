import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
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
  const UpcomingEventsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         TitleTextWidget(text: "Upcoming Events", onTap: (){},),
        Gap(5.dp()),
        FutureBuilder(
            future: upcomingEventsApiService.fetchUpcomingEvents(),
            builder: (context, data) {
              return (data.hasData && data.data != null)
                  ? _eventsGridWidget(context, data.data!)
                  : ShimmerWidget(width: appDimen.screenWidth);
            }),
      ],
    );
  }

  Widget _eventsGridWidget(
    BuildContext context,
    List<UpcomingEventModel> list,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final height = 180.dp();

    return CarouselSlider.builder(
        itemCount: list.length,
        itemBuilder: (context, index, realIndex) {
          UpcomingEventModel model = list[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.dp()),
            child: Column(
              children: [
                NetworkImageWidget(
                  height: height,
                  width: appDimen.screenWidth,
                  url: model.image,
                  fit: BoxFit.fitWidth,
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
                      model.title,
                      style: textTheme.labelSmall?.copyWith(fontSize: 8.dp()),
                    ),
                    Text(
                      model.date,
                      style: textTheme.labelMedium?.copyWith(fontSize: 8.dp()),
                    )
                  ],
                )
              ],
            ),
          );
        },
        options: CarouselOptions(
          scrollPhysics: const BouncingScrollPhysics(),
          height: height + 30.dp(),
          enableInfiniteScroll: false,
          initialPage: list.length > 1 ? 1 : 0,
          viewportFraction: 0.8,
        ));
  }
}
