import 'package:flutter/material.dart';

Color hexToColor(String hexCode) {
  if (hexCode.isEmpty) return Colors.black;
  hexCode = hexCode.replaceAll('#', '');
  if (hexCode.length == 6) return Color(int.parse('FF$hexCode', radix: 16));
  if (hexCode.length == 8) return Color(int.parse(hexCode, radix: 16));
  return Colors.black;
}
