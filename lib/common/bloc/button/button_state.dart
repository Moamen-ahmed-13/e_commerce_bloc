abstract class ButtonState {}

class ButtonInitialState extends ButtonState {}

class ButtonLoadingState extends ButtonState {}

class ButtonSuccessState extends ButtonState {}

class ButtonErrorState extends ButtonState {
  final String message;
  ButtonErrorState({required this.message});
}