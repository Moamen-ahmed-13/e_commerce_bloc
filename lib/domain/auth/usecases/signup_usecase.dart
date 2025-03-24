import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_bloc/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce_bloc/service_locator.dart';

class SignupUsecase implements Usecase<Either,UserCreationReq> {
  @override
  Future<Either> call({ UserCreationReq? params}) async{
    return await sl<AuthRepository>().signup(params!);
  }
}