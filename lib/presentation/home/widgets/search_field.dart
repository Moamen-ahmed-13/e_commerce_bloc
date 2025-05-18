import 'package:e_commerce_bloc/common/bloc/product/product_cubit.dart';
import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/presentation/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
final bool isSearchPage;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const SearchField({
    Key? key,
    this.isSearchPage = false,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: TextField(
        controller: controller,
        onChanged: (value) {
          if (value.isEmpty) {
            context.read<ProductCubit>().displayInitial();
          } else {
            context.read<ProductCubit>().fetchProducts(params: value);
          }

        },
        readOnly: !isSearchPage,
        onTap: () {
          if (!isSearchPage) {
            AppNavigator.push(context, SearchPage());
          }
        },
        decoration: InputDecoration(
          prefixIcon: SvgPicture.asset(
            'assets/vectors/search.svg',
            fit: BoxFit.none,
          ),
          hintText: 'Search',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none),
          contentPadding: EdgeInsets.all(12),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}
