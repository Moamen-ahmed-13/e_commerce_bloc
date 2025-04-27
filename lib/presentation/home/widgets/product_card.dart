import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/core/theme/app_colors.dart';
import 'package:e_commerce_bloc/domain/products/entity/product_entity.dart';
import 'package:e_commerce_bloc/presentation/product_details/page/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductCard({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, ProductDetailsScreen());
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/products/${productEntity.image}' ??
                            'assets/products/1.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productEntity.title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          productEntity.discountedPrice == 0
                              ? "${productEntity.price}\$"
                              : "${productEntity.discountedPrice}\$",
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(width: 10),
                        Text(
                          productEntity.discountedPrice == 0
                              ? ""
                              : "${productEntity.price}\$",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
