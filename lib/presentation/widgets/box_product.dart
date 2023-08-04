import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class BoxProduct extends StatelessWidget {
  final String? imageProduct;
  final String? name;
  final String? description;
  final String? price;
  final String? count;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onTapFavorite;
  final VoidCallback? onTapRemove;
  final VoidCallback? onTapAdd;
  const BoxProduct({
    super.key,
    required this.imageProduct,
    required this.name,
    required this.description,
    required this.price,
    required this.count,
    required this.icon,
    required this.iconColor,
    this.onTapFavorite,
    this.onTapAdd,
    this.onTapRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.3), // Warna bayangan
            spreadRadius: 5, // Lebar bayangan
            blurRadius: 6, // Tingkat blur bayangan
            offset: const Offset(0, 4), // Offset bayangan (x, y)
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: imageProduct!,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        imageProduct!,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: InkWell(
                  onTap: onTapFavorite,
                  child: Icon(
                    icon,
                    size: 25,
                    color: iconColor,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  maxLines: 2,
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  description!,
                  maxLines: 2,
                  style: greyTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    formatCurrency(
                      int.parse(price!),
                    ),
                    style: blackTextStyle.copyWith(
                      fontWeight: black,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  // CustomButtonCount(
                  //   onTap: onTapRemove,
                  //   icon: Icons.remove,
                  // ),
                  // const SizedBox(
                  //   width: 4,
                  // ),
                  // Text(
                  //   '$count',
                  //   style: blackTextStyle.copyWith(
                  //     fontWeight: regular,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   width: 4,
                  // ),
                  CustomButtonCount(
                    height: 40,
                    width: 40,
                    onTap: onTapAdd,
                    icon: Icons.add,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
