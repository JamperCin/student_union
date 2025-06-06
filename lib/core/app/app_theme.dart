import 'package:flutter/material.dart';
import 'package:student_union/core/app/app_style.dart';

import 'app_colors.dart';

ThemeData lightMode = ThemeData(
  dialogBackgroundColor: whiteColor,
  brightness: Brightness.light,
  textTheme: TextTheme(
    labelSmall: labelSmallTextLightModeStyle,
    labelMedium: labelMediumTextLightModeStyle,
    labelLarge: labelLargeTextLightModeStyle,
    //
    bodySmall: bodySmallTextLightModeStyle,
    bodyLarge: bodyLargeTextLightModeStyle,
    bodyMedium: bodyMediumTextLightModeStyle,

    displayLarge: displayLargeTextLightModeStyle,
    displayMedium: displayMediumTextLightModeStyle,
    displaySmall: displaySmallTextLightModeStyle,
    //
    headlineLarge: headingLargeTextLightModeStyle,
    headlineMedium: headingMediumTextLightModeStyle,
    headlineSmall: headingSmallTextLightModeStyle,
    //
    titleLarge: titleLargeTextLightModeStyle,
    titleMedium: titleMediumTextLightModeStyle,
    titleSmall: titleSmallTextLightModeStyle,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 5.0,
      backgroundColor: primaryGreenColor,
      textStyle: normalButtonLightModeStyle,
      disabledForegroundColor: disabledGreenColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(10),
          right: Radius.circular(10),
        ),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 5.0,
      backgroundColor: primaryGreenColor,
      textStyle: normalButtonLightModeStyle,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(18),
          right: Radius.circular(18),
        ),
      ),
    ),
  ),
  colorScheme: ColorScheme(
    brightness: Brightness.light,

    ///primary colors and inverted color
    primary: primaryGreenColor,
    inversePrimary: greenFaded,
    //
    onPrimary: secondaryGreenColor,
    primaryContainer: orangeQuadColor,
    primaryFixedDim: primaryGreenColorDeep,
    primaryFixed: orangeFadeColor,

    ///Secondary colors
    secondary: secondary,
    onSecondary: greySecondaryColor,
    secondaryContainer: greyTertiaryColor,

    ///Tertiary colors
    tertiary: whiteColor,
    tertiaryContainer: greyPrimaryColor,

    ///Error
    error: redColor,
    onError: redColor,

    ///Surface
    surface: whiteColor,
    onSurface: greySecondaryColor,
    surfaceBright: darkBrownColor,

    ///Inverse surface
    inverseSurface: darkColor,

    ///Green color
    outline: greenPrimaryColor,
    shadow: greyTertiaryLightColor,
    outlineVariant: darkBrownColor,
    surfaceDim: dividerColor,
  ),
);

ThemeData darkMode = lightMode.copyWith(
  brightness: Brightness.dark,
  dialogBackgroundColor: darkColor,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: primaryGreenColor,
    onPrimary: secondaryGreenColor,
    secondary: secondary,
    onSecondary: secondary,
    inverseSurface: whiteColor,
    error: redColor,
    onError: redColor,
    surface: darkColor,
    onSurface: darkBrownColor,
    tertiary: darkColor,
  ),
  textTheme: TextTheme(
    labelSmall: labelSmallTextLightModeStyle.copyWith(color: whiteColor),
    labelMedium: labelMediumTextLightModeStyle.copyWith(color: whiteColor),
    labelLarge: labelLargeTextLightModeStyle.copyWith(color: whiteColor),
    //
    bodySmall: bodySmallTextLightModeStyle.copyWith(color: whiteColor),
    bodyLarge: bodyLargeTextLightModeStyle.copyWith(color: whiteColor),
    bodyMedium: bodyMediumTextLightModeStyle.copyWith(color: whiteColor),

    displayLarge: displayLargeTextLightModeStyle.copyWith(color: whiteColor),
    displayMedium: displayMediumTextLightModeStyle.copyWith(color: whiteColor),
    displaySmall: displaySmallTextLightModeStyle.copyWith(color: whiteColor),
    //
    headlineLarge: headingLargeTextLightModeStyle.copyWith(color: whiteColor),
    headlineMedium: headingMediumTextLightModeStyle.copyWith(color: whiteColor),
    headlineSmall: headingSmallTextLightModeStyle.copyWith(color: whiteColor),
    //
    titleLarge: titleLargeTextLightModeStyle.copyWith(color: whiteColor),
    titleMedium: titleMediumTextLightModeStyle.copyWith(color: whiteColor),
    titleSmall: titleSmallTextLightModeStyle.copyWith(color: whiteColor),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 5.0,
      backgroundColor: whiteColor,
      textStyle: normalButtonLightModeStyle,
      disabledForegroundColor: disabledGreenColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(10),
          right: Radius.circular(10),
        ),
      ),
    ),
  ),
);
