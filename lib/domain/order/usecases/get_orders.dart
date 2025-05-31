import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/domain/order/repository/order_repo.dart';
import 'package:e_commerce_bloc/service_locator.dart';

class GetOrdersUsecase implements Usecase<Either,dynamic> {
  @override
  Future<Either> call({dynamic params}) async{
    return await sl<OrderRepository>().getOrders();
  }
}