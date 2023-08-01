import 'package:e_commerce_electronics/common/theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final double? elevation;
  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.elevation = 0,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: lightBackgroundColor,
        ),
      ),
      elevation: elevation,
      leading: leading,
      title: title,
    );
  }
}
