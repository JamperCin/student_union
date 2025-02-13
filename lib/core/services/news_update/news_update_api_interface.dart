import 'package:student_union/core/model/news_update_model.dart';

abstract class NewsUpdateApiInterface{
  Future<List<NewsUpdateModel>> fetchNewsUpdate();
}