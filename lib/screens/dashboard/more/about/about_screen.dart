import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/res/asset_path.dart';

class AboutScreen extends BaseScreenStandard {
  @override
  bool showAppBar() {
    return true;
  }

  @override
  String appBarTitle() {
    return 'About';
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: appDimen.dimen(24),
        vertical: appDimen.dimen(16),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AssetImageWidget(
              asset: icSu,
              height: 180.dp(),
              width: 250.dp(),
            ),
            Gap(5.dp()),
            Text('Scripture Union 1.0.0', style: textTheme.bodyMedium),
            Gap(40.dp()),
            RichText(
                text: TextSpan(
              children: [
                TextSpan(text: "The ", style: textTheme.bodySmall),
                TextSpan(
                    text: "Scripture Union (SU) ", style: textTheme.bodyLarge),
                TextSpan(
                  text: "is a dedicated platform designed to connect and "
                      "empower students across Ghana. It serves as a hub for accessing"
                      " vital resources, engaging in community activities, and "
                      "staying informed about union events and initiatives."
                      "\n\nWith features like easy donations, daily devotionals, "
                      "and inspiring faith-based content, the app is built to support "
                      "students' academic, spiritual, and social growth. Together, "
                      "let’s create a stronger, united student community.",
                  style: textTheme.bodySmall,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
