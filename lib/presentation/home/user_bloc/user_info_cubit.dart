import 'package:e_commerce_bloc/domain/auth/usecases/get_user.dart';
import 'package:e_commerce_bloc/presentation/home/user_bloc/user_info_state.dart';
import 'package:e_commerce_bloc/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoLoading());

  void displayUserInfo() async {
    var returnedData = await sl<GetUserUsecase>().call();
    returnedData.fold((error) => emit(UserInfoError()),
        (data) => emit(UserInfoLoaded(userEntity: data)));
  }
}
