import 'package:equatable/equatable.dart';
import 'package:e_commerce_bloc/domain/products/entity/product_entity.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductEntity> products;

  const ProductLoaded(this.products);


}

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
