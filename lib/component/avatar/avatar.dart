import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_things/core/styles/app_animations.dart';
import 'package:test_things/core/styles/custom_colors.dart';
import 'package:test_things/core/styles/fonts.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    this.text = '',
    this.radio = 20,
    this.thickness = 2,
    this.imagePath,
    this.backgroundColor = CustomColorsHelper.mediumGray1,
    this.borderColor = CustomColorsHelper.white,
  }) : super(key: key);
  final String text;
  final String? imagePath;
  final double radio;
  final int thickness;
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: borderColor,
      radius: radio + thickness,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        backgroundImage: buildBackgroundImage(),
        radius: radio,
        child: AnimatedSwitcher(
          duration: defAnimDuration,
          child: imagePath == null
              ? Text(
                  text,
                  style: TextStyles.bodyReg16pts.apply(
                    color: CustomColorsHelper.black,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  ImageProvider<Object>? buildBackgroundImage() {
    if (imagePath == null) return null;

    final _imageUri = Uri.parse(imagePath!);

    final hasNetwork =
        _imageUri.isScheme('HTTP') || _imageUri.isScheme('HTTPS');
    if (hasNetwork) {
      return NetworkImage(_imageUri.toString());
    }

    final _imageFile = File.fromUri(_imageUri);
    if (_imageFile.existsSync()) {
      return FileImage(_imageFile);
    }

    return AssetImage(_imageUri.toString());
  }
}
