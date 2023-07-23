import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/widgets/box_category.dart';
import 'package:flutter/material.dart';

class ListCategory extends StatelessWidget {
  const ListCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemExtent: 75,
          itemCount: GlobalVariables.listCategory.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                BoxCategory(
                  image: GlobalVariables.listCategory[index]['image']!,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  GlobalVariables.listCategory[index]['name'].toString(),
                  style: blackTextStyle.copyWith(
                    fontWeight: regular,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 12,
                  ),
                )
              ],
            );
          }),
    );
  }
}
