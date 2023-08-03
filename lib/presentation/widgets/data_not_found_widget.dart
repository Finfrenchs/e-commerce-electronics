import 'package:flutter/material.dart';

class DataNotfoundWidget extends StatelessWidget {
  const DataNotfoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 280,
        width: double.infinity,
        margin: const EdgeInsets.only(
          top: 100,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/img_data_empty.png',
            ),
          ),
        ),
        // child: ClipRRect(
        //   child: Lottie.asset(
        //     'assets/lotties/anim-notfound.json',
        //   ),
        // ),
      ),
    );
  }
}
