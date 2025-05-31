import 'dart:convert';
import 'package:e_commerce_bloc/domain/products/entity/color_entity.dart';

class ColorModel {
  final String title;
  final String hexCode;

  ColorModel({
    required this.title,
    required this.hexCode,
  });

  // ✅ Safe fromMap
  factory ColorModel.fromMap(Map<String, dynamic> map) {
    return ColorModel(
      title: (map['title'] ?? 'Unknown Color').toString(),
      hexCode: (map['hexCode'] ?? '000000').toString(), // fallback to black hex
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'hexCode': hexCode,
    };
  }

  String toJson() => json.encode(toMap());

  factory ColorModel.fromJson(String source) =>
      ColorModel.fromMap(json.decode(source));

  // Extension methods to convert between Model and Entity
  ColorEntity toEntity() {
    return ColorEntity(
      title: title,
      hexCode: hexCode,
    );
  }

  factory ColorModel.fromEntity(ColorEntity entity) {
    return ColorModel(
      title: entity.title,
      hexCode: entity.hexCode,
    );
  }
}

extension ProductColorXModel on ColorModel {
  ColorEntity toEntity() {
    return ColorEntity(
      title: title,
      hexCode: hexCode,
    );
  }
}

extension ProductColorXEntity on ColorEntity {
  ColorModel fromEntity() {
    return ColorModel(
      title: title,
      hexCode: hexCode,
    );
  }
}
