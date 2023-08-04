import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/pages/home/widgets/ads_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/home/widgets/list_product_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/home/widgets/appbar_home_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/home/widgets/custom_bottom_appbar.dart';
import 'package:e_commerce_electronics/presentation/pages/home/widgets/list_category.dart';
import 'package:e_commerce_electronics/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: const CustomAppBar(
        title: AppBarHomeWidget(),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        children: const [
          SizedBox(
            height: 25,
          ),
          AdsWidget(),
          ListCategory(),
          ListProduct(),
        ],
      ),
      bottomNavigationBar: CustomBottomAppbar(
        page: page,
      ),
    );
  }
}
