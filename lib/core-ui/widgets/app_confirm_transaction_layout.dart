import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/res/asset_path.dart';

class AppConfirmTransactionLayout extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? cancelAsset;
  final Color? cancelAssetColor;
  final Color? cancelBackgroundColor;
  final String buttonTitle;
  final GestureTapCallback? onTap;
  final Widget? child;
  final bool displayCancelButton;
  final double? bottomPadding;
  final Widget? cancelWidget;
  final Widget? preWidget;
  final TextStyle? titleStyle;
  final TextAlign? titleTextAlignment;
  final TextAlign? subTitleTextAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextStyle? subTitleStyle;
  final TextStyle? buttonStyle;

  const AppConfirmTransactionLayout({
    super.key,
    this.title = '',
    this.subTitle = '',
    this.buttonTitle = 'Proceed',
    this.onTap,
    this.child,
    this.titleStyle,
    this.subTitleStyle,
    this.buttonStyle,
    this.displayCancelButton = true,
    this.crossAxisAlignment,
    this.cancelAsset,
    this.cancelAssetColor,
    this.cancelBackgroundColor,
    this.cancelWidget,
    this.titleTextAlignment,
    this.subTitleTextAlignment,
    this.preWidget,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        SizedBox(height: 2.dp()),
        DividerWidget(width: 70.dp(), height: 1.dp()),
        Padding(
          padding: EdgeInsets.only(right: 20.dp()),
          child: Align(
            alignment: Alignment.centerRight,
            child: displayCancelButton
                ? (cancelWidget ??
                      ContainerWidget.withCircular(
                        onTap: () => _close(context),
                        color: cancelBackgroundColor ?? colorScheme.primary,
                        radius: 30.dp(),
                        padding: EdgeInsets.all(4.dp()),
                        child: Center(
                          child: AssetImageWidget(
                            asset: cancelAsset ?? icCancel,
                            assetColor: cancelAssetColor,
                          ),
                        ),
                      ))
                : const SizedBox.shrink(),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 20.dp(),
              vertical: 24.dp(),
            ),
            child: Column(
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.center,
              children: [
                preWidget ?? const SizedBox.shrink(),
                Text(
                  title,
                  style: titleStyle ?? textTheme.displayMedium,
                  textAlign: titleTextAlignment ?? TextAlign.center,
                ),
                if (subTitle.isNotEmpty) Gap(10.dp()),
                if (subTitle.isNotEmpty)
                  Text(
                    subTitle,
                    style: subTitleStyle ?? textTheme.labelMedium,
                    textAlign: subTitleTextAlignment ?? TextAlign.center,
                  ),
                Gap(20.dp()),
                child ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        if (onTap != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.dp()),
            child: ButtonWidget(
              text: buttonTitle,
              style: buttonStyle,
              onTap: () {
                _close(context);
                onTap?.call();
              },
              height: 45.dp(),
            ),
          ),
        Gap(bottomPadding ?? 40.dp()),
      ],
    );
  }

  void _close(BuildContext context) {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
      return;
    }

    final rootNavigator = Navigator.of(context, rootNavigator: true);
    if (rootNavigator.canPop()) {
      rootNavigator.pop();
    }
  }
}
