import 'package:core_module/core/model/local/base_object.dart';

class WebModel extends BaseObject {
  final String url;
  final String? title;
  final String? content;
  final Function? onDoneOnclick;
  final Uri? uri;
  final bool showAppBar;

  WebModel({
    this.url = '',
    this.title,
    this.uri,
    this.content,
    this.showAppBar = true,
    this.onDoneOnclick,
  });
}
