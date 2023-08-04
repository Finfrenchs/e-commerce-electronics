import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class PaymentMethodsWidget extends StatelessWidget {
  const PaymentMethodsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      margin: const EdgeInsets.only(
        top: 25,
        bottom: 20,
      ),
      decoration: const BoxDecoration(
        color: lightBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.payment_outlined,
                color: blueColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Payment Methods',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: black,
                ),
              ),
              const Spacer(),
              CustomButton(
                onTap: () {},
                name: 'Edit',
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'BCA Virtual Account',
            style: blackTextStyle.copyWith(
              fontWeight: bold,
            ),
          ),
        ],
      ),
    );
  }
}
