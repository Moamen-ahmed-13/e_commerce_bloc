import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/domain/products/entity/product_entity.dart';
import 'package:e_commerce_bloc/domain/products/repository/product_repo.dart';
import 'package:e_commerce_bloc/service_locator.dart';

class AddToFavouriteUsecase implements Usecase<Either,ProductEntity> {
  @override
  Future<Either> call({ProductEntity? params}) async{
    return await sl<ProductRepository>().addOrRemoveFromFavorite(params!);
  }
  
}