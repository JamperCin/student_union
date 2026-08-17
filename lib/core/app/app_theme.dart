import 'package:core_module/core/extensions/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/app/app_style.dart';

import 'app_colors.dart';

const String _fontFamily = "KumbhSans"; //"SfUI"; //"Gotham";

DatePickerThemeData _buildDatePickerTheme({required bool isDark}) {
  final normalDayTextColor = isDark ? whiteColor : darkColor;
  final disabledDayTextColor = isDark
      ? whiteColor.withValues(alpha: 0.45)
      : darkColor.withValues(alpha: 0.45);
  final dialogBg = isDark ? darkBrownColor : whiteColor;

  return DatePickerThemeData(
    backgroundColor: dialogBg,
    surfaceTintColor: Colors.transparent,
    headerBackgroundColor: dialogBg,
    headerForegroundColor: normalDayTextColor,
    weekdayStyle: bodyMediumTextLightModeStyle.copyWith(
      color: normalDayTextColor.withValues(alpha: 0.85),
    ),
    dayForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) return disabledDayTextColor;
      if (states.contains(WidgetState.selected)) return whiteColor;
      return normalDayTextColor;
    }),
    dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return primaryGreenColor;
      return Colors.transparent;
    }),
    todayForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return whiteColor;
      return primaryGreenColor;
    }),
    todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return primaryGreenColor;
      return Colors.transparent;
    }),
    todayBorder: BorderSide(color: primaryGreenColor, width: 1.5),
    cancelButtonStyle: TextButton.styleFrom(foregroundColor: primaryGreenColor),
    confirmButtonStyle: TextButton.styleFrom(
      foregroundColor: primaryGreenColor,
    ),
  );
}

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.green,
  fontFamily: _fontFamily,
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
      maximumSize: Size.fromHeight(50.dp()),
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
    surfaceContainerHigh: whiteColor,

    ///Inverse surface
    inverseSurface: darkColor,

    ///Green color
    outline: greenPrimaryColor,
    shadow: greyTertiaryLightColor,
    outlineVariant: darkBrownColor,
    surfaceDim: dividerColor,
  ),
  datePickerTheme: _buildDatePickerTheme(isDark: false),
  dialogTheme: DialogThemeData(backgroundColor: whiteColor),
  appBarTheme: AppBarTheme(
    backgroundColor: primaryGreenColor,
    titleTextStyle: bodyMediumTextLightModeStyle.copyWith(
      fontSize: 20.dp(),
      fontWeight: FontWeight.w700,
      color: whiteColor,
    ),
    iconTheme: IconThemeData(color: whiteColor),
  ),
);

ThemeData darkMode = lightMode.copyWith(
  brightness: Brightness.dark,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: whiteColor,
    inversePrimary: greenFaded,
    onPrimary: secondaryGreenColor, //Calendar picker selected day text color
    secondary: secondary,
    onSecondary: darkBrownColor,
    inverseSurface: whiteColor,
    error: redColor,
    onError: redColor,
    surface: darkColor,
    surfaceDim: greyPrimaryColor,
    onSurface: greyPodInactiveColor, //Calendar picker General text color
    tertiary: whiteColor,
    surfaceBright: greyPodActiveColor,
    surfaceContainerHighest: darkBrownColor,
    surfaceContainerHigh: darkBrownColor,
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
      maximumSize: Size.fromHeight(50.dp()),
      disabledForegroundColor: disabledGreenColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(10),
          right: Radius.circular(10),
        ),
      ),
    ),
  ),
  datePickerTheme: _buildDatePickerTheme(isDark: true),
  dialogTheme: DialogThemeData(backgroundColor: darkColor),
  appBarTheme: AppBarTheme(
    backgroundColor: darkColor,
    titleTextStyle: bodyMediumTextLightModeStyle.copyWith(
      fontSize: 20.dp(),
      fontWeight: FontWeight.w700,
      color: whiteColor,
    ),
    iconTheme: IconThemeData(color: whiteColor),
  ),
);

// ThemeData(
//   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue).copyWith(
//     primary: Colors.green,          // Selected date
//     onPrimary: Colors.white,        // Selected date text
//     surface: Colors.grey[200],      // Calendar background
//     onSurface: Colors.black,        // Default date text
//   ),
// )
