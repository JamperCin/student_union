import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';

import '../news/news_screen.dart';

class DonationsScreen extends NewsScreen{

  @override
  String appBarTitle() {
    return "Donation";
  }


  @override
  Widget body(BuildContext context) {
   return Padding(
     padding: EdgeInsets.all(16.dp()),
     child: Column(
       children: [
         TitleTextWidget(text: "Donate to our core minitries"),
         Gap(10.dp()),
         Expanded(
           child: ListView(children: [

           ]),
         ),
       ],
     ),
   );
  }

}