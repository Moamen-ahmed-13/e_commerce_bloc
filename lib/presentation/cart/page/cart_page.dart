import 'package:e_commerce_bloc/core/assets/app_vectors.dart';
import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/core/widgets/app_bar.dart';
import 'package:e_commerce_bloc/core/widgets/buttons/basic_app_button.dart';
import 'package:e_commerce_bloc/presentation/categories/categories_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: _notFound(context),
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
}
