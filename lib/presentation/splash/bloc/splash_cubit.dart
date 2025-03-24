import 'package:e_commerce_bloc/domain/auth/usecases/is_logged_in.dart';
import 'package:e_commerce_bloc/presentation/splash/bloc/splash_state.dart';
import 'package:e_commerce_bloc/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await sl<IsLoggedInUsecase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    }else {
      emit(UnAuthenticated());
    }
    
  }
}
