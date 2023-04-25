import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({
    required this.icon,
    required this.text,
    required this.color,
    this.textColor = const Color(0xFF333333),
    this.iconSize,
    this.textSize = 22,
    super.key,
  });
  final IconData icon;
  final String text;
  final Color color;
  final Color? textColor;
  final double? iconSize;
  final double? textSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: iconSize,
        ),
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: textSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
