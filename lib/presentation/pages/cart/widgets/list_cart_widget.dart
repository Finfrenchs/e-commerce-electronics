import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/presentation/pages/cart/widgets/card_list_cart_widget.dart';
import 'package:flutter/material.dart';

class ListCartWidget extends StatefulWidget {
  const ListCartWidget({super.key});

  @override
  State<ListCartWidget> createState() => _ListCartWidgetState();
}

class _ListCartWidgetState extends State<ListCartWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(10),
        itemCount: GlobalVariables.categoryImageProducts.length,
        itemBuilder: (context, index) {
          return CardListCartWidget(
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
            image: GlobalVariables.categoryImageProducts[index]['image'],
            name: GlobalVariables.categoryImageProducts[index]['name'],
            description: GlobalVariables.categoryImageProducts[index]
                ['description'],
            price: GlobalVariables.categoryImageProducts[index]['price'],
            count: '0',
          );
        },
      ),
    );
  }
}
