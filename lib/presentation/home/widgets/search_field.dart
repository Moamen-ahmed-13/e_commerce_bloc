import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/presentation/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'search',
      child: Card(
        elevation: 0,
        child: TextField(
          readOnly: true,
          onTap: () {
            AppNavigator.push(context, SearchPage());
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
      ),
    );
  }
}
