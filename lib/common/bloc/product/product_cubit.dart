import 'package:bloc/bloc.dart';
import 'package:e_commerce_bloc/domain/products/repository/product_repo.dart';
import 'package:e_commerce_bloc/service_locator.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository = sl<ProductRepository>();

  ProductCubit() : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());

    final result = await productRepository.getProducts();

    result.fold(
      (error) => emit(ProductError(error)),
      (products) => emit(ProductLoaded(products)),
    );
  }
}
