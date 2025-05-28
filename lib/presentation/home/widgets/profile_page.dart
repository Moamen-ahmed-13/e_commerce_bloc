import 'package:e_commerce_bloc/common/bloc/button/button_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/button/button_state.dart';
import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/core/theme/app_colors.dart';
import 'package:e_commerce_bloc/core/widgets/buttons/back_button.dart';
import 'package:e_commerce_bloc/core/widgets/buttons/basic_app_button.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/signout_usecase.dart';
import 'package:e_commerce_bloc/presentation/auth/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBackButton(),
            SizedBox(height: 250),
            Center(
              child: BlocProvider(
                create: (context) => ButtonCubit(),
                child: BlocBuilder<ButtonCubit, ButtonState>(
                  builder: (context, state) {
                    if (state is ButtonLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    return BasicAppButton(
                      onPressed: () {
                        context
                            .read<ButtonCubit>()
                            .execute(useCase: SignOutUsecase());
                        AppNavigator.pushReplacement(context, SigninPage());
                      },
                      title: 'LogOut',
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
