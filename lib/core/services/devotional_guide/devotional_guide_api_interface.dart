
import 'package:student_union/core/model/remote/devotional_book_model.dart';

abstract class DevotionalGuideApiInterface {
  Future<List<DevotionalBookModel>> fetchDevotionalBooks({Map<String, dynamic>? param});
  Future<List<DevotionalBookModel>> fetchPurchasedBooks({Map<String, dynamic>? param});
  Future<List<DevotionalBookModel>> fetchDailyDevotion({Map<String, dynamic>? param});

}
