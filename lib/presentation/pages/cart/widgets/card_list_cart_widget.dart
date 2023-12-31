import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class CardListCartWidget extends StatelessWidget {
  final bool? value;
  final Function(bool?)? onChanged;
  final String? image;
  final String? name;
  final String? description;
  final String? price;
  final String? count;
  final VoidCallback? onTapRemove;
  final VoidCallback? onTapAdd;

  const CardListCartWidget({
    super.key,
    this.value,
    this.onChanged,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.count,
    this.onTapAdd,
    this.onTapRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: blueColor,
      color: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: double.infinity,
        height: 120,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: blueColor,
            ),
            Hero(
              tag: image!,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 220,
                  height: 20,
                  child: Text(
                    //'${name!.length >= 26 ? name!.substring(0, 26) : name!}...',
                    name!,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: 220,
                  height: 20,
                  child: Text(
                    //'${description!.length >= 26 ? description!.substring(0, 26) : description!}...',
                    description!,
                    style: greyTextStyle.copyWith(
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formatCurrency(
                          int.parse(price!),
                        ),
                        style: blackTextStyle.copyWith(
                          fontWeight: black,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButtonCount(
                            height: 30,
                            width: 30,
                            onTap: onTapRemove,
                            icon: Icons.remove,
                            shape: BoxShape.rectangle,
                            iconColor: blueColor,
                            backgroundColor: greyColor.withOpacity(0.5),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 30,
                            width: 25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 1,
                                  color: greyColor,
                                )),
                            child: Text(
                              '$count',
                              style: blackTextStyle.copyWith(
                                fontWeight: bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          CustomButtonCount(
                            height: 30,
                            width: 30,
                            onTap: onTapAdd,
                            icon: Icons.add,
                            shape: BoxShape.rectangle,
                            iconColor: blueColor,
                            backgroundColor: greyColor.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
