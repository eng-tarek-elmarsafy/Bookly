import 'package:flutter/material.dart';
import '../styles.dart';

class CustomButton extends StatelessWidget {
  final double? textSize;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final String text;
  final Color textColor;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    this.textSize,
    required this.backgroundColor,
    required this.borderRadius,
    required this.text,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: textColor,
            fontWeight: FontWeight.w900,
            fontSize: textSize,
          ),
        ),
      ),
    );
  }
}
