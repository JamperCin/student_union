import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/card_container_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:student_union/core-ui/widgets/simple_card_item.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';
import 'package:student_union/core/def/global_access.dart';

import '../../core/model/core_ministry_model.dart';
import '../../core/res/asset_path.dart';
import '../../screens/dashboard/donate/ui/donations_core_ministries_screen.dart';

class CoreMinistriesWidget extends StatelessWidget {
  final bool horizontalGrid;
  final Function(CoreMinistryModel)? onTap;
  final GestureTapCallback? onSeeMore;

  const CoreMinistriesWidget({
    super.key,
    this.onTap,
    this.onSeeMore,
  }) : horizontalGrid = true;

  const CoreMinistriesWidget.withDonations({
    super.key,
    this.onTap,
  })  : horizontalGrid = false,
        onSeeMore = null;

  @override
  Widget build(BuildContext context) {
    return horizontalGrid
        ? _coreMinistriesScreen(context)
        : _donationsScreen(context);
  }

  Widget _coreMinistriesScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextWidget(
          text: "Core Ministries",
          onTap: onSeeMore,
        ),
        Gap(10.dp()),
        FutureBuilder(
            future: coreMinistryApiService.fetchListOfCoreMinistries(),
            builder: (context, data) {
              return (data.hasData && data.data != null)
                  ? CarouselSlider.builder(
                      itemCount: data.data?.length,
                      itemBuilder: (context, index, realIndex) {
                        CoreMinistryModel model = data.data![index];
                        return SimpleCardItem<CoreMinistryModel>.withButton(
                          title: model.title,
                          onTap: onTap,
                          model: model,
                        );
                      },
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        height: 220.dp(),
                        enableInfiniteScroll: false,
                        initialPage: data.data!.length > 1 ? 1 : 0,
                        viewportFraction: 0.5,
                      ))
                  : ShimmerWidget(width: appDimen.screenWidth);
            }),
      ],
    );
  }

  Widget _donationsScreen(BuildContext context) {
    return FutureBuilder(
      future: coreMinistryApiService.fetchListOfCoreMinistries(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return (snapshot.hasData && snapshot.data != null)
            ? ListView(
                children: [
                  ...snapshot.data
                      .map((model) => SimpleCardItem<CoreMinistryModel>(
                            title: model.title,
                            model: model,
                            onTap: onTap,
                          )),
                ],
              )
            : ShimmerWidget.withList();
      },
    );
  }
}
