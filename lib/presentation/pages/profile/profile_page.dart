import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/data/datasources/auth_local_datasource.dart';
import 'package:e_commerce_electronics/data/models/auth_response_model.dart';
import 'package:e_commerce_electronics/presentation/pages/auth/login_page.dart';
import 'package:e_commerce_electronics/presentation/pages/home/widgets/custom_bottom_appbar.dart';
import 'package:e_commerce_electronics/presentation/pages/order/list_order_page.dart';
import 'package:e_commerce_electronics/presentation/pages/profile/widgets/balance_profile_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/profile/widgets/detail_profile_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/profile/widgets/image_profile_widget.dart';
import 'package:e_commerce_electronics/presentation/widgets/custom_appbar.dart';
import 'package:e_commerce_electronics/presentation/widgets/custom_fab.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int page = 3;
  User? user;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future<void> getUser() async {
    user = await AuthLocalDatasource().getUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: CustomAppBar(
        leading: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.menu_outlined,
            color: blueColor,
            size: 23,
          ),
        ),
        title: Text(
          'My Profile',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
        action: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: blueColor,
              size: 23,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.chat_outlined,
              color: blueColor,
              size: 23,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ImageProfileWidget(
            name: user != null ? user!.username : '-',
          ),
          const BalanceProfileWidget(),
          const SizedBox(
            height: 25,
          ),
          DetailProfileWidget(
            icon: 'assets/icons/ic_user.png',
            title: 'My Profile',
            onTap: () {},
          ),
          DetailProfileWidget(
            icon: 'assets/icons/ic_location.png',
            title: 'My Address',
            onTap: () {},
          ),
          DetailProfileWidget(
            icon: 'assets/icons/ic_notification.png',
            title: 'Notification',
            onTap: () {},
          ),
          DetailProfileWidget(
            icon: 'assets/icons/ic_help.png',
            title: 'Help Center',
            onTap: () {},
          ),
          DetailProfileWidget(
            icon: 'assets/icons/ic_order_list.png',
            title: 'Order List',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ListOrderPage();
              }));
            },
          ),
          DetailProfileWidget(
            icon: 'assets/icons/ic_logout.png',
            title: 'Logout',
            onTap: () async {
              await AuthLocalDatasource().removeAuthData();
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                return const LoginPage();
              }), (route) => false);
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomAppbar(
        page: page,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
