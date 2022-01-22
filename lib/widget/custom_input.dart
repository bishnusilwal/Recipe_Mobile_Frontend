import 'package:flutter/material.dart';

import 'colors.dart';

class CustomInputBox extends StatelessWidget {
  final String? title, hint;
  final String? error;
  final IconData icon;
  final IconData? suffixIcon;
  final bool? isInvisible, hasError;
  final TextEditingController controller;

  const CustomInputBox({
    Key? key,
    required this.size,
    this.width,
    this.onTap,
    this.radius,
    this.hint,
    required this.icon,
    this.suffixIcon,
    this.isInvisible = false,
    required this.controller,
    this.error,
    this.title,
    this.hasError,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);
  final Size size;
  final double? width, radius;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.black,
              ),
              child: TextFormField(
                controller: controller,
                keyboardType: keyboardType,
                obscureText: isInvisible!,
                maxLines: keyboardType == TextInputType.multiline ? 5 : 1,
                decoration: InputDecoration(
                  prefixIcon: Icon(icon),
                  suffixIcon: Icon(suffixIcon),
                  hintText: hint!,
                  errorText: hasError == true ? error : null,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
