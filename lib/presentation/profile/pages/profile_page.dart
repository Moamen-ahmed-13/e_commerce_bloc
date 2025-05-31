import 'package:e_commerce_bloc/common/bloc/button/button_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/button/button_state.dart';
import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/core/theme/app_colors.dart';
import 'package:e_commerce_bloc/core/widgets/app_bar.dart';
import 'package:e_commerce_bloc/core/widgets/buttons/basic_app_button.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/signout_usecase.dart';
import 'package:e_commerce_bloc/presentation/auth/pages/signin.dart';
import 'package:e_commerce_bloc/presentation/profile/pages/favourite_page.dart';
import 'package:e_commerce_bloc/presentation/profile/pages/order_placed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: const Text('Profile'),
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Stack(
          children: [
            Column(
              children: [
                ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    tileColor: AppColors.secondBackground,
                    title: const Text('My Favorites'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      AppNavigator.push(context, const MyFavouritePage());
                    }),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    tileColor: AppColors.secondBackground,
                    title: const Text('My Orders'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      AppNavigator.push(context, const MyOrdersPage());
                    }),
              ],
            ),
            BlocProvider(
              create: (context) => ButtonCubit(),
              child: BlocBuilder<ButtonCubit, ButtonState>(
                builder: (context, state) {
                  if (state is ButtonLoadingState) {
                    return const CircularProgressIndicator();
                  }
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: BasicAppButton(
                      onPressed: () {
                        context
                            .read<ButtonCubit>()
                            .execute(useCase: SignOutUsecase());
                        AppNavigator.pushReplacement(context, SigninPage());
                      },
                      title: 'LogOut',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
