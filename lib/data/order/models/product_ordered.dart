import 'package:e_commerce_bloc/domain/order/entity/product_ordered.dart';

class ProductOrderedModel {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final String productColor;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createdDate;
  final String id;

  ProductOrderedModel(
      {required this.productId,
      required this.productTitle,
      required this.productQuantity,
      required this.productColor,
      required this.productSize,
      required this.productPrice,
      required this.totalPrice,
      required this.productImage,
      required this.createdDate,
      required this.id});

  factory ProductOrderedModel.fromMap(Map<String, dynamic> map) {
    return ProductOrderedModel(
      productId: map['productId']?.toString() ?? '',
      productTitle: map['productTitle']?.toString() ?? '',
      productQuantity: (map['productQuantity'] is int)
          ? map['productQuantity']
          : int.tryParse(map['productQuantity'].toString()) ?? 0,
      productColor: map['productColor'] as String,
      productSize: map['productSize']?.toString() ?? '',
      productPrice: (map['productPrice'] is double)
          ? map['productPrice']
          : double.tryParse(map['productPrice'].toString()) ?? 0.0,
      totalPrice: (map['totalPrice'] is double)
          ? map['totalPrice']
          : double.tryParse(map['totalPrice'].toString()) ?? 0.0,
      productImage: map['productImage']?.toString() ?? '',
      createdDate: map['createdDate']?.toString() ?? '',
      id: map['id']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productTitle': productTitle,
      'productQuantity': productQuantity,
      'productColor': productColor,
      'productSize': productSize,
      'productPrice': productPrice,
      'totalPrice': totalPrice,
      'productImage': productImage,
      'createdDate': createdDate,
      'id': id,
    };
  }
}

extension ProductOrderedXModel on ProductOrderedModel {
  ProductOrderedEntity toEntity() {
    return ProductOrderedEntity(
        productId: productId,
        productTitle: productTitle,
        productQuantity: productQuantity,
        productColor: productColor,
        productSize: productSize,
        productPrice: productPrice,
        totalPrice: totalPrice,
        productImage: productImage,
        createdDate: createdDate,
        id: id);
  }
}

extension ProductOrderedXEntity on ProductOrderedEntity {
  ProductOrderedModel fromEntity() {
    return ProductOrderedModel(
        productId: productId,
        productTitle: productTitle,
        productQuantity: productQuantity,
        productColor: productColor,
        productSize: productSize,
        productPrice: productPrice,
        totalPrice: totalPrice,
        productImage: productImage,
        createdDate: createdDate,
        id: id);
  }
}
