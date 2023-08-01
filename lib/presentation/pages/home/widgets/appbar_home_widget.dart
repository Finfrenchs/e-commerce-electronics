import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/pages/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_electronics/bloc/checkout/checkout_bloc.dart';

class AppBarHomeWidget extends StatelessWidget {
  const AppBarHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 45,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 0,
              child: TextFormField(
                onFieldSubmitted: (_) {},
                decoration: InputDecoration(
                  prefixIcon: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                      ),
                      child: Icon(
                        Icons.search_rounded,
                        color: greyColor,
                        size: 23,
                      ),
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xffEFEFF1),
                  contentPadding: const EdgeInsets.only(top: 10),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xffEFEFF1),
                      width: 1,
                    ),
                  ),
                  hintText: 'Search ',
                  hintStyle: greyTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const CartPage();
                },
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: 2,
            ),
            child: BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                if (state is CheckoutLoaded) {
                  return badges.Badge(
                    badgeStyle: badges.BadgeStyle(
                      elevation: 0,
                      badgeColor: blueColor,
                      padding: const EdgeInsets.symmetric(
                        vertical: 1,
                        horizontal: 4,
                      ),
                    ),
                    badgeContent: Text(
                      '${state.items.length}',
                      style: whiteTextStyle.copyWith(
                        fontWeight: regular,
                      ),
                    ),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: blueColor,
                      size: 26,
                    ),
                  );
                }
                return badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                    elevation: 0,
                    badgeColor: blueColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 1,
                      horizontal: 4,
                    ),
                  ),
                  badgeContent: Text(
                    '0',
                    style: whiteTextStyle.copyWith(
                      fontWeight: regular,
                    ),
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: blueColor,
                    size: 26,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
