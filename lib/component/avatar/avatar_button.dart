import 'package:flutter/material.dart';
import 'package:test_things/component/avatar/avatar.dart';
import 'package:test_things/core/styles/custom_colors.dart';

class AvatarButton extends StatelessWidget {
  const AvatarButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.direction = Axis.horizontal,
    this.space = 8,
    this.imagePath,
    this.buildIcon,
  }) : super(key: key);
  final String text;
  final String? imagePath;
  final VoidCallback onTap;
  final Axis direction;
  final double space;
  final Widget Function()? buildIcon;

  @override
  Widget build(BuildContext context) {
    final icon = buildIcon?.call() ??
        const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: CustomColorsHelper.white,
        );
    return GestureDetector(
      onTap: onTap,
      child: Flex(
        direction: direction,
        children: [
          Avatar(
            text: text,
            imagePath: imagePath,
          ),
          SizedBox(height: space, width: space),
          icon,
        ],
      ),
    );
  }
}
