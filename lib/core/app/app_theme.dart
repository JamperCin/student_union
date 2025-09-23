import 'package:flutter/material.dart';
import 'package:student_union/core/app/app_style.dart';

import 'app_colors.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.green,
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
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,

    ///primary colors and inverted color
    primary: primaryGreenColor,
    inversePrimary: greenFaded,
    //
    onPrimary: secondaryGreenColor,
    primaryContainer: orangeQuadColor,
    primaryFixedDim: primaryGreenColorDeep,
    primaryFixed: orangeFadeColor,
    onPrimaryContainer: disabledGreenColor,

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
    onSurface: darkColor,
    surfaceBright: greyTertiaryColor,
    surfaceContainerHighest: greyTertiaryColor,
    surfaceContainerLow: dividerColor,

    ///Inverse surface
    inverseSurface: darkColor,

    ///Green color
    outline: greenPrimaryColor,
    shadow: greyTertiaryLightColor,
    outlineVariant: darkBrownColor,
    surfaceDim: dividerColor,
  ),
  datePickerTheme: DatePickerThemeData(
   // backgroundColor: Colors.red,
    todayBackgroundColor: WidgetStateProperty.all(Colors.white),
    dayBackgroundColor: WidgetStateProperty.all(primaryGreenColor),
    // dayShape: WidgetStateProperty.all(
    //   RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(12),side: BorderSide(color: Colors.red)
    //   ),
    // ),
    // weekdayStyle: bodyMediumTextLightModeStyle,
    // headerBackgroundColor: primaryGreenColor,
    // headerForegroundColor: Colors.black,
    // headerHeadlineStyle: bodyLargeTextLightModeStyle,
    // dayStyle: bodyMediumTextLightModeStyle,
    // todayForegroundColor: WidgetStateProperty.all(secondary),
    // yearForegroundColor: WidgetStateProperty.resolveWith<Color>((states) {
    //   if (states.contains(WidgetState.disabled)) {
    //     return Colors.grey; // Faint for disabled days
    //   }
    //   return Colors.black; // Normal active days
    // }),
    // dayForegroundColor: WidgetStateProperty.resolveWith<Color>((states) {
    //   if (states.contains(WidgetState.disabled)) {
    //     return Colors.grey; // Faint for disabled days
    //   }
    //   return Colors.black; // Normal active days
    // }),
  ),
  dialogTheme: DialogThemeData(backgroundColor: whiteColor),
);

ThemeData darkMode = lightMode.copyWith(
  brightness: Brightness.dark,
  dialogBackgroundColor: darkColor,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: whiteColor,
    inversePrimary: greenFaded,
    onPrimary: secondaryGreenColor,
    secondary: secondary,
    onSecondary: darkBrownColor,
    inverseSurface: whiteColor,
    error: redColor,
    onError: redColor,
    surface: darkColor,
    surfaceDim: greyPrimaryColor,
    onSurface: darkBrownColor,
    tertiary: whiteColor,

    surfaceBright: greyPodActiveColor,
    surfaceContainerHighest: darkBrownColor,
    surfaceContainerLow: dividerColor,
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
