import 'package:e_commerce_bloc/domain/order/entity/product_ordered.dart';

class ProductOrderedModel {
  final String productId;
  final String productTitle;
  final String productSize;
  final String productColor;
  final int productQuantity;
  final String mainPrice;
  final double totalPrice;
  final String productImage;
  final String createdDate;

  ProductOrderedModel({
    required this.createdDate,
    required this.productImage,
    required this.productId,
    required this.productTitle,
    required this.productSize,
    required this.productColor,
    required this.productQuantity,
    required this.mainPrice,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productTitle': productTitle,
      'productSize': productSize,
      'productColor': productColor,
      'productQuantity': productQuantity,
      'mainPrice': mainPrice,
      'totalPrice': totalPrice,
      'productImage': productImage,
      'createdDate': createdDate,
    };
  }

  factory ProductOrderedModel.fromMap(Map<String, dynamic> map) {
    return ProductOrderedModel(
      productId: map['productId'] as String,
      productTitle: map['productTitle'] as String,
      productSize: map['productSize'] as String,
      productColor: map['productColor'] as String,
      productQuantity: map['productQuantity'] as int,
      mainPrice: map['mainPrice'] as String,
      totalPrice: map['totalPrice'] as double,
      productImage: map['productImage'] as String,
      createdDate: map['createdDate'] as String,
    );
  }
}

extension ProductOrderedModelExtension on ProductOrderedModel {
  ProductOrderedEntity toEntity() {
    return ProductOrderedEntity(
      productId: productId,
      productTitle: productTitle,
      productSize: productSize,
      productColor: productColor,
      productQuantity: productQuantity,
      mainPrice: mainPrice,
      totalPrice: totalPrice,
      productImage: productImage,
      createdDate: createdDate,
    );
  }
}
