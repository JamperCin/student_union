import 'package:student_union/core/model/remote/news_update_model.dart';

abstract class NewsUpdateApiInterface{

  Future<List<NewsUpdateModel>> fetchNewsUpdate();
  Future<NewsUpdateModel> fetchNewsDetails(String id);
}