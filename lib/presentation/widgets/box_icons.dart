import 'package:flutter/material.dart';

class BoxIcon extends StatelessWidget {
  final String? icon;
  final Color? iconColor;
  final Color? boxBackgroundColor;
  const BoxIcon({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.boxBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: boxBackgroundColor!,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        icon!,
        color: iconColor!,
      ),
    );
  }
}
