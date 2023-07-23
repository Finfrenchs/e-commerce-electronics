import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/pages/home/widgets/amount_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/home/widgets/banner_widget.dart';
import 'package:flutter/material.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 235,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: lightBackgroundColor,
      ),
      child: Stack(
        children: [
          const BannerWidget(),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 235,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: blackColor.withOpacity(0.3),
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AmountWidget(),
          ),
        ],
      ),
    );
  }
}
