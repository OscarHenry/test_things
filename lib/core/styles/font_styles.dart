import 'package:flutter/material.dart';
import 'package:test_things/core/styles/custom_colors.dart';

class FontStylesHelper {
  static TextStyle cardTitleTextStyle({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 22,
    );
  }

  static TextStyle labelTextStyle = const TextStyle(
    color: CustomColorsHelper.grey,
    fontSize: 11,
  );

  static TextStyle valueTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 15,
  );

  static TextStyle cardButtonTextStyle({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 12,
    );
  }

  static TextStyle emptyScreenTextStyle = const TextStyle(
    color: CustomColorsHelper.darkGrey,
    fontSize: 24,
  );

  static TextStyle tabTitleTextStyle = const TextStyle(
    fontSize: 10,
  );

  //---------------------//
  // Device Card Section //
  //---------------------//
  static TextStyle deviceNumberLabel = const TextStyle(
    color: Color(0xff666666),
  );

  static TextStyle deviceTrackerLabel({Color color = Colors.white}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
  }

  static TextStyle deviceVehicleInfoLabel = const TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w500,
  );

  static TextStyle deviceVinLabel = const TextStyle(
    fontSize: 16,
  );

  static TextStyle deviceMainActionButton = const TextStyle(
    fontSize: 16,
    color: Colors.white,
  );

  static TextStyle deviceSecondaryActionButton = const TextStyle(
    fontSize: 16,
    color: CustomColorsHelper.secondaryActionButton,
  );

  /// used on AppBar of [HistoryTabScreen]
  static TextStyle titleAppBarSelectorTextStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: CustomColorsHelper.black,
  );

  /// used on [WorkOrderDetailScreen]
  static TextStyle titleWorkOrderDetailTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  /// used on [WorkOrderDetailScreen]
  static TextStyle subtitleWorkOrderDetailTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  /// used in all input fields see: (lib/src/widgets/common/form_items)
  static TextStyle hintTextStyle = const TextStyle(
    fontSize: 16,
    color: CustomColorsHelper.darkGrey1,
  );

  /// used on [WorkOrderStatusIndicator]
  static TextStyle titleWorkOrderStatusIndicatorTextStyle = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
}
