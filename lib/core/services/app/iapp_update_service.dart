import 'package:student_union/core/model/remote/app_update_model.dart';

abstract interface class IAppUpdateService {
  Future<AppUpdateModel> checkForUpdate();
}