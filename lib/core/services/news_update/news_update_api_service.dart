import 'package:core_module/core/services/base_api_service.dart';
import 'package:core_module/core/utils/file_utils.dart' show FileUtils;
import 'package:student_union/core/model/news_update_model.dart';
import 'package:student_union/core/services/news_update/news_update_api_interface.dart';

class NewsUpdateApiService extends BaseApiService implements NewsUpdateApiInterface{
  static NewsUpdateApiService? _instance;
  final path = "assets/data/upcoming_events.json";

  NewsUpdateApiService._();

  factory NewsUpdateApiService() {
    return _instance ??= NewsUpdateApiService._();
  }

  @override
  Future<List<NewsUpdateModel>> fetchNewsUpdate() async{
    await Future.delayed(const Duration(seconds: 2));
    final results = await FileUtils().fetchList<NewsUpdateModel>(
      path: path,
      objectKey: 'data',
      key: 'events',
      parser: (json) => NewsUpdateModel.fromJson(json),
    );

    return results;
  }

}