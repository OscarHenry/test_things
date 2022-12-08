import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/core/styles/app_animations.dart';
import 'package:universal_io/io.dart' show Platform;

/// Type of Device
///
/// This can be either mobile or tablet
enum DeviceType { mobile, tablet, web, mac, windows, linux, fuchsia }

/// Provides `Context`, `Orientation`, and `DeviceType` parameters to the builder function
typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  BoxConstraints constraints,
  Orientation orientation,
);

/// A widget that gets the device's details like orientation and constraints
///
/// Usage: Wrap MaterialApp with this widget
class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
  })  : _mobile = mobile,
        _tablet = tablet,
        _desktop = desktop,
        _builder = null;

  const Responsive.builder({super.key, ResponsiveBuild? builder})
      : _mobile = const SizedBox.shrink(),
        _tablet = null,
        _desktop = null,
        _builder = builder;

  /// Builds the widget whenever the orientation changes
  final ResponsiveBuild? _builder;
  final Widget _mobile;
  final Widget? _tablet;
  final Widget? _desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            ScreenUtil.from(context);
            // log(
            //     '${GoRouter.of(context).location}: ${constraints.toString()}'
            //     '\nisMobile ${ScreenUtil.isMobile}'
            //     '\nisTablet ${ScreenUtil.isTablet}',
            //     name: 'ScreenUtil');
            if (_builder != null) {
              return _builder!(context, constraints, orientation);
            } else {
              return AnimatedSwitcher(
                duration: defAnimDuration,
                child: _getLayout(),
              );
            }
          },
        );
      },
    );
  }

  _getLayout() {
    // If our width is more than 1100 then we consider it a desktop
    if (ScreenUtil.isDesktop && _desktop != null) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      return _desktop!;
    }
    // If width it less then 1100 and more then 768 we consider it as tablet
    else if (ScreenUtil.isTablet && _tablet != null) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      return _tablet!;
    }
    // Or less then that we called it mobile
    else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      return _mobile;
    }
  }
}

class ScreenUtil {
  /// Device's BoxConstraints
  static late BoxConstraints boxConstraints;

  /// Device's Orientation
  static late Orientation orientation;

  /// Type of Device
  ///
  /// This can either be mobile or tablet
  static late DeviceType deviceType;

  /// Device's Height
  static late double height;

  /// Device's Width
  static late double width;

  /// Device's shortestSide
  static late double shortestSide;

  /// Device's longestSide
  static late double longestSide;

  /// This isMobile, isTablet, isDesktop help BreakPoints
  static bool get isMobile => shortestSide < 768;

  static bool get isTablet => shortestSide < 1100 && shortestSide >= 768;

  static bool get isDesktop => shortestSide >= 1100;

  /// Sets the Screen's size and Device's Orientation,
  /// BoxConstraints, Height, and Width
  static void from(BuildContext context) {
    final mediaData = MediaQuery.of(context);

    // Sets boxconstraints and orientation
    boxConstraints = BoxConstraints(
      maxWidth: mediaData.size.width,
      maxHeight: mediaData.size.height,
    );
    orientation = mediaData.orientation;

    // Sets screen width and height
    shortestSide = mediaData.size.shortestSide;
    longestSide = mediaData.size.longestSide;
    if (orientation == Orientation.portrait) {
      width = shortestSide;
      height = longestSide;
    } else {
      width = longestSide;
      height = shortestSide;
    }

    // Sets ScreenType
    if (kIsWeb) {
      deviceType = DeviceType.web;
    } else if (Platform.isAndroid || Platform.isIOS) {
      if ((orientation == Orientation.portrait && width < 768) ||
          (orientation == Orientation.landscape && height < 768)) {
        deviceType = DeviceType.mobile;
      } else {
        deviceType = DeviceType.tablet;
      }
    } else if (Platform.isMacOS) {
      deviceType = DeviceType.mac;
    } else if (Platform.isWindows) {
      deviceType = DeviceType.windows;
    } else if (Platform.isLinux) {
      deviceType = DeviceType.linux;
    } else {
      deviceType = DeviceType.fuchsia;
    }
  }

  static String get info => boxConstraints.toString();
}

extension ScreenUtilExt on num {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double get h => this * ScreenUtil.height / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double get w => this * ScreenUtil.width / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  ///
  /// useful for TextStyle
  double get sp => this * (ScreenUtil.width / 3) / 100;
}
