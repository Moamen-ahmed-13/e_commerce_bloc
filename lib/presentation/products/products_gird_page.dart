import 'package:e_commerce_bloc/common/bloc/product/product_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/product/product_state.dart';
import 'package:e_commerce_bloc/core/widgets/app_bar.dart';
import 'package:e_commerce_bloc/domain/products/usecases/get_product.dart';
// import 'package:e_commerce_bloc/domain/products/entity/product_entity.dart';
import 'package:e_commerce_bloc/presentation/home/widgets/product_card.dart';
import 'package:e_commerce_bloc/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGirdPage extends StatelessWidget {
  const ProductsGirdPage({super.key});

  Color hexToColor(String hexCode) {
    hexCode = hexCode.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit( sl<GetProductUsecase>())..fetchProducts(),
      child: Scaffold(
          appBar: BasicAppbar(
            title: const Text('Products'),
          ),
          body: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ProductLoaded) {
                final products = state.products;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(productEntity: product);
                      // _buildProductCard(product);
                    },
                  ),
                );
              } else if (state is ProductError) {
                return Center(child: Text(state.message));
              }
              return Container();
            },
          )),
    );
  }

  // Widget _buildProductCard(ProductEntity product) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(12),
  //       border: Border.all(color: Colors.grey.shade300),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Expanded(
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
  //             child: Image.asset(
  //               'assets/products/${product.image}',
  //               fit: BoxFit.cover,
  //               width: double.infinity,
  //               errorBuilder: (context, error, stackTrace) =>
  //                   const Icon(Icons.error),
  //             ),
  //           ),
  //         ),
  //         SizedBox(height: 8),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 8),
  //           child: Text(
  //             product.title,
  //             style: const TextStyle(
  //               fontWeight: FontWeight.bold,
  //             ),
  //             overflow: TextOverflow.ellipsis,
  //             maxLines: 1,
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //           child: Row(
  //             children: [
  //               Text(
  //                 '\$${product.price}',
  //                 style: const TextStyle(
  //                     fontWeight: FontWeight.bold, fontSize: 14),
  //               ),
  //               const Spacer(),
  //               Container(
  //                 width: 18,
  //                 height: 18,
  //                 decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   color: hexToColor(product.colors.first.hexCode),
  //                   border: Border.all(color: Colors.black12),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
