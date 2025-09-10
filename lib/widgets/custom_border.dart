import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double? height;
  final bool keepHeight;
  final double padding;
  final double borderWidth;
  final double radius;
  final Color color;

  const BorderContainer({
    super.key,
    required this.child,
    this.borderWidth = 1.8,
    required this.width,
    this.height,
    this.padding = 8.0,
    this.radius = 10.0,
    this.color = Colors.white,
    this.keepHeight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: keepHeight ? height : null, // auto expand jab keepHeight=false
      decoration: BoxDecoration(
        color: const Color(0x8EBDBDBD),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Container(
        margin: EdgeInsets.all(borderWidth),
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius - 1.3),
        ),
        child: child,
      ),
    );
  }
}
