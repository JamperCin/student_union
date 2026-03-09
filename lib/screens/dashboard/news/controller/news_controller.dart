import 'dart:convert';

import 'package:core_module/core_module.dart';
import 'package:student_union/core/app/app_routes.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/core/model/remote/news_update_model.dart';

class NewsController extends BaseController {
  final RxInt refreshTick = 0.obs;
  static const Map<String, Object> _firstPageParam = {"page": "1"};

  Future<void> onRefresh() async {
    await _refreshIfChanged(onlyWhenHasCachedData: false);
  }

  Future<void> onTabOpened() async {
    await _refreshIfChanged(onlyWhenHasCachedData: true);
  }

  Future<void> _refreshIfChanged({required bool onlyWhenHasCachedData}) async {
    if (onlyWhenHasCachedData &&
        !newsUpdateApiService.hasCachedNews(param: _firstPageParam)) {
      return;
    }

    final previous = jsonEncode(
      newsUpdateApiService
          .getCachedNews(param: _firstPageParam)
          .map((e) => e.toJson())
          .toList(),
    );

    try {
      await newsUpdateApiService.fetchNewsUpdate(
        param: _firstPageParam,
        forceRefresh: true,
      );
    } catch (_) {
      // Ignore refresh errors and let the UI retain previous state.
    }

    final current = jsonEncode(
      newsUpdateApiService
          .getCachedNews(param: _firstPageParam)
          .map((e) => e.toJson())
          .toList(),
    );
    if (previous != current) {
      refreshTick.value++;
    }
  }

  void onNewsUpdateTap(NewsUpdateModel news) {
    if (news.url.isEmpty) return;
    AppRouter.pushNamed(
      AppRouteNames.web,
      extra: WebModel(
        url: news.url,
        title: news.title.isEmpty ? "News Update" : news.title,
      ),
    );
  }
}
