import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 20,
      ),
      child: IconButton(
        color: Colors.white,
        style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(AppColors.secondBackground)),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          size: 18,
        ),
      ),
    );
  }
}
