import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/pages/favorite/favorite_page.dart';
import 'package:e_commerce_electronics/presentation/pages/home/home_page.dart';
import 'package:e_commerce_electronics/presentation/pages/notification/notifications_page.dart';
import 'package:e_commerce_electronics/presentation/pages/profile/profile_page.dart';

import 'package:flutter/material.dart';

class CustomBottomAppbar extends StatefulWidget {
  const CustomBottomAppbar({
    super.key,
    required int page,
  }) : _page = page;

  final int _page;

  @override
  State<CustomBottomAppbar> createState() => _CustomBottomAppbarState();
}

class _CustomBottomAppbarState extends State<CustomBottomAppbar> {
  int _currentPage = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const FavoritePage(),
    const NotificationPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    _currentPage = widget._page;
    super.initState();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _navigateToPage(int pageIndex) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => _pages[pageIndex],
        ),
        (route) => false);
  }

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
        selectedLabelStyle: blueTextStyle.copyWith(
          fontSize: 12,
          fontWeight: medium,
        ),
        unselectedLabelStyle: greyTextStyle.copyWith(
          fontSize: 12,
          fontWeight: medium,
        ),
        currentIndex: _currentPage,
        selectedItemColor: blueColor,
        unselectedItemColor: greyColor,
        backgroundColor: whiteColor,
        iconSize: 24,
        onTap: (int index) {
          _onPageChanged(index);

          // Navigasi ke halaman yang sesuai
          _navigateToPage(index);
        },
        items: const [
          // HOME
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          // FAVORITE
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline_outlined,
            ),
            label: 'Favorite',
          ),
          // NOTIFICATION
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none_rounded,
            ),
            label: 'Notifications',
          ),
          // ACCOUNT
          BottomNavigationBarItem(
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
