import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:student_union/core/model/devotional_guide_model.dart';

import '../controller/devotion_controller.dart';

class DevotionDetailsScreen extends BaseScreenStandard{
  final _controller = Get.put(DevotionController());

  @override
  String appBarTitle() {
    return "Devotionals";
  }

  @override
  bool showAppBar() {
    return true;
  }

  @override
  TextStyle? appBarTitleStyle(BuildContext context) {
    return super
        .appBarTitleStyle(context)
        ?.copyWith(fontWeight: FontWeight.w700);
  }

  @override
  DevotionalGuideModel getModel() {
    return super.getModel() as DevotionalGuideModel;
  }

  @override
  Widget body(BuildContext context) {
    final text =
        'The secret things belong to the Lord our God, but the things revealed belong to us and to our children forever, that we may follow all the words of this law.';
    final lead = '—  ';
    final script = 'Deuteronomy 29:29';

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.dp(), vertical: 14.dp()),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.dp(), vertical: 14.dp()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: NetworkImageWidget(
                      url: getModel().image,
                      width: appDimen.screenWidth * 0.7,
                      height: appDimen.screenHeight * 0.5,
                      fit: BoxFit.cover,
                      placeHolderWidget: ContainerWidget(
                        width: appDimen.screenWidth,
                        height: appDimen.screenHeight * 0.4,
                      ),
                    ),
                  ),
                  Gap(40.dp()),
                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: getModel().description,
                          style: textTheme.labelMedium,
                        ),
                        TextSpan(
                          text: "\n\n",
                          style: textTheme.labelMedium,
                        ),
                        TextSpan(
                          text: lead,
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: 12.dp(),
                            color: colorScheme.secondary,
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.italic,
                          ),
                        ),TextSpan(
                          text: script,
                          style: textTheme.bodyMedium?.copyWith(
                           //fontSize: 12.dp(),
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ])),
                  Gap(20.dp()),
                ],
              ),
            ),
          ),
          ButtonWidget(
              text: "Buy",
              onTap: (){
                 _controller.onInitiateBuyOnClick(context,getModel());
              }),
          Gap(20.dp()),
        ],
      ),
    );
  }
}