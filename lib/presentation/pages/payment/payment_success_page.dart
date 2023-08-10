import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce_electronics/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class PaymentSuccessPage extends StatefulWidget {
  const PaymentSuccessPage({super.key});

  @override
  State<PaymentSuccessPage> createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {
  //memunculkan dialog ketika pertama buka
  @override
  void initState() {
    super.initState();
    //gunakan widgetsbinding agar dialog dapat berjalan dalam ini karena dialog berbentuk future sedangkan ini adalah void
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Payment Success',
        desc:
            'Thank you. The product has been successfully purchased by the seller and will send the item 1-3 days.',
        btnOkOnPress: () {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return const HomePage();
          }), (route) => false);
        },
      ).show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
