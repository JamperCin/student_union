import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/card_container_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';
import 'package:student_union/core/def/global_access.dart';

import '../../core/model/devotional_guide_model.dart';
import '../../core/res/asset_path.dart';

class CoreMinistriesWidget extends StatelessWidget {
  const CoreMinistriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleTextWidget(text: "Core Ministries"),
        Gap(5.dp()),
        FutureBuilder(
            future: coreMinistryApiService.fetchListOfCoreMinistries(),
            builder: (context, data) {
              return (data.hasData && data.data != null)
                  ? _ministryGridWidget(context, data.data!)
                  : ShimmerWidget(width: appDimen.screenWidth);
            }),
      ],
    );
  }

  Widget _ministryGridWidget(
    BuildContext context,
    List<DevotionalGuideModel> list,
  ) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final buttonTheme = Theme.of(context).colorScheme;

    return CarouselSlider.builder(
        itemCount: list.length,
        itemBuilder: (context, index, realIndex) {
          DevotionalGuideModel model = list[index];
          return CardContainerWidget(
            padding: EdgeInsets.all(5.dp()),
            margin: EdgeInsets.only(top: 7.dp(), right: 5.dp(), left: 5.dp(), bottom: 5.dp()),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AssetImageWidget(
                  asset: icCoreMinistry,
                  height: 60.dp(),
                  width: 100.dp(),
                ),
                Gap(10.dp()),
                SizedBox(
                  height: 40.dp(),
                  child: RichText(
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: model.title,
                              style: textTheme.labelMedium
                                  ?.copyWith(fontSize: 8.dp()))
                        ],
                      )),
                ),
                Gap(10.dp()),
                ButtonWidget(
                  onTap: () {},
                  height: 35.dp(),
                  text: 'Donate',
                ),
              ],
            ),
          );
        },
        options: CarouselOptions(
          scrollPhysics: const BouncingScrollPhysics(),
          height: 220.dp(),
          enableInfiniteScroll: false,
          initialPage: list.length > 1 ? 1 : 0,
          viewportFraction: 0.4,
        ));
  }
}
