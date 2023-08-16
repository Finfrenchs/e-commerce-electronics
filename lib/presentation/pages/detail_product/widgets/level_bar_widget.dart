import 'package:e_commerce_electronics/common/theme.dart';
import 'package:flutter/material.dart';

class LevelBarWidget extends StatelessWidget {
  final int soldCount;
  const LevelBarWidget({
    Key? key,
    required this.soldCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          const LinearProgressIndicator(
            minHeight: 26,
            value: 0.55,
            valueColor: AlwaysStoppedAnimation(blueColor),
            backgroundColor: lightBlueColor,
          ),
          Positioned(
            top: 5,
            bottom: 5,
            left: 10,
            child: Text(
              '$soldCount Sold',
              style: whiteTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
