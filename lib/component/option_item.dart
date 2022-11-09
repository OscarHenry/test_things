import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_things/core/styles/app_animations.dart';
import 'package:test_things/core/styles/app_dimensions.dart';

class OptionItem extends HookWidget {
  const OptionItem({
    Key? key,
    required this.title,
    required this.scale,
    this.onPressed,
    required this.iconData,
    required this.amount,
    required this.minHeight,
    required this.maxHeight,
    required this.minWidth,
    required this.maxWidth,
  }) : super(key: key);
  final String title;
  final IconData iconData;
  final int amount;
  final double minHeight;
  final double maxHeight;
  final double minWidth;
  final double maxWidth;
  final double scale;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(initialValue: scale, duration: defAnimDuration)
          ..value = scale;
    final animationH = Tween(begin: minHeight, end: maxHeight).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.8, 1),
      ),
    );
    final animationW = Tween(begin: minWidth, end: maxWidth).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.80, 0.85),
      ),
    );
    return AnimatedBuilder(
      animation: controller.view,
      builder: (context, child) {
        print('controller: ${controller.value}');
        print('animationH: ${animationH.value}');
        print('animationW: ${animationW.value}');
        return InkWell(
          onTap: onPressed,
          enableFeedback: true,
          child: Container(
            height: animationH.value,
            width: animationW.value,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Icon(iconData)),
                horizontalSpace,
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: FittedBox(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '$amount',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Visibility(
                          visible: animationH.value != minHeight,
                          child: FittedBox(
                            clipBehavior: Clip.hardEdge,
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.fitHeight,
                            child: Text(title),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
