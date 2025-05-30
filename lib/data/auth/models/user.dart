// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:e_commerce_bloc/domain/auth/entity/user_entity.dart';

class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  final int gender;

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.gender
  });


factory UserModel.fromMap(Map<String, dynamic> map) {
  return UserModel(
    userId: map['userId'] as String? ?? '',
    firstName: map['first_name'] as String? ?? '',
    lastName: map['last_name'] as String? ?? '',
    email: map['email'] as String? ?? '',
    image: map['image'] as String? ?? '',
    gender: (map['gender'] as int?) ?? 0,
  );
}

    Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'image': image,
      'gender': gender,
    };
  }


  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName, 
      email: email, 
      image: image, 
      gender: gender
    );
  }
}
