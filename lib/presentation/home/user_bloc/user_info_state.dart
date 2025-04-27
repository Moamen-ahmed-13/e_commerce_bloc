import 'package:e_commerce_bloc/domain/auth/entity/user_entity.dart';

abstract class UserInfoState {}

class UserInfoLoading extends UserInfoState {}

class UserInfoLoaded extends UserInfoState {
  final UserEntity userEntity;
  UserInfoLoaded({required this.userEntity});
}

class UserInfoError extends UserInfoState {}
