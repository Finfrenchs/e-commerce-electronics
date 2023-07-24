import 'package:e_commerce_electronics/bloc/checkout/checkout_bloc.dart';
import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/pages/home/widgets/ads_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/home/widgets/all_product_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/home/widgets/list_category.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: lightBackgroundColor,
            ),
          ),
          elevation: 0,
          title: Row(
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
                onTap: () {},
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
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        children: const [
          SizedBox(
            height: 10,
          ),
          AdsWidget(),
          ListCategory(),
          AllProduct(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 1,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 1,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 12,
            fontWeight: medium,
          ),
          unselectedLabelStyle: greyTextStyle.copyWith(
            fontSize: 12,
            fontWeight: medium,
          ),
          currentIndex: 0,
          selectedItemColor: blueColor,
          unselectedItemColor: greyColor,
          backgroundColor: whiteColor,
          iconSize: 25,
          onTap: (index) {},
          items: [
            // HOME
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            // FAVORITE
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline_outlined,
              ),
              label: 'Favorite',
            ),
            //PAY BARCODE
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/ic_pay.png',
                width: 26,
                color: _page == 2 ? blueColor : greyColor,
              ),
              label: 'Pay',
            ),
            // NOTIFICATION
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_none_rounded,
              ),
              label: 'Notifications',
            ),
            // ACCOUNT
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
