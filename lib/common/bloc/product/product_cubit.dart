import 'package:bloc/bloc.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/domain/products/repository/product_repo.dart';
import 'package:e_commerce_bloc/service_locator.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository = sl<ProductRepository>();
  final Usecase usecase;
  ProductCubit(this.usecase) : super(ProductInitial());

  Future<void> fetchProducts( {dynamic params}) async {
    emit(ProductLoading());

    final result = await usecase.call(params: params);

    result.fold(
      (error) => emit(ProductError(error)),
      (products) => emit(ProductLoaded(products)),
    );
  }
  void displayInitial( ) {
    emit(ProductInitial());
  }
}
