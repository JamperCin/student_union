import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core_module.dart';
import 'package:student_union/core-ui/widgets/simple_card_item.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/remote/campaign_model.dart';

class CoreMinistriesWidget extends StatelessWidget {
  final bool horizontalGrid;
  final Function(CampaignModel)? onTap;
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
    return FutureBuilder(
        future: campaignApiService.fetchListOfCoreMinistries(),
        builder: (context, data) {
          return (data.hasData && data.data != null)
              ? _horizontalGridItem(context, data.data!)
              : ShimmerWidget.withList(length: 1);
        });
  }

  Widget _horizontalGridItem(BuildContext context, List<CampaignModel> list) {
    if (list.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Gap(20.dp()),
        TitleTextWidget(
          text: "Core Ministries",
          onTap: onSeeMore,
        ),
        Gap(10.dp()),
        CarouselSlider.builder(
            itemCount: list.length,
            itemBuilder: (context, index, realIndex) {
              CampaignModel model = list[index];
              return SimpleCardItem<CampaignModel>.withButton(
                title: model.title,
                onTap: onTap,
                model: model,
              );
            },
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              height: 220.dp(),
              enableInfiniteScroll: false,
              initialPage: list.length > 1 ? 1 : 0,
              viewportFraction: 0.5,
            )),
      ],
    );
  }

  Widget _donationsScreen(BuildContext context) {
    return FutureBuilder(
      future: campaignApiService.fetchListOfCoreMinistries(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return (snapshot.hasData && snapshot.data != null)
            ? ListView(
                children: [
                  ...snapshot.data.map((model) => SimpleCardItem<CampaignModel>(
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
