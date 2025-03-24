import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/common/bloc/button/button_state.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitialState());

  Future<void> execute({dynamic params,required Usecase useCase}) async {
    emit(ButtonLoadingState());
    try {
      Either returnedData = await useCase.call(params: params);

      returnedData.fold((l) => emit(ButtonErrorState(message: l)), (r) => emit(ButtonSuccessState()));
    } catch (e) {
      emit(ButtonErrorState(message: e.toString()));
    }
  }
}