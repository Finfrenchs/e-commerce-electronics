// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_electronics/bloc/checkout/checkout_bloc.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/data/models/list_product_model.dart';
import 'package:e_commerce_electronics/presentation/pages/detail_product/widgets/contain_detail_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/detail_product/widgets/custom_bottom_bar_detail_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/detail_product/widgets/description_detail_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/detail_product/widgets/header_detail_widget.dart';
import 'package:e_commerce_electronics/presentation/widgets/custom_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailProductPage extends StatefulWidget {
  final Product product;
  const DetailProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: blackColor,
          ),
        ),
        title: Center(
          child: Text(
            widget.product.attributes!.name!,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: blackTextStyle.copyWith(
              fontWeight: bold,
              fontSize: 16,
            ),
          ),
        ),
        action: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
              color: blueColor,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          HeaderDetailWidget(
            product: widget.product,
          ),
          ContainDetailWidget(
            product: widget.product,
          ),
          DescriptionDetailWidget(
            product: widget.product,
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBarDetailWidget(
        onPressed: () {
          context.read<CheckoutBloc>().add(
                AddToChartEvent(product: widget.product),
              );
        },
      ),
    );
  }
}
