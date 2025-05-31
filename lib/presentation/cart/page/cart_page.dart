import 'package:e_commerce_bloc/core/widgets/app_bar.dart';
import 'package:e_commerce_bloc/core/widgets/empty_list.dart';
import 'package:e_commerce_bloc/domain/order/entity/product_ordered.dart';
import 'package:e_commerce_bloc/presentation/cart/bloc/cart_cubit.dart';
import 'package:e_commerce_bloc/presentation/cart/bloc/cart_state.dart';
import 'package:e_commerce_bloc/presentation/cart/widgets/check_out.dart';
import 'package:e_commerce_bloc/presentation/cart/widgets/product_ordered_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Cart'),
      ),
      body: BlocProvider(
        create: (context) => CartCubit()..displayCartProducts(),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CartLoaded) {
              return state.products.isEmpty
                  ? EmptyList(
                      context: context,
                      title: 'Your cart is empty',
                    )
                  : Stack(
                      children: [
                        _products(state.products),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Checkout(
                              products: state.products,
                            ))
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

  Widget _products(List<ProductOrderedEntity> products) {
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return ProductOrderedCard(
            productOrderedEntity: products[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: products.length);
  }
}
