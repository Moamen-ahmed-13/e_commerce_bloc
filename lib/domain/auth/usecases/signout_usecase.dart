
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/data/auth/source/auth_firebase_service.dart';
import 'package:e_commerce_bloc/service_locator.dart';

class SignOutUsecase implements Usecase<void, void> {
  @override
  Future<void> call({void params}) async {
    await sl<AuthFirebaseService>().signout();
  }
}  