import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/domain/products/repository/product_repo.dart';
import 'package:e_commerce_bloc/service_locator.dart';

class GetFavProductsUsecase implements Usecase<Either,dynamic> {
  @override
  Future<Either> call({dynamic params}) async{
    return await sl<ProductRepository>().getFavoriteProducts();
  }
  
}