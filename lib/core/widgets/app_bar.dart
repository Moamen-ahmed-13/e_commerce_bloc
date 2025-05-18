import 'package:e_commerce_bloc/core/widgets/buttons/back_button.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget ? title;
  final Widget ? action;
  final Color ? backgroundColor;
  final bool hideBack;
  final double ? height;
  const BasicAppbar({
    this.title,
    this.hideBack = false,
    this.action,
    this.backgroundColor ,
    this.height,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? 80 ,
      title: title ?? const Text(''),
      titleSpacing: 0,
      actions: [
        action ?? Container()
      ],
      leading: hideBack ? null : AppBackButton(),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(height ?? 80);
}