import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 60.0),
        child: Hero(
          tag: 'search',
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            child: TextField(
              onTap: () {},
              autofocus: true,
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
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
