// import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
// import 'package:e_commerce_bloc/presentation/search/search_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class TextSearchField extends StatelessWidget {
//    TextSearchField({super.key});
//   bool isSearchPage = false;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       child: TextField(
//         readOnly: isSearchPage,
//         onTap: () {
//           if (!isSearchPage) {
//             isSearchPage = true;
//             AppNavigator.push(context, SearchPage());
//           }
//         },
//         decoration: InputDecoration(
//           prefixIcon: SvgPicture.asset(
//             'assets/vectors/search.svg',
//             fit: BoxFit.none,
//           ),
//           hintText: 'Search',
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(50),
//               borderSide: BorderSide.none),
//           contentPadding: EdgeInsets.all(12),
//           focusedBorder:
//               OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
//         ),
//       ),
//     );
//   }
// }
