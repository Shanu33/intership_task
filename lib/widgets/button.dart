import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double fontSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.iconPath,
    this.onPressed,
    required this.width,
    required this.height,
    this.backgroundColor = const Color(0xFFBDBDBD),
    this.textColor = Colors.black,
    this.borderRadius = 12,
    this.fontSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              iconPath,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: "roboto",
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
