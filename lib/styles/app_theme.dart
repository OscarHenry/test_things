import 'package:flutter/material.dart';
import 'package:test_things/styles/custom_colors.dart';

/// global theme of app.

Color getColorFromMaterialState(Set<MaterialState> states) {
  Color result = Colors.black;
  states.forEach((state) {
    switch (state) {
      case MaterialState.hovered:
        // result = Colors.black;
        break;
      case MaterialState.focused:
        // result = Colors.black;
        break;
      case MaterialState.pressed:
        // result = Colors.black;
        break;
      case MaterialState.dragged:
        // result = Colors.white;
        break;
      case MaterialState.selected:
        // result = Colors.white;
        break;
      case MaterialState.scrolledUnder:
        // result = Colors.white;
        break;
      case MaterialState.disabled:
        result = Colors.grey;
        break;
      case MaterialState.error:
        // result = Colors.red;
        break;
    }
  });
  return result;
}

BorderSide getBorderSideFromMaterialState(Set<MaterialState> states) {
  BorderSide result = const BorderSide(width: 1, color: Colors.black);
  states.forEach((state) {
    switch (state) {
      case MaterialState.hovered:
        // result = Colors.black;
        break;
      case MaterialState.focused:
        // result = Colors.black;
        break;
      case MaterialState.pressed:
        // result = Colors.black;
        break;
      case MaterialState.dragged:
        // result = Colors.white;
        break;
      case MaterialState.selected:
        // result = Colors.white;
        break;
      case MaterialState.scrolledUnder:
        // result = Colors.white;
        break;
      case MaterialState.disabled:
        result = const BorderSide(width: 1, color: Colors.grey);
        break;
      case MaterialState.error:
        // result = Colors.red;
        break;
    }
  });
  return result;
}

final appTheme = ThemeData.light().copyWith(
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: CustomColorsHelper.darkBlue,
    linearMinHeight: 4.0,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor:
          MaterialStateColor.resolveWith(getColorFromMaterialState),
      backgroundColor: MaterialStateProperty.all(Colors.white),
      side: MaterialStateBorderSide.resolveWith(getBorderSideFromMaterialState),
      fixedSize: MaterialStateProperty.all(Size(128, kMinInteractiveDimension)),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: CustomColorsHelper.darkBlue,
      fixedSize: const Size(128, kMinInteractiveDimension),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.blueGrey.shade50,
    alignLabelWithHint: true,
    contentPadding: const EdgeInsets.all(8.0),
    constraints:
        const BoxConstraints.tightFor(height: kMinInteractiveDimension),
    border: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
    ),
    disabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black38,
      ),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
    ),
  ),
);
