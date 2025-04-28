// ignore_for_file: must_be_immutable

import 'package:e_commerce_bloc/core/widgets/app_bar.dart';
import 'package:e_commerce_bloc/domain/products/entity/product_entity.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, required this.productEntity});
  ProductEntity productEntity;

  Color hexToColor(String hexCode) {
  if (hexCode.isEmpty) {
    return Colors.black; // fallback default color
  }
  hexCode = hexCode.replaceAll('#', '');
  if (hexCode.length == 6) {
    return Color(int.parse('FF$hexCode', radix: 16)); // Normal hex
  } else if (hexCode.length == 8) {
    return Color(int.parse(hexCode, radix: 16)); // Already has opacity
  } else {
    return Colors.black; // Fallback color if something wrong
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Text(productEntity.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                "assets/products/${productEntity.image}",
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "\$${productEntity.price}",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 8,
                children: productEntity.colors.map((color) {
                  return Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: hexToColor(color.hexCode),
                      border: Border.all(color: Colors.black12),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
