// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/widgets/box_icons.dart';

class DetailProfileWidget extends StatelessWidget {
  const DetailProfileWidget({
    Key? key,
    required this.icon,
    this.onTap,
    required this.title,
  }) : super(key: key);
  final String icon;
  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: greyColor.withOpacity(0.4), // Warna bayangan
              spreadRadius: 2, // Lebar bayangan
              blurRadius: 6, // Tingkat blur bayangan
              offset: const Offset(0, 2), // Offset bayangan (x, y)
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BoxIcon(
              icon: icon,
              iconColor: toscaColor,
              boxBackgroundColor: lightToscaColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: blackColor,
            ),
          ],
        ),
      ),
    );
  }
}
