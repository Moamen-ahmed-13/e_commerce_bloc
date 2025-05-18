
import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/auth/models/sign_in_req.dart';
import 'package:e_commerce_bloc/data/auth/models/user_creation_req.dart';
abstract class AuthRepository {
  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(SignInReq user);
  Future<Either> signout();
  Future<Either> resetPassword(String email);
  Future<Either> getAges();
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}
