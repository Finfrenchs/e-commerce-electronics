import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce_electronics/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class PaymentFailedPage extends StatefulWidget {
  const PaymentFailedPage({super.key});

  @override
  State<PaymentFailedPage> createState() => _PaymentFailedPageState();
}

class _PaymentFailedPageState extends State<PaymentFailedPage> {
  //memunculkan dialog ketika pertama buka
  @override
  void initState() {
    super.initState();
    //gunakan widgetsbinding agar dialog dapat berjalan dalam ini karena dialog berbentuk future sedangkan ini adalah void
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Payment Failed',
        desc: 'Sorry. Your purchased is failed. Please, try again.',
        btnOkColor: Colors.red,
        btnOkText: 'Close',
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
