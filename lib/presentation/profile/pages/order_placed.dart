import 'package:e_commerce_bloc/core/theme/app_colors.dart';
import 'package:e_commerce_bloc/core/widgets/app_bar.dart';
import 'package:e_commerce_bloc/core/widgets/empty_list.dart';
import 'package:e_commerce_bloc/domain/order/entity/order_entity.dart';
import 'package:e_commerce_bloc/presentation/profile/bloc/order_display_state.dart';
import 'package:e_commerce_bloc/presentation/profile/bloc/orders_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: const Text('My Orders'),
      ),
           body: BlocProvider(
          create: (context) => OrdersDisplayCubit()..displayOrders(),
          child: BlocBuilder<OrdersDisplayCubit,OrdersDisplayState>(
            builder: (context, state) {
              if (state is OrdersDisplayLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is OrdersDisplayLoaded){
                return state.orders.isEmpty? EmptyList(context: context,
                title: 'No orders yet',): _orders(state.orders);
              }

              if (state is OrdersDisplayError){
                return Center(
                  child: Text(
                    state.errorMessage
                  ),
                );
              }
              return Container();
            },
          )
        )
    );
  }

  Widget _orders(List<OrderEntity> orders) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              
            },
            child: Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.secondBackground,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.receipt_rounded
                        ),
                        const SizedBox(width: 20, ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order #${orders[index].code}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16
                              ),
                            ),
                            Text(
                              '${orders[index].products.length} item',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.grey
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded
                    )
                  ],
                ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20, ),
        itemCount: orders.length
    );
  }
}
