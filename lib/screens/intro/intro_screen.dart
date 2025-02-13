import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/intro_model.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
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

              return Column(
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
                      height: appDimen.screenHeight * 0.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: appDimen.dimen(20)),
                  Padding(
                    padding: EdgeInsets.only(
                      left: appDimen.dimen(10),
                      right: appDimen.dimen(10),
                    ),
                    child: Center(
                      child: Text(
                        model.mainText,
                        textAlign: TextAlign.center,
                        style: textTheme.displayLarge
                            ?.copyWith(color: colorScheme.primary),
                      ),
                    ),
                  ),
                  SizedBox(height: appDimen.dimen(20)),
                  Padding(
                    padding: EdgeInsets.only(
                      left: appDimen.dimen(10),
                      right: appDimen.dimen(10),
                    ),
                    child: Center(
                      child: Text(
                        model.subText,
                        style: textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: appDimen.dimen(8)),
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
                    iconSize: 20,
                    icon: Icons.arrow_back_ios,
                    iconColor: _introController.pageIndex.value != 0
                        ? colorScheme.primary
                        : colorScheme.shadow,
                    borderColor: Colors.transparent,
                    iconPadding: 2,
                    onTap: () {
                      if (_introController.pageIndex.value != 0) {
                        _introController.onGoToPrevious(_pageController);
                      }
                    },
                  ),
                  SizedBox(width: appDimen.dimen(10)),
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
                    iconSize: 20,
                    iconPadding: 2,
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
        SizedBox(height: appDimen.dimen(20)),
      ],
    );
  }

  Widget _pageBody(IntroModel model) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: ContainerWidget(
            height: appDimen.screenHeight * 0.8,
            width: appDimen.screenWidth,
            color: model.color,
            padding: EdgeInsets.only(
              top: appDimen.dimen(24),
              bottom: appDimen.dimen(30),
              right: appDimen.dimen(16),
              left: appDimen.dimen(16),
            ),
          ),
        ),
        AssetImageWidget(
          asset: model.assetName,
          height: appDimen.screenHeight * 0.5,
          width: appDimen.screenWidth,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _notchIntroBody() {
    return Obx(
      () => Scaffold(
        backgroundColor:
            _introController.introData[_introController.pageIndex.value].color,
        body: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: _introController.introData.length,
              onPageChanged: _introController.onPageChanged,
              scrollBehavior: const ScrollBehavior(),
              itemBuilder: (context, index) {
                return _pageBody(_introController.introData[index]);
              },
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SizedBox(
                height: appDimen.screenHeight * 0.52,
                width: appDimen.screenWidth,
                child: Obx(
                  () => SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _introController
                              .introData[_introController.pageIndex.value]
                              .mainText,
                          textAlign: TextAlign.center,
                          style: textTheme.displayLarge,
                        ),
                        SizedBox(height: appDimen.dimen(15)),
                        Text(
                          _introController
                              .introData[_introController.pageIndex.value]
                              .subText,
                          style: textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: appDimen.dimen(15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_introController.pageIndex.value != 0)
                              IconButtonWidget.withCircularBorder(
                                iconSize: 20,
                                icon: Icons.arrow_back_ios,
                                iconColor: colorScheme.primary,
                                borderColor: Colors.transparent,
                                iconPadding: 2,
                                onTap: () {
                                  _introController
                                      .onGoToPrevious(_pageController);
                                },
                              ),
                            if (_introController.pageIndex.value != 0)
                              SizedBox(width: appDimen.dimen(10)),
                            FittedBox(
                                child: PodWidget(
                              podLength: _introController.introData.length,
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
                              iconSize: 20,
                              iconPadding: 2,
                              iconColor: colorScheme.primary,
                              borderColor: Colors.transparent,
                              onTap: () {
                                _introController.onGoToNext(_pageController);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: appDimen.dimen(15)),
                        TextButtonWidget(
                          text: "Skip Now",
                          onTap: _introController.onSkipOnClick,
                        ),
                        SizedBox(height: appDimen.dimen(10)),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
