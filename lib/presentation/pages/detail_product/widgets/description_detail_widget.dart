// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/data/models/list_product_model.dart';

class DescriptionDetailWidget extends StatelessWidget {
  final Product product;
  const DescriptionDetailWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description Product',
            style: blackTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            product.attributes!.description!,
            style: greyTextStyle,
          ),
        ],
      ),
    );
  }
}
