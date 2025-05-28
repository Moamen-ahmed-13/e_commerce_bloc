import 'package:e_commerce_bloc/common/bloc/button/button_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/button/button_state.dart';
import 'package:e_commerce_bloc/core/helper/cart.dart';
import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/core/widgets/app_bar.dart';
import 'package:e_commerce_bloc/data/order/models/order_registeration_req.dart';
import 'package:e_commerce_bloc/domain/order/entity/product_ordered.dart';
import 'package:e_commerce_bloc/domain/order/usecases/order_registration.dart';
import 'package:e_commerce_bloc/presentation/cart/widgets/check_out.dart';
import 'package:e_commerce_bloc/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key, required this.products});
  final List<ProductOrderedEntity> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppbar(
          title: const Text('CheckOut'),
        ),
        body: BlocProvider(
          create: (context) => ButtonCubit(),
          child: BlocListener<ButtonCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonErrorState) {}
              if (state is ButtonSuccessState) {
                var snackBar = SnackBar(
                  content: Text('Order Placed Successfully'),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: Builder(builder: (context) {
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Checkout(
                      onPress: () {
                        context.read<ButtonCubit>().execute(
                              useCase: OrderRegistrationUsecase(),
                              params: OrderRegistrationReq(
                                products: products,
                                createdDate: DateTime.now().toString(),
                                itemCount: products.length,
                                totalPrice:
                                    CartHelper.calculateCartSubtotal(products) +
                                        8,
                                shippingAddress: 'shippingAddress',
                              ),
                            );
                      },
                      products: products,
                      content: Row(
                        children: [
                          Text(
                            '\$${CartHelper.calculateCartSubtotal(products) + 8}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          Text(
                            'Place Order',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        ));
  }
}
