import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/auth/models/sign_in_req.dart';
import 'package:e_commerce_bloc/data/auth/models/user_creation_req.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(SignInReq user);
  Future<Either> resetPassword(String email);
  Future<bool> isLoggedIn();
  Future<Either> getAges();
  Future<Either> getUser();

}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signup(UserCreationReq user) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(data.user!.uid)
          .set({
        'email': user.email,
        'first_name': user.firstName,
        'last_name': user.lastName,
        'gender': user.gender,
        'age': user.age,
      });
      return Right('Sign up was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signin(SignInReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      return Right('Sign in was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'Not user found for this email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for this user';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );

      return Right('Password reset email is sent');
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection('Ages').get();
      return Right(returnedData.docs);
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
  
  @override
//   Future<Either> getUser() async{
//    try {
//   var currentUser = FirebaseAuth.instance.currentUser;
//   var userData = FirebaseFirestore.instance.collection('Users').doc(currentUser?.uid).get();
//   return Right(userData);
// }   catch (e) {
//     return Left('Please try again');
// }
//   }
@override
Future<Either> getUser() async {
  try {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return Left('User not logged in');
    }

    var userDoc = await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser.uid)
        .get();

    if (!userDoc.exists) {
      return Left('User not found');
    }

    return Right(userDoc.data());
  } catch (e) {
    return Left('Failed to fetch user data');
  }
}

}
