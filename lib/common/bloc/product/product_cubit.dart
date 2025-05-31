import 'package:bloc/bloc.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final Usecase usecase;
  ProductCubit(this.usecase) : super(ProductLoading());

  Future<void> fetchProducts({dynamic params}) async {
    emit(ProductLoading());

    final result = await usecase.call(params: params);

    result.fold(
      (error) => emit(ProductError(error)),
      (products) => emit(ProductLoaded(products)),
    );
  }

  void displayInitial() {
    emit(ProductInitial());
  }
}
