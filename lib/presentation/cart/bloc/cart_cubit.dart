import 'package:e_commerce_bloc/domain/order/entity/product_ordered.dart';
import 'package:e_commerce_bloc/domain/order/usecases/product_ordered.dart';
import 'package:e_commerce_bloc/domain/order/usecases/remove_cart_product.dart';
import 'package:e_commerce_bloc/presentation/cart/bloc/cart_state.dart';
import 'package:e_commerce_bloc/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartLoading());

  void displayCartProducts() async {
    var returnedData = await sl<ProductOrderedUsecase>().call();
    returnedData.fold((error) => emit(CartError(message: error)),
        (data) => emit(CartLoaded(products: data)));
  }

  Future<void> removeProduct(ProductOrderedEntity product) async {
    var returnedData = await sl<RemoveCartProductUsecase>().call(params: product.id);
    returnedData.fold((error) => emit(CartError(message: error)),
        (data) => displayCartProducts());
  }
}
