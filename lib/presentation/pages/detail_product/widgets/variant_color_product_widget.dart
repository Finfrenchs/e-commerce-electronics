import 'package:e_commerce_electronics/common/theme.dart';
import 'package:flutter/material.dart';

class VariantColor {
  final String name;
  final Color color;

  VariantColor(this.name, this.color);
}

class VariantProductColorWidget extends StatefulWidget {
  const VariantProductColorWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<VariantProductColorWidget> createState() =>
      _VariantProductColorWidgetState();
}

class _VariantProductColorWidgetState extends State<VariantProductColorWidget> {
  int? isSelectedIndex;
  @override
  Widget build(BuildContext context) {
    final List<VariantColor> variantColor = [
      VariantColor('Red', Colors.red),
      VariantColor('Blue', Colors.blue),
      VariantColor('Green', Colors.green),
      VariantColor('Yellow', Colors.yellow),
      VariantColor('Purple', Colors.purple),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Variant Color',
          style: blackTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: variantColor.length,
              itemBuilder: (context, index) {
                final data = variantColor[index];
                return InkWell(
                  onTap: () {
                    // Lakukan sesuatu ketika item dipilih
                    setState(() {
                      isSelectedIndex = index;
                    });
                    print('Selected ${data.name}');
                  },
                  child: Container(
                    width: 40,
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      //shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 3,
                        color: isSelectedIndex != index
                            ? Colors.transparent
                            : lightBlueColor,
                      ),
                      color: data.color,
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
