import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/core/theme/app_colors.dart';
import 'package:e_commerce_bloc/domain/auth/entity/user_entity.dart';
import 'package:e_commerce_bloc/presentation/home/user_bloc/user_info_cubit.dart';
import 'package:e_commerce_bloc/presentation/home/user_bloc/user_info_state.dart';
import 'package:e_commerce_bloc/presentation/home/widgets/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoCubit()..displayUserInfo(),
      child: BlocBuilder<UserInfoCubit, UserInfoState>(
        builder: (context, state) {
          if (state is UserInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserInfoLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _profileImage(state.userEntity, context),
                _gender(state.userEntity),
                _cart(),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

Widget _cart() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.all(10),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary,
      ),
      child: SvgPicture.asset(
        'assets/vectors/bag.svg',
      ),
    ),
  );
}

Widget _gender(UserEntity user) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    height: 40,
    decoration: BoxDecoration(
      color: AppColors.secondBackground,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Center(
      child: Text(
        user.gender == 1 ? 'Men' : 'Women',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),
  );
}

Widget _profileImage(UserEntity user, BuildContext context) {
  return GestureDetector(
    onTap: () {
       AppNavigator.push(context, const ProfilePage());
    },
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/profile.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
