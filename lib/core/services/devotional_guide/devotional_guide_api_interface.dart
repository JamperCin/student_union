import 'dart:collection';

import 'package:student_union/core/model/devotional_guide_model.dart';

abstract class DevotionalGuideApiInterface {
  Future<List<DevotionalGuideModel>> fetchListOfDevotionalGuide({HashMap? param});

}
