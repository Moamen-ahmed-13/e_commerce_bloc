import 'package:e_commerce_bloc/common/bloc/product/product_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/product/product_state.dart';
import 'package:e_commerce_bloc/core/assets/app_vectors.dart';
import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/core/widgets/app_bar.dart';
import 'package:e_commerce_bloc/core/widgets/buttons/back_button.dart';
import 'package:e_commerce_bloc/core/widgets/buttons/basic_app_button.dart';
import 'package:e_commerce_bloc/domain/category/usecases/get_products_by_title.dart';
import 'package:e_commerce_bloc/domain/products/entity/product_entity.dart';
import 'package:e_commerce_bloc/presentation/categories/categories_page.dart';
import 'package:e_commerce_bloc/presentation/home/widgets/product_card.dart';
import 'package:e_commerce_bloc/presentation/home/widgets/search_field.dart';
import 'package:e_commerce_bloc/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(sl<GetProductsByTitleUsecase>()),
      child: Scaffold(
        appBar: BasicAppbar(
          title: Hero(
              tag: 'search',
              child: SearchField(
                isSearchPage: true,
              )),
        ),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductLoaded) {
              return state.products.isEmpty
                  ? _notFound(context)
                  : _products(state.products);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      padding: const EdgeInsets.all(16.0),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(productEntity: product);
      },
    );
  }

  Widget _notFound(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppVectors.notFound),
            const SizedBox(height: 30),
            const Text(
              "Sorry, we couldn't find any matching result for your Search.",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            const SizedBox(height: 30),
            BasicAppButton(
                width: 200,
                title: 'Explore Categories',
                onPressed: () {
                  AppNavigator.pushReplacement(context, CategoriesPage());
                })
          ],
        ),
      ),
    );
  }
}
