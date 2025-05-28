import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/data/order/models/order_registeration_req.dart';
import 'package:e_commerce_bloc/domain/order/repository/order_repo.dart';
import 'package:e_commerce_bloc/service_locator.dart';

class OrderRegistrationUsecase implements Usecase<Either,OrderRegistrationReq> {
  @override
  Future<Either> call({ OrderRegistrationReq? params}) async{
    return await sl<OrderRepository>().orderRegistration(params!);
  }
}