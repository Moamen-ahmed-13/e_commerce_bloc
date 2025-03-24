import 'package:e_commerce_bloc/common/bloc/button/button_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/button/button_state.dart';
import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/core/widgets/app_bar.dart';
import 'package:e_commerce_bloc/core/widgets/buttons/basic_reactive_button.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/reset_password_usecase.dart';
import 'package:e_commerce_bloc/presentation/auth/pages/reset_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: BlocProvider(
          create: (context) => ButtonCubit(),
          child: BlocListener<ButtonCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonErrorState) {
                var snackBar = SnackBar(
                  content: Text(state.message),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              if (state is ButtonSuccessState) {
                AppNavigator.push(context, const ResetPasswordPage());
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot Password',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 30),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Email Address',
                  ),
                ),
                SizedBox(height: 20),
                Builder(builder: (context) {
                  return BasicReactiveButton(
                      onPressed: () {
                        context.read<ButtonCubit>().execute(
                            useCase: ResetPasswordUsecase(),
                            params: _emailController.text);
                      },
                      title: 'Continue');
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
