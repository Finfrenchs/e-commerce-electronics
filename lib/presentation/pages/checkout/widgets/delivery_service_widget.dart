import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class DeliveryServiceWidget extends StatelessWidget {
  const DeliveryServiceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      margin: const EdgeInsets.only(
        top: 25,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: lightBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.local_shipping_outlined,
                color: blueColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Delivery Service',
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
            'JNT Express Reguler (2-4 hari)',
            style: blackTextStyle.copyWith(
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            formatCurrency(
              int.parse('10000'),
            ),
            style: greyTextStyle.copyWith(
              fontWeight: bold,
            ),
          )
        ],
      ),
    );
  }
}
