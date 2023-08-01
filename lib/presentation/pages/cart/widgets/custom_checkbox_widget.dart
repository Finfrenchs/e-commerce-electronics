import 'package:e_commerce_electronics/common/theme.dart';
import 'package:flutter/material.dart';

class CustomCheckboxWidget extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;
  final String? title;
  const CustomCheckboxWidget({
    super.key,
    required this.value,
    required this.onChanged,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: blueColor,
        ),
        Text(
          title!,
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: bold,
          ),
        ),
      ],
    );
  }
}
