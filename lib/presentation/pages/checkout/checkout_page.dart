import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/pages/checkout/widgets/add_voucher_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/checkout/widgets/delivery_service_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/checkout/widgets/list_checkout_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/checkout/widgets/payment_methods_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/checkout/widgets/shipping_address_widget.dart';
import 'package:e_commerce_electronics/presentation/widgets/buttons.dart';
import 'package:e_commerce_electronics/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: CustomAppBar(
        title: Text(
          'Checkout',
          textAlign: TextAlign.center,
          style: blackTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 16,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: blackColor,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        children: [
          const ListCheckoutWidget(),
          const ShippingAddressWidget(),
          const DeliveryServiceWidget(),
          Divider(
            thickness: 1,
            color: greyColor,
          ),
          const PaymentMethodsWidget(),
          Divider(
            thickness: 1,
            color: greyColor,
          ),
          const AddVoucherWidget(),
          Divider(
            thickness: 1,
            color: greyColor,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 110,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: greyColor.withOpacity(0.3), // Warna bayangan
              spreadRadius: 5, // Lebar bayangan
              blurRadius: 6, // Tingkat blur bayangan
              offset: const Offset(0, 2), // Offset bayangan (x, y)
            )
          ],
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sub total Price',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  formatCurrency(
                    int.parse('2000000'),
                  ),
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Total', style: greyTextStyle),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        formatCurrency(
                          int.parse('2000000'),
                        ),
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: CustomFilledButton(
                    height: 40,
                    title: 'Buy Now',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CheckoutPage();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
