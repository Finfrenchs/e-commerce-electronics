import 'package:e_commerce_electronics/common/theme.dart';
import 'package:flutter/material.dart';

class CustomBottomAppbar extends StatelessWidget {
  const CustomBottomAppbar({
    super.key,
    required int page,
  }) : _page = page;

  final int _page;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
    );
  }
}
