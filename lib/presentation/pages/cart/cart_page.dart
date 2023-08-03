import 'package:e_commerce_electronics/bloc/checkout/checkout_bloc.dart';
import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/data/datasources/auth_local_datasource.dart';
import 'package:e_commerce_electronics/presentation/pages/auth/login_page.dart';

import 'package:e_commerce_electronics/presentation/pages/cart/widgets/check_list_cart_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/cart/widgets/list_cart_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/checkout/checkout_page.dart';
import 'package:e_commerce_electronics/presentation/widgets/buttons.dart';
import 'package:e_commerce_electronics/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: const Icon(
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
                  BlocBuilder<CheckoutBloc, CheckoutState>(
                    builder: (context, state) {
                      if (state is CheckoutLoaded) {
                        return Text(
                          'Total (${state.items.length} Items)',
                          style: greyTextStyle,
                        );
                      }
                      return Text(
                        'Total (0 Items)',
                        style: greyTextStyle,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  BlocBuilder<CheckoutBloc, CheckoutState>(
                    builder: (context, state) {
                      if (state is CheckoutLoaded) {
                        final total = state.items.fold(
                          0,
                          (sum, item) =>
                              sum + int.parse(item.attributes!.price!),
                        );
                        return Text(
                          formatCurrency(
                            total,
                          ),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        );
                      }
                      return Text(
                        formatCurrency(
                          int.parse('0'),
                        ),
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              child: CustomFilledButton(
                height: 40,
                title: 'Checkout',
                onPressed: () async {
                  final isLogin = await AuthLocalDatasource().isLogin();
                  if (isLogin) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const CheckoutPage();
                        },
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginPage();
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
