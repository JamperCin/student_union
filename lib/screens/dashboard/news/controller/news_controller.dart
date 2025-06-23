import 'package:core_module/core/def/global_def.dart';
import 'package:student_union/core-ui/screen/base_web.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/core/model/remote/news_update_model.dart';

class NewsController extends BaseController {
  void onNewsUpdateTap(NewsUpdateModel news) {
    navUtils.fireTarget(
      BaseWebView(model: WebModel(
        url: "https://www.catholic.org/bible/daily_reading/",
        title: "News Update",
      ),),

    );
  }
}
