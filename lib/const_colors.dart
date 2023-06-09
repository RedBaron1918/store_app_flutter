import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class ColorConstants {
  static Color cardColor = hexToColor('#F2F2FC');
  static Color backgroundColor = Colors.white;
  static Color titleColor = hexToColor('#23395d');
  static Color test = hexToColor('#131410');
  static Color betterRed = const Color.fromARGB(255, 255, 96, 96);
}
