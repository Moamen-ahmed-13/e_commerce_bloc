import 'package:e_commerce_bloc/common/bloc/button/button_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/button/button_state.dart';
import 'package:e_commerce_bloc/core/helper/bottom_sheet.dart';
import 'package:e_commerce_bloc/core/theme/app_colors.dart';
import 'package:e_commerce_bloc/core/widgets/ages.dart';
import 'package:e_commerce_bloc/core/widgets/app_bar.dart';
import 'package:e_commerce_bloc/core/widgets/buttons/basic_reactive_button.dart';
import 'package:e_commerce_bloc/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/signup_usecase.dart';
import 'package:e_commerce_bloc/presentation/auth/bloc/age_display_cubit.dart';
import 'package:e_commerce_bloc/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:e_commerce_bloc/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  const GenderAndAgeSelectionPage({super.key, required this.userCreationReq});
  final UserCreationReq userCreationReq;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => GenderSelectionCubit()),
          BlocProvider(create: (_) => AgeSelectionCubit()),
          BlocProvider(create: (_) => AgeDisplayCubit()),
          BlocProvider(create: (_) => ButtonCubit()),
        ],
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonErrorState) {
              var snackBar = SnackBar(
                content: Text(state.message),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tell us about yourself',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: 60),
                    Text('Who do you shop for?',
                        style: Theme.of(context).textTheme.bodyLarge),
                    SizedBox(height: 25),
                    genders(context),
                    SizedBox(height: 60),
                    Text('How old are you?',
                        style: Theme.of(context).textTheme.bodyLarge),
                    SizedBox(height: 25),
                    age(),
                  ],
                ),
              ),
              const Spacer(),
              finishButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget genders(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            genderTile('Male', 1, context),
            SizedBox(width: 20),
            genderTile('Female', 2, context),
          ],
        );
      },
    );
  }

  Expanded genderTile(String gender, int index, BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(index);
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: context.read<GenderSelectionCubit>().selectedIndex == index
                  ? AppColors.primary
                  : AppColors.secondBackground,
              borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Text(
              gender,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget age() {
    return BlocBuilder<AgeSelectionCubit, String>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AppBottomSheet.display(
                context,
                MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: context.read<AgeSelectionCubit>(),
                    ),
                    BlocProvider.value(
                      value: context.read<AgeDisplayCubit>()..displayAge(),
                    ),
                  ],
                  child: Ages(),
                ));
          },
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state,
                ),
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget finishButton(BuildContext context) {
    return Container(
      height: 100,
      color: AppColors.secondBackground,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Builder(builder: (context) {
          return BasicReactiveButton(
            title: 'Finish',
            onPressed: () {
              userCreationReq.gender =
                  context.read<GenderSelectionCubit>().selectedIndex;
              userCreationReq.age = context.read<AgeSelectionCubit>().selectedAge;
              context.read<ButtonCubit>().execute(useCase: SignupUsecase(),params: userCreationReq);
            },
          );
        }),
      ),
    );
  }
}
