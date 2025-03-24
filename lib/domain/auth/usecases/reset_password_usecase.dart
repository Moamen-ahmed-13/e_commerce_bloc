import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce_bloc/service_locator.dart';

class ResetPasswordUsecase implements Usecase<Either, String>  {
  @override
  Future<Either> call({String? params}) async{
    return await sl<AuthRepository>().resetPassword(params!);
   
  }

}