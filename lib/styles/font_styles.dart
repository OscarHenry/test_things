import 'dart:ui';
import 'package:flutter/material.dart';

class FontStylesHelper {
  static TextStyle cardTitleTextStyle({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 22,
    );
  }

  static TextStyle labelTextStyle = TextStyle(
    fontSize: 11,
  );

  static TextStyle valueTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 15,
  );

  static TextStyle cardButtonTextStyle({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 12,
    );
  }

  static TextStyle emptyScreenTextStyle = TextStyle(
    fontSize: 24,
  );

  static TextStyle tabTitleTextStyle = TextStyle(
    fontSize: 10,
  );

  //---------------------//
  // Device Card Section //
  //---------------------//
  static TextStyle deviceNumberLabel = TextStyle(
    color: Color(0xff666666),
  );

  static TextStyle deviceTrackerLabel({Color color = Colors.white}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
  }

  static TextStyle deviceVehicleInfoLabel = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w500,
  );

  static TextStyle deviceVinLabel = TextStyle(
    fontSize: 16,
  );

  static TextStyle deviceMainActionButton = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );

  static TextStyle deviceSecondaryActionButton = TextStyle(
    fontSize: 16,
  );
}
