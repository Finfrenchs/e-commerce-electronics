// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_electronics/bloc/checkout/checkout_bloc.dart';
import 'package:e_commerce_electronics/presentation/pages/cart/cart_page.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/widgets/buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomBarDetailWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  const CustomBottomBarDetailWidget({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.3), // shadow color
            spreadRadius: 5, // shadow width
            blurRadius: 6, // level shadow
            offset: const Offset(0, 2), // Offset shadow (x, y)
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
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    border: Border.all(
                      color: blueColor,
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: blueColor,
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: BlocListener<CheckoutBloc, CheckoutState>(
              listener: (context, state) {
                if (state is CheckoutLoaded) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const CartPage();
                  }));
                }
              },
              child: BlocBuilder<CheckoutBloc, CheckoutState>(
                  builder: (context, state) {
                if (state is CheckoutLoading) {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CustomFilledButton(
                  height: 40,
                  title: 'Buy Now',
                  onPressed: onPressed,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
