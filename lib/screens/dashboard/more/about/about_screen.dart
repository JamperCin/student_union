import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:student_union/core-ui/screen/base_shared_screen.dart';
import 'package:student_union/core/res/asset_path.dart';

class AboutScreen extends BaseSharedScreen {
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
            AssetImageWidget(asset: icSu, height: 180.dp(), width: 250.dp()),
            Gap(5.dp()),
            FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder:
                  (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
                    return Text(
                      'Scripture Union ${snapshot.data?.version}',
                      style: textTheme.bodyMedium,
                    );
                  },
            ),
            Gap(40.dp()),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "The ", style: textTheme.bodySmall),
                  TextSpan(
                    text: "Scripture Union (SU) Ghana ",
                    style: textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text:
                        "is a Christian para-church organisation established in 1890. It is part of the global SU movement, which is active in more than 120 countries worldwide. SU Ghana aims to make God's Good News known to children, young people and families."
                        "\n\nThis app is built to enable believers to read God’s Word daily and to be connected to the SU Community nationwide.",
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
