import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/model/local/success_model.dart';
import 'package:student_union/core/res/asset_path.dart';

class SuccessScreen extends BaseScreenStandard {
  final GestureTapCallback? onTap;

  SuccessScreen({this.onTap});

  @override
  SuccessModel getModel() {
    return super.getModel() as SuccessModel;
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.dp(), vertical: 14.dp()),
      child: Column(
        children: [
          Gap(appDimen.screenHeight * 0.15),
          AssetImageWidget(
            asset: icSuccess,
            height: 220.dp(),
            width: 250.dp(),
          ),
          Gap(50.dp()),
          Text(
            getModel().title,
            textAlign: TextAlign.center,
            style:
                textTheme.displayLarge?.copyWith(color: colorScheme.primary),
          ),
          Gap(20.dp()),
          Text(
            getModel().message,
            textAlign: TextAlign.center,
            style: textTheme.bodySmall?.copyWith(color: colorScheme.primary),
          ),
          Gap(70.dp()),
          ButtonWidget.withOutLine(
            text: "DONE",
            onTap: onTap ??
                () {
                  navUtils.fireTargetHome();
                },
          ),
          Gap(20.dp()),
        ],
      ),
    );
  }
}
