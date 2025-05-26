import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/data/order/models/add_to_cart.dart';
import 'package:e_commerce_bloc/domain/order/repository/order_repo.dart';
import 'package:e_commerce_bloc/service_locator.dart';

class AddToCartUsecase implements Usecase<Either,AddToCartReq> {
  @override
  Future<Either> call({ AddToCartReq? params}) async{
    return await sl<OrderRepository>().addToCart(params!);
  }
}