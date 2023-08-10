import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/pages/home/home_page.dart';
import 'package:e_commerce_electronics/presentation/profile/profile_page.dart';
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
        showSelectedLabels: false,
        showUnselectedLabels: false,
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
        selectedFontSize: 0,
        unselectedFontSize: 0,
        backgroundColor: whiteColor,
        iconSize: 24,
        onTap: (index) {},
        items: [
          // HOME
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomePage();
                    },
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: _page == 0 ? blueColor : greyColor,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Home',
                    style: _page == 0
                        ? blueTextStyle.copyWith(
                            fontSize: 12,
                          )
                        : greyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                  ),
                ],
              ),
            ),
            label: 'Home',
          ),
          // FAVORITE
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.favorite_outline_outlined,
                  color: _page == 1 ? blueColor : greyColor,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Favorite',
                  style: _page == 1
                      ? blueTextStyle.copyWith(
                          fontSize: 12,
                        )
                      : greyTextStyle.copyWith(
                          fontSize: 12,
                        ),
                ),
              ],
            ),
            label: 'Favorite',
          ),
          //PAY BARCODE
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icons/ic_pay.png',
                  width: 26,
                  color: _page == 2 ? blueColor : greyColor,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Pay',
                  style: _page == 2
                      ? blueTextStyle.copyWith(
                          fontSize: 12,
                        )
                      : greyTextStyle.copyWith(
                          fontSize: 12,
                        ),
                ),
              ],
            ),
            label: 'Pay',
          ),
          // NOTIFICATION
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.notifications_none_rounded,
                  color: _page == 3 ? blueColor : greyColor,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Notification',
                  style: _page == 3
                      ? blueTextStyle.copyWith(
                          fontSize: 12,
                        )
                      : greyTextStyle.copyWith(
                          fontSize: 12,
                        ),
                ),
              ],
            ),
            label: 'Notifications',
          ),
          // ACCOUNT
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ProfilePage();
                    },
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    color: _page == 4 ? blueColor : greyColor,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Profile',
                    style: _page == 4
                        ? blueTextStyle.copyWith(
                            fontSize: 12,
                          )
                        : greyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                  ),
                ],
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
