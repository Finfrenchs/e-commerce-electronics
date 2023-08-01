import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/common/theme.dart';

import 'package:e_commerce_electronics/presentation/pages/cart/widgets/check_list_cart_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/cart/widgets/list_cart_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/checkout/checkout_page.dart';
import 'package:e_commerce_electronics/presentation/widgets/buttons.dart';
import 'package:e_commerce_electronics/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'My Cart',
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
      body: const Column(
        children: [
          CheckListCartWidget(),
          ListCartWidget(),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total (3 Items)', style: greyTextStyle),
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
      ),
    );
  }
}
