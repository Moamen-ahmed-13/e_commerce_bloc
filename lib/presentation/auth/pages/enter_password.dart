import 'package:e_commerce_bloc/common/bloc/button/button_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/button/button_state.dart';
import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/core/widgets/app_bar.dart';
import 'package:e_commerce_bloc/core/widgets/buttons/basic_app_button.dart';
import 'package:e_commerce_bloc/data/auth/models/sign_in_req.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/signin_usecase.dart';
import 'package:e_commerce_bloc/presentation/auth/pages/forgot_password.dart';
import 'package:e_commerce_bloc/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterPasswordPage extends StatelessWidget {
  EnterPasswordPage({super.key, required this.signInReq});

  final SignInReq signInReq;
  final TextEditingController _passwordController = TextEditingController();

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
                AppNavigator.pushReplacement(context, HomePage());
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign in',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 30),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 20),
                Builder(builder: (context) {
                  return BasicAppButton(
                      onPressed: () {
                        signInReq.password = _passwordController.text;
                        context.read<ButtonCubit>().execute(
                            useCase: SigninUsecase(), params: signInReq);
                      },
                      title: 'Continue');
                }),
                Row(
                  children: [
                    Text('Forgot Password?'),
                    TextButton(
                      onPressed: () {
                        AppNavigator.push(context, ForgotPasswordPage());
                      },
                      child: Text(
                        'Reset',
                        style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black54),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
