import 'package:core_module/core/model/local/base_object.dart' show BaseObject;
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/widgets/news_update_widget.dart';
import 'package:student_union/core/model/news_update_model.dart';

class NewsScreen extends BaseScreenStandard{
  bool showAppBarIcon = false;

  @override
  bool showAppBar() {
    return true;
  }

  @override
  String appBarTitle() {
    return "News Update";
  }

  @override
  Widget? appBarLeadingIcon(BuildContext context) {
    print("BAr 2==> $showAppBarIcon");
    return showAppBarIcon ? super.appBarLeadingIcon(context) : SizedBox.shrink();
  }
  @override
  void setModel(BaseObject baseObject) {
    super.setModel(baseObject);
    if(baseObject is NewsUpdateModel){
      showAppBarIcon = true;
    }else{
      showAppBarIcon = false;
    }
    print("BAr ==> $showAppBarIcon");
  }

  @override
  Widget body(BuildContext context) {
    return ListView(children: [
      NewsUpdateWidget.withDetails()
    ],);
  }

}