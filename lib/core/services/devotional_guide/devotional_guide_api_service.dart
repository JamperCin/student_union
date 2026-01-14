import 'package:core_module/core_module.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';
import 'package:student_union/core/services/devotional_guide/devotional_guide_api_interface.dart';

class DevotionalGuideApiService extends BaseApiService
    implements DevotionalGuideApiInterface {
  static DevotionalGuideApiService? _instance;

  DevotionalGuideApiService._();

  factory DevotionalGuideApiService() {
    return _instance ??= DevotionalGuideApiService._();
  }

  @override
  Future<List<DevotionalBookModel>> fetchDevotionalBooks({
    Map<String, dynamic>? param,
  }) async {
    final results =
        await _instance?.getListRequest<DevotionalBookModel>(
          api: "customer/v1/devotion_years",
          key: 'devotion_years',
          param: param,
          parser: (json) {
            DevotionalBookModel dev = DevotionalBookModel.fromJson(json);
            dev = dev.copyWith(heroTag: Uuid().v4());
            return dev;
          },
        ) ??
        [];
    return results;
  }

  @override
  Future<List<DevotionalBookModel>> fetchPurchasedBooks({
    Map<String, dynamic>? param,
  }) async {
    final results =
        await _instance?.getListRequest<DevotionalBookModel>(
          api: "customer/v1/purchased_devotions",
          key: 'purchased_devotion_years',
          param: param,
          parser: (json) {
            DevotionalBookModel dev = DevotionalBookModel.fromJson(json);
            dev = dev.copyWith(heroTag: Uuid().v4());
            return dev;
          },
        ) ??
        [];
    return results;
  }

  @override
  Future<List<DevotionalBookModel>> fetchDailyDevotion({
    Map<String, dynamic>? param,
  }) async {
    final results =
        await _instance?.getListRequest<DevotionalBookModel>(
          api: "customer/v1/purchased_devotions/today",
          key: 'devotions',
          param: param,
          parser: (json) {
            DevotionalBookModel dev = DevotionalBookModel.fromJson(json);
            dev = dev.copyWith(heroTag: Uuid().v4());
            return dev;
          },
        ) ??
        [];
    return results;
  }
}
