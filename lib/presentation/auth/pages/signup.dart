import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/core/widgets/app_bar.dart';
import 'package:e_commerce_bloc/core/widgets/buttons/basic_app_button.dart';
import 'package:e_commerce_bloc/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_bloc/presentation/auth/pages/gender_and_age.dart';
import 'package:e_commerce_bloc/presentation/auth/pages/signin.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Account',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 30),
              _firstNameTextField('First Name'),
              SizedBox(height: 16),
              _lastNameTextField('Last Name'),
              SizedBox(height: 16),
              _emailTextField('Email Address'),
              SizedBox(height: 16),
              _passwordTextField('Password'),
              SizedBox(height: 35),
              BasicAppButton(
                  onPressed: () {
                    AppNavigator.push(
                        context,
                        GenderAndAgeSelectionPage(
                          userCreationReq: UserCreationReq(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              email: _emailController.text,
                              password: _passwordController.text),
                        ));
                  },
                  title: 'Continue'),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('Do you have an account?'),
                  TextButton(
                    onPressed: () {
                      AppNavigator.pushReplacement(context, SigninPage());
                    },
                    child: Text(
                      'Sign in',
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
      ),
    );
  }

  Widget _firstNameTextField(String hintText) {
    return TextField(
      controller: _firstNameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: hintText,
      ),
    );
  }

  Widget _lastNameTextField(String hintText) {
    return TextField(
      controller: _lastNameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: hintText,
      ),
    );
  }

  Widget _emailTextField(String hintText) {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: hintText,
      ),
    );
  }

  Widget _passwordTextField(String hintText) {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: hintText,
      ),
    );
  }
}
