import 'package:e_commerce_bloc/presentation/home/widgets/category_section.dart';
import 'package:e_commerce_bloc/presentation/home/widgets/header.dart';
import 'package:e_commerce_bloc/presentation/home/widgets/search_field.dart';
import 'package:e_commerce_bloc/presentation/home/widgets/top_selling.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            SizedBox(height: 20),
            SearchField(),
            SizedBox(height: 20),
            CategorySection(),
            SizedBox(height: 20),
            TopSelling(),
          ],
        ),
      ),
    );
  }
}
