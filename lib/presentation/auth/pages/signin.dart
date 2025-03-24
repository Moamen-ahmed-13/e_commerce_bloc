import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/core/widgets/app_bar.dart';
import 'package:e_commerce_bloc/core/widgets/buttons/basic_app_button.dart';
import 'package:e_commerce_bloc/data/auth/models/sign_in_req.dart';
import 'package:e_commerce_bloc/presentation/auth/pages/enter_password.dart';
import 'package:e_commerce_bloc/presentation/auth/pages/signup.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
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
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email Address',
              ),
            ),
            SizedBox(height: 20),
            BasicAppButton(
                onPressed: () {
                  AppNavigator.push(
                      context,
                      EnterPasswordPage(
                        signInReq: SignInReq(email: _emailController.text),
                      ));
                },
                title: 'Continue'),
            Row(
              children: [
                Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    AppNavigator.push(context, SignupPage());
                  },
                  child: Text(
                    'Create One',
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black54),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
