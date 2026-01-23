import 'package:core_module/core_module.dart';
import 'package:student_union/core/model/remote/app_update_model.dart';
import 'package:student_union/core/services/app/iapp_update_service.dart';

class AppUpdateService extends BaseApiService implements IAppUpdateService {
  static AppUpdateService? _instance;
  AppUpdateService._();

  factory AppUpdateService() {
    return _instance ??= AppUpdateService._();
  }

  @override
  Future<AppUpdateModel> checkForUpdate() async {
    final response = await _instance?.getRequest<AppUpdateModel>(
      api: 'app_versions/latest',
      parser: (json) {
        return AppUpdateModel.fromJson(json["app_version"]);
      },
    );

    return response ?? AppUpdateModel();
  }
}
