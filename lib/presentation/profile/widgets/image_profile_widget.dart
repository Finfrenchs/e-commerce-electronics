// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_commerce_electronics/common/theme.dart';

class ImageProfileWidget extends StatelessWidget {
  final String name;
  const ImageProfileWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/img_profile.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          name,
          style: blackTextStyle.copyWith(
            fontWeight: black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
