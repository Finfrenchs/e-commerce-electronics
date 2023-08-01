import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class ShippingAddressWidget extends StatefulWidget {
  const ShippingAddressWidget({
    super.key,
  });

  @override
  State<ShippingAddressWidget> createState() => _ShippingAddressWidgetState();
}

class _ShippingAddressWidgetState extends State<ShippingAddressWidget> {
  bool _isFocused = false;
  final TextEditingController addressController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    addressController.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      margin: const EdgeInsets.only(
        top: 25,
      ),
      decoration: BoxDecoration(
        color: lightBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: blueColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Shipping Address',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: black,
                ),
              ),
              const Spacer(),
              CustomButton(
                onTap: () {},
                name: 'Edit',
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: addressController,
            focusNode: _focusNode,
            maxLines: 4,
            cursorColor: blueColor,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: blueColor),
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: _isFocused ? blueColor : greyColor),
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
