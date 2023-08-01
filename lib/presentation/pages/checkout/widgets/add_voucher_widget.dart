import 'package:e_commerce_electronics/common/theme.dart';
import 'package:flutter/material.dart';

class AddVoucherWidget extends StatelessWidget {
  const AddVoucherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 30,
      margin: const EdgeInsets.only(
        top: 25,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: lightBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Ads Voucher',
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
              color: blueColor,
            ),
          ),
        ],
      ),
    );
  }
}
