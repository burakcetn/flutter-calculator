import 'package:flutter/material.dart';


class ColorManager {
  static Color backgroundColor = HexColor.fromHex("#1E1E1E");
  static Color darkButtonColor = HexColor.fromHex("#622388");
  static Color lightButtonColor = HexColor.fromHex("#9761B9");

}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}