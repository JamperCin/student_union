import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/intro_model.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/icon_button_widget.dart';
import 'package:core_module/core_ui/widgets/pod_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_union/screens/intro/intro_controller.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';

class IntroScreen extends BaseScreenStandard {
  final _introController = IntroController();
  final _pageController = PageController();

  @override
  bool safeArea() {
    return false;
  }

  @override
  Color backgroundColor(BuildContext context) {
    return Colors.white;
  }

  @override
  Widget body(BuildContext context) {
    return _normalIntroBody();
  }

  Widget _normalIntroBody() {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: _introController.introData.length,
            onPageChanged: _introController.onPageChanged,
            scrollBehavior: const ScrollBehavior(),
            itemBuilder: (context, index) {
              IntroModel model = _introController.introData[index];

              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      child: AssetImageWidget(
                        asset: model.assetName,
                        width: appDimen.screenWidth,
                        height: appDimen.screenHeight * 0.68,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Gap(20.dp()),
                    Padding(
                      padding: EdgeInsets.only(left: 10.dp(), right: 10.dp()),
                      child: Center(
                        child: Text(
                          model.mainText,
                          textAlign: TextAlign.center,
                          style: textTheme.displayLarge
                              ?.copyWith(color: colorScheme.primary, fontSize: 30.dp(),),
                        ),
                      ),
                    ),
                    Gap(20.dp()),
                    Padding(
                      padding: EdgeInsets.only(left: 10.dp(), right: 10.dp()),
                      child: Center(
                        child: parseBoldText(model.subText, style: textTheme.bodySmall)

                        /*Text(
                          model.subText,
                          style: textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),*/
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Gap(8.dp()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButtonWidget(
              text: "",
              style: textTheme.labelMedium,
              onTap: () {},
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButtonWidget.withCircularBorder(
                    iconSize: 20.dp(),
                    icon: Icons.arrow_back_ios,
                    iconColor: _introController.pageIndex.value != 0
                        ? colorScheme.primary
                        : colorScheme.shadow,
                    borderColor: Colors.transparent,
                    iconPadding: 2.dp(),
                    onTap: () {
                      if (_introController.pageIndex.value != 0) {
                        _introController.onGoToPrevious(_pageController);
                      }
                    },
                  ),
                  Gap(10.dp()),
                  FittedBox(
                      child: PodWidget(
                    podLength: _introController.introData.length,
                    inActiveColor: colorScheme.tertiaryContainer,
                    currentIndex: _introController.pageIndex,
                    onTap: (index) {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.decelerate,
                      );
                    },
                  )),
                  SizedBox(width: appDimen.dimen(10)),
                  IconButtonWidget.withCircularBorder(
                    icon: Icons.arrow_forward_ios,
                    iconSize: 20.dp(),
                    iconPadding: 2.dp(),
                    iconColor: colorScheme.primary,
                    borderColor: Colors.transparent,
                    onTap: () {
                      _introController.onGoToNext(_pageController);
                    },
                  ),
                ],
              ),
            ),
            TextButtonWidget(
              text: "Skip",
              style: textTheme.labelMedium,
              onTap: _introController.onSkipOnClick,
            )
          ],
        ),
        Gap(20.dp()),
      ],
    );
  }



  /// Parses a string with \b...\b markers into a RichText widget
  Widget parseBoldText(String input, {TextStyle? style}) {
    final parts = input.split("**"); // split by the marker
    final spans = <TextSpan>[];

    for (var i = 0; i < parts.length; i++) {
      spans.add(
        TextSpan(
          text: parts[i],
          style: style?.copyWith(
            fontWeight: i.isOdd ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );
    }

    return Text.rich(TextSpan(children: spans),textAlign: TextAlign.center,);
  }

}
