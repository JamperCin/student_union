import 'package:core_module/core/services/base_api_service.dart';
import 'package:core_module/core/utils/file_utils.dart' show FileUtils;
import 'package:student_union/core/model/remote/news_update_model.dart';
import 'package:student_union/core/services/news_update/news_update_api_interface.dart';

class NewsUpdateApiService extends BaseApiService implements NewsUpdateApiInterface {
  static NewsUpdateApiService? _instance;


  NewsUpdateApiService._();

  factory NewsUpdateApiService() {
    return _instance ??= NewsUpdateApiService._();
  }

  @override
  Future<List<NewsUpdateModel>> fetchNewsUpdate() async {
    final results = await _instance?.getListRequest<NewsUpdateModel>(
          api: 'customer/v1/news',
          key: 'news',
          parser: (json) => NewsUpdateModel.fromJson(json),
        ) ??
        [];

    return results;
  }

  @override
  Future<NewsUpdateModel> fetchNewsDetails(String id) async {
    final result = await _instance?.getRequest<NewsUpdateModel>(
          api: 'customer/v1/news/$id',
          parser: (json) => NewsUpdateModel.fromJson(json),
        ) ??
        const NewsUpdateModel();

    return result;
  }
}
