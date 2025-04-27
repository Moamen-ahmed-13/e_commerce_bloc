import 'package:cloud_firestore/cloud_firestore.dart';
import 'color_model.dart';
import 'package:e_commerce_bloc/domain/products/entity/product_entity.dart';

class ProductModel {
  final String categoryId;
  final List<ColorModel> colors;
  final Timestamp createdDate;
  final String price;
  final String discountedPrice;
  final int gender;
  final List<String> sizes;
  final String title;
  final String productId;
  final String salesNumber;
  final String image;

  ProductModel({
    required this.categoryId,
    required this.colors,
    required this.createdDate,
    required this.price,
    required this.discountedPrice,
    required this.gender,
    required this.sizes,
    required this.title,
    required this.productId,
    required this.salesNumber,
    required this.image,
  });


factory ProductModel.fromMap(Map<String, dynamic> map) {
  List<ColorModel> colorsList = [];

  // Try to safely parse 'colors', but if wrong just skip
  if (map['colors'] is List) {
    colorsList = (map['colors'] as List)
        .whereType<Map<String, dynamic>>() // only keep maps
        .map((x) => ColorModel.fromMap(x))
        .toList();
  }
   // ⚡ If colors are empty, insert a default Black color
  if (colorsList.isEmpty) {
    colorsList.add(ColorModel(
      title: 'Default Black',
      hexCode: '000000',
    ));
  }

  return ProductModel(
    categoryId: map['categoryId'] ?? '',
    colors: colorsList, // <- safe fallback: empty list
    createdDate: map['createDate'] as Timestamp,
    price: map['price'] ?? '',
    discountedPrice: map['discountPrice'] ?? '',
    gender: int.tryParse(map['gender'].toString()) ?? 0,
    sizes: map['sizes'] != null
        ? List<String>.from(map['sizes'])
        : [],
    title: map['title'] ?? '',
    productId: map['productId'] ?? '',
    salesNumber: map['salesNumber'] ?? '',
    image: map['image'] ?? '',
  );
}

  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'colors': colors.map((x) => x.toMap()).toList(),
      'createDate': createdDate,
      'price': price,
      'discountPrice': discountedPrice,
      'gender': gender,
      'sizes': sizes,
      'title': title,
      'productId': productId,
      'salesNumber': salesNumber,
      'image': image,
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      categoryId: categoryId,
      colors: colors.map((e) => e.toEntity()).toList(),
      createdDate: createdDate,
      price: price,
      discountedPrice: discountedPrice,
      gender: gender,
      sizes: sizes,
      title: title,
      productId: productId,
      salesNumber: salesNumber,
      image: image,
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      categoryId: entity.categoryId,
      colors: entity.colors
          .map((e) => ColorModel(title: e.title, hexCode: e.hexCode))
          .toList(),
      createdDate: entity.createdDate,
      price: entity.price,
      discountedPrice: entity.discountedPrice,
      gender: entity.gender,
      sizes: entity.sizes,
      title: entity.title,
      productId: entity.productId,
      salesNumber: entity.salesNumber,
      image: entity.image,
    );
  }
}
