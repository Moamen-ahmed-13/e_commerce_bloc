import 'package:e_commerce_bloc/common/bloc/product/product_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/product/product_state.dart';
import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/domain/products/entity/product_entity.dart';
import 'package:e_commerce_bloc/domain/products/usecases/get_product.dart';
import 'package:e_commerce_bloc/presentation/home/widgets/product_card.dart';
import 'package:e_commerce_bloc/presentation/products/products_gird_page.dart';
import 'package:e_commerce_bloc/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(sl<GetProductUsecase>())..fetchProducts(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _topSelling(context),
                SizedBox(height: 10),
                _products(state.products),
              ],
            );
          } else if (state is ProductError) {
            print(state.message);
            Center(
              child: Text('Error: ${state.message}'),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _topSelling(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Top Selling',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        TextButton(
          onPressed: () {
            AppNavigator.push(context, const ProductsGirdPage());
          },
          child: Text(
            'See all',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }

  Widget _products(List<ProductEntity> products) {
    return SizedBox(
        height: 300,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ProductCard(
                productEntity: products[index],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
            itemCount: products.length));
  }
}
