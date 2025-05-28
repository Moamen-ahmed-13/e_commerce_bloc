import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/domain/products/repository/product_repo.dart';
import 'package:e_commerce_bloc/service_locator.dart';

class IsFavouriteUsecase implements Usecase<bool, String> {
  @override
  Future<bool> call({String? params}) async{
    return await sl<ProductRepository>().isFavorite(params!);
  }
  
}