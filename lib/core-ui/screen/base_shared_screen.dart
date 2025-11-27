import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_impl.dart';
import 'package:flutter/material.dart';

class BaseSharedScreen extends StatelessWidget implements BaseImpl {
  late ColorScheme colorScheme;
  late TextTheme textTheme;
  BaseObject baseObject = BaseObject();

  bool showAppBar() {
    return true;
  }

  Widget body(BuildContext context) {
    return SizedBox();
  }

  String appBarTitle() {
    return "";
  }

  List<Widget> actions() {
    return [];
  }

  Color backgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }

  void dismissKeyBoard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    colorScheme = Theme.of(context).colorScheme;
    textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: showAppBar()
          ? AppBar(title: Text(appBarTitle()), actions: actions())
          : null,
      body: GestureDetector(
        child: body(context),
        onTap: () {
          dismissKeyBoard(context);
        },
      ),
      backgroundColor: backgroundColor(context),
    );
  }

  @override
  BaseObject getModel() {
    return baseObject;
  }

  @override
  void setModel(BaseObject baseObject) {
    this.baseObject = baseObject;
  }
}
