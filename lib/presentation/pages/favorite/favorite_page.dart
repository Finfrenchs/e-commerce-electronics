import 'package:e_commerce_electronics/presentation/pages/home/widgets/custom_bottom_appbar.dart';
import 'package:e_commerce_electronics/presentation/widgets/custom_fab.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    const int page = 1;

    return const Scaffold(
      body: Center(
        child: Text('Favorite Page Content'),
      ),
      bottomNavigationBar: CustomBottomAppbar(
        page: page,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActionButton(),
    );
  }
}
