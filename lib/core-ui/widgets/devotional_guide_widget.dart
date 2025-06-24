import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/extensions/string_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/list_view_widget.dart';
import 'package:core_module/core_ui/widgets/network_image_widget.dart';
import 'package:core_module/core_ui/widgets/no_data_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';
import 'package:student_union/core/res/asset_path.dart';

class DevotionalGuideWidget extends StatelessWidget {
  final String? yearFilter;
  final Axis? axis;
  final bool isAvailableBooks;
  final GestureTapCallback? onSeeMoreOnTap;
  final Function(DevotionalBookModel)? onTap;
  int page = 1;
  RxBool isLoadingAvailableBooks = false.obs;

  DevotionalGuideWidget.withAvailableBooks({
    super.key,
    this.yearFilter,
    this.onTap,
    this.onSeeMoreOnTap,
    this.axis = Axis.horizontal,
  }) : isAvailableBooks = true;

  DevotionalGuideWidget.withPurchasedBooks({
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

  ///Available Books entry from the build method
  Widget _availableBooks() {
    ///Return available books in a horizontal list
    if (axis == Axis.horizontal) {
      return FutureBuilder(
          future: devGuideService.fetchDevotionalBooks(),
          builder: (context, data) {
            return (data.hasData && data.data != null)
                ? _horizontalDisplayOfAvailableBooksWidget(data.data!)
                : ShimmerWidget.withList(length: 1);
          });
    }

    ///Return available books in a vertical grid
    page = 1;

    Map<String, dynamic>? param;
    if (yearFilter != null) {
      param = {
        "year": yearFilter,
        "page": page.toString(),
      };
    }

    return FutureBuilder(
        future: devGuideService.fetchDevotionalBooks(param: param),
        key: ValueKey(Uuid().v4()),
        builder: (context, data) {
          return (data.hasData && data.data != null)
              ? _gridViewDisplayOfAvailableBooksWidget(data.data!)
              : ShimmerWidget.withGrid(
                  height: appDimen.dimen(80),
                  width: appDimen.dimen(50),
                );
        });
  }

  Widget _purchasedBooks() {
     Map<String, dynamic>? param;
    if (yearFilter != null) {
      param = {
        "year": yearFilter,
        "page": page.toString(),
      };
    }

    return FutureBuilder(
        future: devGuideService.fetchPurchasedBooks(param: param),
        key: ValueKey(Uuid().v4()),
        builder: (context, snapshot) {
          return (snapshot.hasData && snapshot.data != null)
              ? _purchasedBooksWidget(snapshot.data!)
              : ShimmerWidget.withGrid(
                  height: appDimen.dimen(80),
                  width: appDimen.dimen(50),
                );
        });
  }

  Widget _purchasedBooksWidget(List<DevotionalBookModel> list) {
    if (list.isEmpty) {
      return const NoDataWidget(
        title: 'Purchased Books',
        asset: icOrders,
        description:
            'Your purchased books appear here. You don\'t have any purchased books yet.',
      );
    }

    return ListViewWidget<DevotionalBookModel>.withGridView(
        items: list.obs,
        parser: (book) {
          return NetworkImageWidget(
            height: appDimen.dimen(280),
            width: appDimen.screenWidth,
            onTap: () {
              onTap?.call(book);
            },
            url: book.thumbnail,
            fit: BoxFit.cover,
            placeHolderWidget: ContainerWidget(
              height: appDimen.dimen(280),
              width: appDimen.dimen(200),
            ),
          );
        },
        onLoadMore: () => _onLoadMorePurchasedBooks(page = page + 1),
        onRefresh: () => _onLoadMorePurchasedBooks(page = 1));
  }

  Widget _horizontalDisplayOfAvailableBooksWidget(
      List<DevotionalBookModel> list) {
    return list.isEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20.dp()),
              TitleTextWidget(text: "Devotional Guides", onTap: onSeeMoreOnTap),
              Gap(5.dp()),
              CarouselSlider.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index, realIndex) {
                    DevotionalBookModel model = list[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.dp()),
                      child: NetworkImageWidget(
                        height: appDimen.dimen(280),
                        width: appDimen.dimen(200),
                        onTap: () {
                          onTap?.call(model);
                        },
                        url: model.thumbnail,
                        fit: BoxFit.cover,
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
                  )),
            ],
          );
  }

  Widget _gridViewDisplayOfAvailableBooksWidget(
      List<DevotionalBookModel> list) {

    if (list.isEmpty) {
      return const NoDataWidget(
        title: 'Devotional Guides',
        asset: icOrders,
        description:
            'Available devotional guides appear here. No devotional guide has been added to the selected year yet.',
      );
    }

    return ListViewWidget<DevotionalBookModel>.withGridView(
      items: list.obs,
      onLoadMore:()=> _onLoadMoreAvailableBooks(page = page + 1),
      onRefresh: () => _onLoadMoreAvailableBooks(page = 1),
      parser: (book) {
        return InkWell(
          onTap: () {
            onTap?.call(book);
          },
          child: Column(
            children: [
              NetworkImageWidget(
                height: appDimen.dimen(280),
                width: appDimen.dimen(200),
                onTap: () {
                  onTap?.call(book);
                },
                url: book.thumbnail,
                fit: BoxFit.cover,
                placeHolderWidget: ContainerWidget(
                  height: appDimen.dimen(280),
                  width: appDimen.dimen(200),
                ),
              ),
              Gap(5.dp()),
              ButtonWidget.withOutLine(
                text: book.purchased
                    ? 'PURCHASED'
                    : "${book.currency} ${book.price.toDecimalPlaces()}",
                width: appDimen.dimen(200),
                onTap: () {
                  onTap?.call(book);
                },
              )
            ],
          ),
        );
      },
    );
  }

  ///Load more Available books
  Future<List<DevotionalBookModel>> _onLoadMoreAvailableBooks(int page) async {

    Map<String, Object>? param;

    if (yearFilter != null) {
      param = HashMap();
      param.putIfAbsent("year", () => yearFilter!);
      param.putIfAbsent("page", () => page.toString());
    }

    return await devGuideService.fetchDevotionalBooks(param: param);
  }

  ///Load more Purchased books
  Future<List<DevotionalBookModel>> _onLoadMorePurchasedBooks(int page) async {
    Map<String, Object>? param;

    if (yearFilter != null) {
      param = HashMap();
      param.putIfAbsent("year", () => yearFilter!);
      param.putIfAbsent("page", () => page.toString());
    }

    return await devGuideService.fetchPurchasedBooks(param: param);
  }
}
