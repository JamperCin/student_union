import 'dart:ui';

import 'package:core_module/core/model/local/base_object.dart';

class WebModel extends BaseObject {
  final String url;
  final String? title;
  final String? content;
  final List<Section>? sections;
  final Function? onDoneOnclick;
  final Uri? uri;
  final bool showAppBar;
  final Color? appBarColor;
  final Color? backgroundColor;

  WebModel({
    this.url = '',
    this.sections,
    this.appBarColor,
    this.backgroundColor,
    this.title,
    this.uri,
    this.content,
    this.showAppBar = true,
    this.onDoneOnclick,
  });
}

class Section {
  final String title;
  final String content;

  Section({required this.title, required this.content});
}
