import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/common/theme.dart';
import 'package:flutter/material.dart';

class ListCheckoutWidget extends StatelessWidget {
  const ListCheckoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: lightBackgroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: 'tv-hisense.jpg',
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('assets/images/tv-hisense.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 220,
                height: 20,
                child: Text(
                  //'${name!.length >= 26 ? name!.substring(0, 26) : name!}...',
                  'Hisense',
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
                height: 40,
                child: Text(
                  //'${description!.length >= 26 ? description!.substring(0, 26) : description!}...',
                  'In culpa ad amet et consectetur occaecat velit dolor commodo.',
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
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
                        int.parse('200000'),
                      ),
                      style: blackTextStyle.copyWith(
                        fontWeight: black,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'x2',
                      style: blackTextStyle.copyWith(
                        fontWeight: regular,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
