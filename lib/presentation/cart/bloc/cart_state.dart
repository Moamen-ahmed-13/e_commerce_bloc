import 'package:e_commerce_bloc/domain/order/entity/product_ordered.dart';

abstract class CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<ProductOrderedEntity> products;
  CartLoaded({required this.products});
}

class CartError extends CartState {
  final String message;
  CartError({required this.message});
}