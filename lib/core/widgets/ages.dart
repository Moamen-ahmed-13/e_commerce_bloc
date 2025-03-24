import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_bloc/presentation/auth/bloc/age_display_cubit.dart';
import 'package:e_commerce_bloc/presentation/auth/bloc/age_display_states.dart';
import 'package:e_commerce_bloc/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 2.7,
        child: BlocBuilder<AgeDisplayCubit, AgeDisplayState>(
            builder: (context, state) {
          if (state is AgeDisplayLoading) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
          if (state is AgeDisplayLoaded) {
            return ages(state.ages);
          }
          if (state is AgeDisplayError) {
            return Container(
              alignment: Alignment.center,
              child: Text(state.message),
            );
          }
          return Container();
        }));
  }

  Widget ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: ages.length,
        separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
              context
                  .read<AgeSelectionCubit>()
                  .selectAge(ages[index].data()['value']);
            },
            child: Text(
              ages[index].data()['value'],
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ),
          );
        });
  }
}
