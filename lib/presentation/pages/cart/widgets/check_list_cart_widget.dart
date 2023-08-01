import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/pages/cart/widgets/custom_checkbox_widget.dart';
import 'package:e_commerce_electronics/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class CheckListCartWidget extends StatefulWidget {
  const CheckListCartWidget({
    super.key,
  });

  @override
  State<CheckListCartWidget> createState() => _CheckListCartWidgetState();
}

class _CheckListCartWidgetState extends State<CheckListCartWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: lightBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomCheckboxWidget(
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
              value: isChecked,
              title: 'Select All',
            ),
          ),
          const Spacer(),
          isChecked == true
              ? const CustomButton(
                  icon: Icons.delete_rounded,
                  name: 'Delete',
                )
              : Container(),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
