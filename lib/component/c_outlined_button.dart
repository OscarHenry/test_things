import 'package:flutter/material.dart';

enum AlignmentIcon { left, right }

class COutLinedButton extends StatelessWidget {
  const COutLinedButton({
    Key? key,
    Color? borderColor,
    required this.onPressed,
    Color? badgeColor,
    required this.label,
    AlignmentIcon? alignment,
    required this.icon,
  })  : _borderColor = borderColor ?? Colors.greenAccent,
        _badgeColor = badgeColor ?? Colors.redAccent,
        _alignment = alignment ?? AlignmentIcon.left,
        super(key: key);
  final Color _borderColor;
  final VoidCallback onPressed;
  final Color _badgeColor;
  final AlignmentIcon _alignment;
  final Widget icon;

  /// generally btn contain text then you can change this for String
  /// as: final String label,
  final String label;
  @override
  Widget build(BuildContext context) {
    /// if button have other structure (is not usually) you can
    /// structure component here so for example

    Widget buildLabel() {
      switch (_alignment) {
        case AlignmentIcon.left:
          return icon;
        case AlignmentIcon.right:
          return Text(label);
      }
    }

    Widget buildIcon() {
      switch (_alignment) {
        case AlignmentIcon.left:
          return Text(label);
        case AlignmentIcon.right:
          return icon;
      }
    }

    return Stack(
      fit: StackFit.loose,
      children: [
        OutlinedButton.icon(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            // shape: const StadiumBorder(),
            side: BorderSide(color: _borderColor),
            primary: _borderColor,
          ),
          icon: buildIcon(),
          label: buildLabel(),
        ),
        Positioned(
          top: 2,
          right: 0,
          child: Container(
            decoration:
                BoxDecoration(color: _badgeColor, shape: BoxShape.circle),
            constraints: BoxConstraints.tight(const Size.fromRadius(6)),
          ),
        ),
      ],
    );
  }
}
