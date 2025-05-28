import 'package:dartz/dartz.dart';
import '../entity/product_entity.dart';

abstract class ProductRepository {
  Future<Either<String, List<ProductEntity>>> getProducts();
  Future<Either<String, List<ProductEntity>>> getProductsByTitle(String title);
  Future<Either> addOrRemoveFromFavorite(ProductEntity product);
  Future<bool> isFavorite(String productId);
  Future<Either> getFavoriteProducts();

}
