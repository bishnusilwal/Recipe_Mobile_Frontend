import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Function onTap;
  final Color? buttonColor, textColor;
  final double? width;

  const CustomButton({
    Key? key,
    this.title,
    required this.onTap,
    this.buttonColor,
    this.textColor,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 15.0,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: buttonColor,
        ),
        child: Text(
          title!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
