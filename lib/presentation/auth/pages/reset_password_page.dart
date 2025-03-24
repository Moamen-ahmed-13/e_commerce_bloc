import 'package:e_commerce_bloc/core/assets/app_vectors.dart';
import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/core/widgets/buttons/basic_app_button.dart';
import 'package:e_commerce_bloc/presentation/auth/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(AppVectors.emailSending),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'We have sent an email to reset your password',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 30,
          ),
          BasicAppButton(
            onPressed: () {
              AppNavigator.pushReplacement(context, SigninPage());
            },
            width: 200,
            title: 'Return to Sign in',
          )
        ],
      ),
    );
  }
}
