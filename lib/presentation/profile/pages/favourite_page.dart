import 'package:e_commerce_bloc/common/bloc/product/product_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/product/product_state.dart';
import 'package:e_commerce_bloc/core/widgets/app_bar.dart';
import 'package:e_commerce_bloc/core/widgets/empty_list.dart';
import 'package:e_commerce_bloc/domain/products/entity/product_entity.dart';
import 'package:e_commerce_bloc/domain/products/usecases/get_fav_products.dart';
import 'package:e_commerce_bloc/presentation/home/widgets/product_card.dart';
import 'package:e_commerce_bloc/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavouritePage extends StatelessWidget {
  const MyFavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: const Text('My Favourite'),
      ),
      body: BlocProvider(
          create: (context) =>
              ProductCubit(sl<GetFavProductsUsecase>())..fetchProducts(),
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductLoaded) {
                return state.products.isEmpty
                    ? EmptyList(
                        context: context,
                        title: 'No favourite yet',
                      )
                    : _products(state.products);
              }

              if (state is ProductError) {
                return const Center(
                  child: Text('Please try again'),
                );
              }

              return Container();
            },
          )),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return SizedBox(
      height: double.infinity,
      child: GridView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6),
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(productEntity: products[index]);
        },
      ),
    );
  }
}
