import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/core/theme/app_colors.dart';
import 'package:e_commerce_bloc/core/widgets/buttons/back_button.dart';
import 'package:e_commerce_bloc/domain/category/entity/category_entity.dart';
import 'package:e_commerce_bloc/presentation/categories/categories_bloc/categories_display_cubit.dart';
import 'package:e_commerce_bloc/presentation/categories/categories_bloc/categories_display_state.dart';
import 'package:e_commerce_bloc/presentation/products/products_gird_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 60.0),
        child: BlocProvider(
          create: (context) => CategoriesDisplayCubit()..displayCategories(),
          child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
            builder: (context, state) {
              if (state is CategoriesDisplayLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CategoriesDisplayLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBackButton(),
                    SizedBox(
                      height: 50,
                    ),
                    Text('Shop by Categories',
                        style: Theme.of(context).textTheme.headlineSmall),
                    SizedBox(
                      height: 20,
                    ),
                    _categories(state.categories),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget _categories(List<CategoryEntity> categories) {
    return SizedBox(
        height: 500,
        child: ListView.separated(
            padding: EdgeInsets.all(0),
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  AppNavigator.push(context, const ProductsGirdPage());
                },
                child: ListTile(
                  title: Text(categories[index].name),
                  leading: Container(
                    height: 40,
                    width: 40,
                    child:
                        Image.asset("assets/images/${categories[index].image}"),
                  ),
                  tileColor: AppColors.secondBackground,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
            itemCount: categories.length));
  }
}

