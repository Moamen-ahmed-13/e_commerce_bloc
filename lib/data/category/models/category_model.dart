import 'dart:convert';

import 'package:e_commerce_bloc/domain/category/entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  final String id;
  final String name;
  final String image;

  CategoryModel({required this.id, required this.name, required this.image}) : super(id: id, name: name, image: image);

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      image: map['image']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(id: id, name: name, image: image);
  }
}
