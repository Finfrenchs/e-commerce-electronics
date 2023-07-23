import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/widgets/box_product.dart';
import 'package:flutter/material.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All Product",
              style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 16),
            ),
            const Spacer(),
            Text(
              "See all",
              style: greyTextStyle.copyWith(fontWeight: regular, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 10,
            childAspectRatio: 0.63,
          ),
          itemBuilder: (context, index) {
            return BoxProduct(
              imageProduct: GlobalVariables.categoryImageProducts[index]
                      ['image']
                  .toString(),
              name: GlobalVariables.categoryImageProducts[index]['name']
                  .toString(),
              description: GlobalVariables.categoryImageProducts[index]
                      ['description']
                  .toString(),
              price: GlobalVariables.categoryImageProducts[index]['price'],
            );
          },
          itemCount: GlobalVariables.categoryImageProducts.length,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
