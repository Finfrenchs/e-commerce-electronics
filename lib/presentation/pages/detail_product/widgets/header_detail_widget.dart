// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_commerce_electronics/data/models/list_product_model.dart';

class HeaderDetailWidget extends StatelessWidget {
  final Product product;
  const HeaderDetailWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 410,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            product.attributes!.picture!,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
