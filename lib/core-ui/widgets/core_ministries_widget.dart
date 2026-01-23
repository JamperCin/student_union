import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/widgets/simple_card_item.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/remote/campaign_model.dart';
import 'package:student_union/core/res/asset_path.dart';

class CoreMinistriesWidget extends StatelessWidget {
  final bool horizontalGrid;
  final Function(DonationModel)? onTap;
  final GestureTapCallback? onSeeMore;
  RxInt selectedIndex = 0.obs;

  CoreMinistriesWidget({super.key, this.onTap, this.onSeeMore})
    : horizontalGrid = true;

  CoreMinistriesWidget.withDonations({super.key, this.onTap})
    : horizontalGrid = false,
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
      },
    );
  }

  Widget _horizontalGridItem(BuildContext context, List<DonationModel> list) {
    if (list.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Gap(20.dp()),
        TitleTextWidget(text: "Donations", onTap: onSeeMore),
        Gap(10.dp()),
        CarouselSlider.builder(
          itemCount: list.length,
          itemBuilder: (context, index, realIndex) {
            DonationModel model = list[index];
            return SimpleCardItem<DonationModel>.withButton(
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

  Widget _donationsScreen(BuildContext context) {
    return FutureBuilder(
      future: campaignApiService.fetchListOfCoreMinistries(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return (snapshot.hasData && snapshot.data != null)
            ? _campaignsLayout(context, snapshot.data)
            : ShimmerWidget.withList();
      },
    );
  }

  Widget _campaignsLayout(BuildContext context, List<DonationModel> list) {
    if (list.isEmpty) {
      return const NoDataWidget(
        asset: icCoreMinistry,
        title: "No core ministries available",
        description:
            "Core ministries created appears here.There are no core ministries at the moment.",
      );
    }
    return ListViewWidget(
      list: list,
      listItemWidget: (model) {
        return SimpleCardItem<DonationModel>(
          title: model.title,
          model: model,
          onTap: onTap,
        );
      },
    );
  }
}
