import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/data/auth/models/sign_in_req.dart';
import 'package:e_commerce_bloc/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce_bloc/service_locator.dart';

class SigninUsecase implements Usecase<Either,SignInReq>  {
  @override
  Future<Either> call({SignInReq? params}) async{
    return await sl<AuthRepository>().signin(params!);
   
  }

}