import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/network_image_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/devotional_guide_model.dart';

class DevotionalGuideWidget extends StatelessWidget {
  const DevotionalGuideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleTextWidget(text: "Devotional Guides"),
        Gap(5.dp()),
        FutureBuilder(
            future: devGuideService.fetchListOfDevotionalGuide(),
            builder: (context, data) {
              return (data.hasData && data.data != null)
                  ? _devotionGridWidget(data.data!)
                  : ShimmerWidget(width: appDimen.screenWidth);
            }),
      ],
    );
  }

  Widget _devotionGridWidget(List<DevotionalGuideModel> list) {
    return CarouselSlider.builder(
        itemCount: list.length,
        itemBuilder: (context, index, realIndex) {
          DevotionalGuideModel model = list[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.dp()),
            child: NetworkImageWidget(
              height: appDimen.dimen(280),
              width: appDimen.dimen(200),
              url: model.image,
              placeHolderWidget: ContainerWidget(
                height: appDimen.dimen(280),
                width: appDimen.dimen(200),
              ),
            ),
          );
        },
        options: CarouselOptions(
          scrollPhysics: const BouncingScrollPhysics(),
          enableInfiniteScroll: false,
          initialPage: list.length > 1 ? 1 : 0,
          viewportFraction: 0.4,
        ));
  }
}
