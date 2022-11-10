import 'package:flutter/material.dart';
import 'package:test_things/core/styles/custom_colors.dart';
import 'package:test_things/core/styles/fonts.dart';

/// global theme of app.

final appTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: convertToMaterialColor(CustomColorsHelper.primaryBlue),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: CustomColorsHelper.primaryBlue,
    linearMinHeight: 4.0,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: CustomColorsHelper.white,
      fixedSize: const Size(128, kMinInteractiveDimension),
      textStyle: TextStyles.titleBold14pts.apply(
        color: CustomColorsHelper.darkGray2,
      ),
      side: const BorderSide(width: 1, color: CustomColorsHelper.darkGray2),
      primary: CustomColorsHelper.darkGray2,
      onSurface: CustomColorsHelper.darkGray2,
      elevation: 0,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: CustomColorsHelper.primaryBlue,
      fixedSize: const Size(128, kMinInteractiveDimension),
      textStyle: TextStyles.titleBold14pts.apply(
        color: CustomColorsHelper.white,
      ),
      elevation: 0,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: TextStyles.titleRegular14pts,
      elevation: 0,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: CustomColorsHelper.lightGray2,
    alignLabelWithHint: true,
    hintStyle: TextStyles.titleRegular14pts.apply(
      color: CustomColorsHelper.darkGray1,
    ),
    border: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: CustomColorsHelper.darkGray2,
      ),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: CustomColorsHelper.darkGray2,
      ),
    ),
    disabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: CustomColorsHelper.lightGray2,
      ),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: CustomColorsHelper.deepRose,
      ),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: CustomColorsHelper.primaryBlue,
        width: 1.25,
      ),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: CustomColorsHelper.darkGray2,
  ),
);

MaterialColor convertToMaterialColor(Color color) {
  final swatch = <int, Color>{
    50: color.withOpacity(.1),
    100: color.withOpacity(.2),
    200: color.withOpacity(.3),
    300: color.withOpacity(.4),
    400: color.withOpacity(.5),
    500: color.withOpacity(.6),
    600: color.withOpacity(.7),
    700: color.withOpacity(.8),
    800: color.withOpacity(.9),
    900: color.withOpacity(1),
  };
  return MaterialColor(color.value, swatch);
}
