import 'package:e_commerce_electronics/common/theme.dart';
import 'package:flutter/material.dart';

class BoxCategory extends StatelessWidget {
  final String? image;
  const BoxCategory({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: greyColor,
          width: 1,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            image!,
            color: blueColor,
          ),
        ),
      ),
    );
  }
}
