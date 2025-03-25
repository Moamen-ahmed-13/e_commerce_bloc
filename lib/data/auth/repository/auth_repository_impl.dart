import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/auth/models/sign_in_req.dart';
import 'package:e_commerce_bloc/data/auth/models/user.dart';
import 'package:e_commerce_bloc/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_bloc/data/auth/source/auth_firebase_service.dart';
import 'package:e_commerce_bloc/domain/auth/repository/auth_repository.dart';

import '../../../service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationReq user) async {
    return await sl<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either> signin(SignInReq user) async {
    return await sl<AuthFirebaseService>().signin(user);
  }

  @override
  Future<Either> getAges() async {
    return await sl<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> resetPassword(String email) async {
    return await sl<AuthFirebaseService>().resetPassword(email);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthFirebaseService>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    var user = await sl<AuthFirebaseService>().getUser();
    return user.fold(
      (error) => Left(error),
      (data) => Right(UserModel.fromMap(data).toEntity()),
    );
  }
}
