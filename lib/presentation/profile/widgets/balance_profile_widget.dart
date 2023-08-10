import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/widgets/box_icons.dart';
import 'package:e_commerce_electronics/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class BalanceProfileWidget extends StatelessWidget {
  const BalanceProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.4), // Warna bayangan
            spreadRadius: 5, // Lebar bayangan
            blurRadius: 7, // Tingkat blur bayangan
            offset: const Offset(0, 3), // Offset bayangan (x, y)
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BoxIcon(
                  icon: 'assets/icons/ic_wallet.png',
                  iconColor: blueColor,
                  boxBackgroundColor: lightBlueColor,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rp. 5000',
                      style: blackTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Balance',
                      style: greyTextStyle.copyWith(
                        fontWeight: regular,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Expanded(
              child: CustomFilledButton(
                title: 'Top Up',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
