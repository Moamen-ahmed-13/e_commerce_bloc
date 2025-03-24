import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce_bloc/service_locator.dart';

class GetUserUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async{
    return await sl<AuthRepository>().getUser();
  }

}
