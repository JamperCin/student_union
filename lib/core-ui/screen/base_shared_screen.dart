import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class BaseSharedScreen extends BaseScreenStandard{

  @override
  bool showAppBar() {
    return true;
  }

  @override
  double appBarElevation() {
    return 5;
  }

  @override
  Color appBarBackgroundColor(BuildContext context) {
    return colorScheme.primary;
  }

  @override
  TextStyle? appBarTitleStyle(BuildContext context) {
    return super
        .appBarTitleStyle(context)
        ?.copyWith(fontWeight: FontWeight.w700, color: colorScheme.surface);
  }

  @override
  Color appBarIconColor(BuildContext context) {
    return colorScheme.surface;
  }


}