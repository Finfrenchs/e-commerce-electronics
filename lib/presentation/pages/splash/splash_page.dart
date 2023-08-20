import 'dart:async';

import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ///initstate adalah fuction yang akan di panggil pertama kali
  ///ketika splaspage di panggil
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      //call with route name
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const HomePage();
      }), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: Container(
          width: double.infinity,
          height: 600,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: lightBackgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lotties/paket.json',
                width: 200,
                height: 180,
                fit: BoxFit.cover,
              ),
              Text(
                'E-Commerce\nElectronic',
                textAlign: TextAlign.center,
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
