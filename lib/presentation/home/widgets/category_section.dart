import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/domain/category/entity/category_entity.dart';
import 'package:e_commerce_bloc/presentation/categories/categories_page.dart';
import 'package:e_commerce_bloc/presentation/categories/categories_bloc/categories_display_cubit.dart';
import 'package:e_commerce_bloc/presentation/categories/categories_bloc/categories_display_state.dart';
import 'package:e_commerce_bloc/presentation/products/products_gird_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
        builder: (context, state) {
          if (state is CategoriesDisplayError) {
            print(state.message);
          }
          if (state is CategoriesDisplayLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CategoriesDisplayLoaded) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        AppNavigator.push(context, const CategoriesPage());
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                _categories(state.categories),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _categories(List<CategoryEntity> categories) {
    return SizedBox(
        height: 100,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  AppNavigator.push(context, ProductsGirdPage());
                },
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                          "assets/images/${categories[index].image}"),
                    ),
                    SizedBox(height: 10),
                    Text(
                      categories[index].name,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
            itemCount: categories.length));
  }
}
