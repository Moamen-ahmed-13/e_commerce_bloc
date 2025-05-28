import 'package:cloud_firestore/cloud_firestore.dart';
import 'color_entity.dart'; // You already have it

class ProductEntity {
  final String categoryId;
  final List<ColorEntity> colors;
  final Timestamp createdDate;
  final String price;
  final String discountedPrice;
  
  final int gender;
  final List<String> sizes;
  final String title;
  final String productId;
  final String salesNumber;
  final String image;

  ProductEntity({
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
}
