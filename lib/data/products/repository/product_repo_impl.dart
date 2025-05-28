import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/products/source/product_firebase_service.dart';
import 'package:e_commerce_bloc/domain/products/entity/product_entity.dart';
import 'package:e_commerce_bloc/domain/products/repository/product_repo.dart';
import 'package:e_commerce_bloc/service_locator.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either<String, List<ProductEntity>>> getProducts() async {
    var result = await sl<ProductFirebaseService>().getProducts();
    return result.fold(
      (error) => Left(error),
      (data) => Right(data.map((e) => e.toEntity()).toList()),
    );
  }
  
  @override
  Future<Either<String, List<ProductEntity>>> getProductsByTitle(String title) async{
    var result = await sl<ProductFirebaseService>().getProductsByTitle(title);
    return result.fold(
      (error) => Left(error),
      (data) => Right(data.map((e) => e.toEntity()).toList()),
    );
  }
  
  @override
  Future<Either> addOrRemoveFromFavorite(ProductEntity product)async {
       var result = await sl<ProductFirebaseService>().addOrRemoveFromFavorite(product);
    return result.fold(
      (error) => Left(error),
      (data) => Right(data),
    );

  }
  
  @override
  Future<bool> isFavorite(String productId) async{
     return await sl<ProductFirebaseService>().isFavorite(productId);
     
  }
  
  @override
  Future<Either> getFavoriteProducts() async{
       var result = await sl<ProductFirebaseService>().getFavoriteProducts();
    return result.fold(
      (error) => Left(error),
      (data) => Right(data.map((e) => e.toEntity()).toList()),
    );

  }
}
