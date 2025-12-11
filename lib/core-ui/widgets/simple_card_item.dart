import 'package:flutter/material.dart';
import 'package:core_module/core_module.dart';

import '../../core/res/asset_path.dart';

class SimpleCardItem<T> extends StatelessWidget {
  final String title;
  final String? prefixAsset;
  final String? suffixAsset;
  final String? buttonText;
  final double? prefixAssetHeight;
  final double? prefixAssetWidth;
  final double? suffixAssetHeight;
  final double? suffixAssetWidth;
  final bool hasButton;
  final double? elevation;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final T? model;
  final Function(T)? onTap;

  const SimpleCardItem({
    super.key,
    this.title = "",
    this.prefixAsset,
    this.suffixAsset,
    this.model,
    this.onTap,
    this.elevation,
    this.suffixWidget,
    this.prefixWidget,
    this.prefixAssetHeight,
    this.prefixAssetWidth,
  }) : hasButton = false,
       buttonText = null,
       suffixAssetHeight = null,
       suffixAssetWidth = null;

  const SimpleCardItem.withButton({
    super.key,
    this.title = "",
    this.prefixAsset,
    this.suffixAsset,
    this.model,
    this.elevation,
    this.onTap,
    this.prefixAssetHeight,
    this.prefixAssetWidth,
    this.buttonText,
  }) : hasButton = true,
       suffixWidget = null,
       prefixWidget = null,
       suffixAssetHeight = null,
       suffixAssetWidth = null;

  @override
  Widget build(BuildContext context) {
    return hasButton ? _hasButtonWidget(context) : _simpleCard(context);
  }

  Widget _hasButtonWidget(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return CardContainerWidget(
      padding: EdgeInsets.all(5.dp()),
      elevation: elevation ?? 5,
      color: colorScheme.surfaceContainerHigh,
      margin: EdgeInsets.only(
        top: 7.dp(),
        right: 5.dp(),
        left: 5.dp(),
        bottom: 5.dp(),
      ),
      child: Column(
        children: [
          AssetImageWidget(
            asset: prefixAsset ?? icCoreMinistry,
            height: prefixAssetHeight ?? 60.dp(),
            width: prefixAssetWidth ?? 100.dp(),
            assetColor: colorScheme.primary,
          ),
          Gap(10.dp()),
          SizedBox(
            height: 60.dp(),
            child: RichText(
              maxLines: 3,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                children: [TextSpan(text: title, style: textTheme.labelMedium)],
              ),
            ),
          ),
          Gap(10.dp()),
          ButtonWidget(
            onTap: () {
              if (onTap != null) onTap!(model as T);
            },
            textColor: colorScheme.surface,
            height: 35.dp(),
            text: buttonText ?? 'Donate',
          ),
        ],
      ),
    );
  }

  Widget _simpleCard(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {
        if (onTap != null) onTap!(model as T);
      },
      child: CardContainerWidget(
        elevation: elevation ?? 5.0,
        color: colorScheme.surfaceContainerHigh,
        padding: EdgeInsets.symmetric(horizontal: 10.dp(), vertical: 20.dp()),
        margin: EdgeInsets.symmetric(horizontal: 10.dp(), vertical: 5.dp()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            prefixWidget ??
                AssetImageWidget(
                  asset: prefixAsset ?? icCoreMinistry,
                  height: prefixAssetHeight ?? 40.dp(),
                  width: prefixAssetWidth ?? 40.dp(),
                  assetColor: colorScheme.primary,
                ),
            Gap(10.dp()),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Gap(10.dp()),
            suffixWidget ??
                AssetImageWidget(
                  asset: suffixAsset ?? icPlay,
                  height: suffixAssetHeight ?? 30.dp(),
                  width: suffixAssetWidth ?? 30.dp(),
                  assetColor: colorScheme.primary,
                ),
          ],
        ),
      ),
    );
  }
}
