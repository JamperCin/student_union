import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/double_extension.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/icon_button_widget.dart';
import 'package:core_module/core_ui/widgets/network_image_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/devotional_guide_model.dart';

class DevotionalGuideWidget extends StatelessWidget {
  final String? yearFilter;
  final Axis? axis;
  final bool isAvailableBooks;
  final GestureTapCallback? onSeeMoreOnTap;
  final Function(DevotionalGuideModel)? onTap;

  const DevotionalGuideWidget.withAvailableBooks({
    super.key,
    this.yearFilter,
    this.onTap,
    this.onSeeMoreOnTap,
    this.axis = Axis.horizontal,
  }) : isAvailableBooks = true;

  const DevotionalGuideWidget.withPurchasedBooks({
    super.key,
    this.yearFilter,
    this.onTap,
  })  : axis = null,
        onSeeMoreOnTap = null,
        isAvailableBooks = false;

  @override
  Widget build(BuildContext context) {
    return isAvailableBooks ? _availableBooks() : _purchasedBooks();
  }

  Widget _availableBooks() {
    if (axis == Axis.horizontal) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTextWidget(text: "Devotional Guides", onTap: onSeeMoreOnTap),
          Gap(5.dp()),
          FutureBuilder(
              future: devGuideService.fetchListOfDevotionalGuide(),
              builder: (context, data) {
                return (data.hasData && data.data != null)
                    ? _horizontalDisplayOfAvailableBooksWidget(data.data!)
                    : ShimmerWidget(width: appDimen.screenWidth);
              }),
        ],
      );
    } else {
      HashMap<String, Object> param = HashMap();
      param.putIfAbsent("bookType", () => "");
      param.putIfAbsent("year", () => yearFilter ?? "");

      return FutureBuilder(
          future: devGuideService.fetchListOfDevotionalGuide(param: param),
          builder: (context, data) {
            return (data.hasData && data.data != null && data.data!.isNotEmpty)
                ? _gridViewDisplayOfAvailableBooksWidget(data.data!)
                : ShimmerWidget.withGrid(
                    height: appDimen.dimen(80),
                    width: appDimen.dimen(50),
                  );
          });
    }
  }

  Widget _purchasedBooks() {
    return FutureBuilder(
        future: devGuideService.fetchListOfDevotionalGuide(),
        builder: (context, snapshot) {
          return (snapshot.hasData &&
                  snapshot.data != null &&
                  snapshot.data!.isNotEmpty)
              ? GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.7,
                  children: [
                    ...snapshot.data!.map((e) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.dp(), vertical: 10.dp()),
                          child: Column(
                            children: [
                              NetworkImageWidget(
                                height: appDimen.dimen(280),
                                width: appDimen.dimen(200),
                                onTap: () {
                                  if (onTap != null) onTap!(e);
                                },
                                url: e.image,
                                placeHolderWidget: ContainerWidget(
                                  height: appDimen.dimen(280),
                                  width: appDimen.dimen(200),
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                )
              : ShimmerWidget.withGrid(
                  height: appDimen.dimen(80),
                  width: appDimen.dimen(50),
                );
        });
  }

  Widget _horizontalDisplayOfAvailableBooksWidget(
      List<DevotionalGuideModel> list) {
    return CarouselSlider.builder(
        itemCount: list.length,
        itemBuilder: (context, index, realIndex) {
          DevotionalGuideModel model = list[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.dp()),
            child: NetworkImageWidget(
              height: appDimen.dimen(280),
              width: appDimen.dimen(200),
              onTap: () {
                if (onTap != null) onTap!(model);
              },
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

  Widget _gridViewDisplayOfAvailableBooksWidget(
      List<DevotionalGuideModel> list) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      childAspectRatio: 0.6,
      children: [
        ...list.map((e) => Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 5.dp(), vertical: 10.dp()),
              child: Column(
                children: [
                  NetworkImageWidget(
                    height: appDimen.dimen(280),
                    width: appDimen.dimen(200),
                    onTap: () {
                      if (onTap != null) onTap!(e);
                    },
                    url: e.image,
                    placeHolderWidget: ContainerWidget(
                      height: appDimen.dimen(280),
                      width: appDimen.dimen(200),
                    ),
                  ),
                  Gap(5.dp()),
                  ButtonWidget.withOutLine(
                    text: "${e.currency} ${e.amount.toDecimalPlaces()}",
                    width: appDimen.dimen(200),
                    onTap: () {
                      if (onTap != null) onTap!(e);
                    },
                  )
                ],
              ),
            ))
      ],
    );
  }
}
