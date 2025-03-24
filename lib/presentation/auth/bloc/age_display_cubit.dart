import 'package:e_commerce_bloc/domain/auth/usecases/get_ages.dart';
import 'package:e_commerce_bloc/presentation/auth/bloc/age_display_states.dart';
import 'package:e_commerce_bloc/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgeDisplayCubit extends Cubit<AgeDisplayState> {
  AgeDisplayCubit() : super(AgeDisplayInitial());
  void displayAge() async {
    var returnedData = await sl<GetAgesUseCase>().call();

    returnedData.fold(
      (message) => emit(
        AgeDisplayError(message: message),
      ),
      (data) => emit(
        AgeDisplayLoaded ( ages: data),
      ),
    );
  }
}
