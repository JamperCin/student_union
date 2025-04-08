import 'package:core_module/core/model/local/base_object.dart';

class WebModel extends BaseObject {
  final String url;
  final String? title;
  final Function? onDoneOnclick;

  WebModel({
    required this.url,
    this.title,
    this.onDoneOnclick,
  });
}
