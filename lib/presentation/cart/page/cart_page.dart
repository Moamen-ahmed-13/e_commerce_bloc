import 'package:e_commerce_bloc/core/assets/app_vectors.dart';
import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/core/widgets/app_bar.dart';
import 'package:e_commerce_bloc/core/widgets/buttons/basic_app_button.dart';
import 'package:e_commerce_bloc/domain/order/entity/product_ordered.dart';
import 'package:e_commerce_bloc/presentation/cart/bloc/cart_cubit.dart';
import 'package:e_commerce_bloc/presentation/cart/bloc/cart_state.dart';
import 'package:e_commerce_bloc/presentation/cart/widgets/check_out.dart';
import 'package:e_commerce_bloc/presentation/cart/widgets/product_ordered_card.dart';
import 'package:e_commerce_bloc/presentation/categories/categories_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocProvider(
        create: (context) => CartCubit()..displayCartProducts(),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CartLoaded) {
              return state.products.isEmpty
                  ? _notFound(context)
                  : Stack(
                children: [
                  _products(state.products),
                   Align(
                    alignment: Alignment.bottomCenter,
                    child: Checkout(products: state.products,)
                  )
                ],
              );

            }
            if (state is CartError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _notFound(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppVectors.cartBag),
            const SizedBox(height: 30),
            const Text(
              "Your Cart is Empty",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
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
  Widget _products(List<ProductOrderedEntity> products) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return ProductOrderedCard(
          productOrderedEntity: products[index] ,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10,),
      itemCount: products.length
    );
  }

}
