class AddToCartReq {
  final String productId;
  final String productTitle;
  final String productSize;
  final String productColor;
  final int productQuantity;
  final String mainPrice;
  final double totalPrice;
  final String productImage;
  final String createdDate;

  AddToCartReq({
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
}
