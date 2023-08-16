// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/data/models/list_product_model.dart';
import 'package:e_commerce_electronics/presentation/pages/detail_product/widgets/level_bar_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/detail_product/widgets/rating_indicator_bar_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/detail_product/widgets/variant_color_product_widget.dart';

class ContainDetailWidget extends StatefulWidget {
  final Product product;
  const ContainDetailWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ContainDetailWidget> createState() => _ContainDetailWidgetState();
}

class _ContainDetailWidgetState extends State<ContainDetailWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.product.attributes!.name!,
                  maxLines: 3,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: Icon(
                  isFavorite != true
                      ? Icons.favorite_outline_outlined
                      : Icons.favorite_rounded,
                  color: isFavorite != true ? blackColor : redColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            formatCurrency(int.parse(widget.product.attributes!.price!)),
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const RatingIndicatorBarWidget(
            rating: 8,
            maxRating: 10,
            reviewsCount: 1240,
          ),
          const SizedBox(
            height: 10,
          ),
          const LevelBarWidget(
            soldCount: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          const VariantProductColorWidget(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
