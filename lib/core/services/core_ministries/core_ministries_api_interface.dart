import 'package:student_union/core/model/devotional_guide_model.dart';

abstract class CoreMinistriesApiInterface{
  Future<List<DevotionalGuideModel>> fetchListOfCoreMinistries();
}