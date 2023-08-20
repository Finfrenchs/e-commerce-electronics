import 'package:e_commerce_electronics/common/theme.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      elevation: 6,
      splashColor: Colors.grey,
      child: Container(
        height: 180,
        width: 180,
        decoration:
            const BoxDecoration(color: blueColor, shape: BoxShape.circle),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/icons/ic_pay.png',
              width: 20,
              color: whiteColor,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Pay',
              style: whiteTextStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
