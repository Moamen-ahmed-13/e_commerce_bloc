// import 'package:flutter/material.dart';

// Color hexToColor(String hexCode) {
//   if (hexCode.isEmpty) return Colors.black;
//   hexCode = hexCode.replaceAll('#', '');
//   if (hexCode.length == 6) return Color(int.parse('FF$hexCode', radix: 16));
//   if (hexCode.length == 8) return Color(int.parse(hexCode, radix: 16));
//   return Colors.black;
// }
import 'package:flutter/material.dart';

Color hexToColor(String colorString) {
  // تنظيف القيمة من الفراغات والحروف الكبيرة
  colorString = colorString.trim().toUpperCase().replaceAll('#', '');

  // دعم الألوان المعروفة بالاسم
  final namedColors = <String, Color>{
    'BLUE': Colors.blue,
    'ORANGE': Colors.orange,
    'WHITE': Colors.white,
  };



  if (namedColors.containsKey(colorString)) {
    return namedColors[colorString]!;
  }

  // دعم الألوان بصيغة HEX
  if (colorString.length == 6) {
    colorString = 'FF$colorString'; // إضافة الشفافية
  }

  try {
    return Color(int.parse('0x$colorString'));
  } catch (e) {
    return Colors.grey; // fallback في حالة وجود خطأ
  }
}

  const Map<String, String> hexColorNames = {
  'EC6D26': 'Orange',
  'FF0000': 'Red',
  '008000': 'Green',
  '4468E5': 'Blue',
  'FFFF00': 'Yellow',
  '800080': 'Purple',
  '000000': 'Black',
  'FFFFFF': 'White',
  // Add more as needed
};
String getColorNameFromHex(String hex) {
  final cleanedHex = hex.replaceAll('#', '').toUpperCase();
  return hexColorNames[cleanedHex] ?? cleanedHex; // fallback to hex if name not found
}
