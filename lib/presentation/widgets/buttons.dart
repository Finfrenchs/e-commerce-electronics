import 'package:flutter/material.dart';
import 'package:e_commerce_electronics/common/theme.dart';

class CustomFilledButton extends StatelessWidget {
  //make parameter widget for implement to ui
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const CustomFilledButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56),
          ),
        ),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}

class CustomTextWidgetButton extends StatelessWidget {
  //make parameter widget for implement to ui
  final String title;
  final double width;
  final double height;

  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  const CustomTextWidgetButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    this.height = 24,
    this.textStyle,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}

class CustomButtonCount extends StatelessWidget {
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final IconData icon;

  const CustomButtonCount({
    super.key,
    this.onTap,
    this.height = 20,
    this.width = 20,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: blueColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            size: 16,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback? onTap;
  final IconData? icon;
  const CustomButton({
    super.key,
    required this.name,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: blueColor,
              size: 20,
            ),
            Text(
              name,
              style: TextStyle(
                  color: blueColor, fontSize: 14, fontWeight: regular),
            ),
          ],
        ),
      ),
    );
  }
}
