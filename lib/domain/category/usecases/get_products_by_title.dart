import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/domain/products/repository/product_repo.dart';
import 'package:e_commerce_bloc/service_locator.dart';

class GetProductsByTitleUsecase implements Usecase<Either, String> {

  @override
  Future<Either> call({String? params}) async{
    return await sl<ProductRepository>().getProductsByTitle(params!);
  }
  
}