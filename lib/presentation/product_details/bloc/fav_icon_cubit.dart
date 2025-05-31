import 'package:e_commerce_bloc/domain/products/entity/product_entity.dart';
import 'package:e_commerce_bloc/domain/products/usecases/favourite_usecase.dart';
import 'package:e_commerce_bloc/domain/products/usecases/is_favourite.dart';
import 'package:e_commerce_bloc/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavIconCubit extends Cubit<bool> {
  FavIconCubit() : super(false);

  void isFavourite(String productId) async {
    var returnedData = await sl<IsFavouriteUsecase>().call(params: productId);
    emit(returnedData);
  }

  void onTap(ProductEntity product) async {
    var returnedData = await sl<AddToFavouriteUsecase>().call(params: product);
    returnedData.fold((error) {}, (data) {
      emit(data);
    });
  }
}
