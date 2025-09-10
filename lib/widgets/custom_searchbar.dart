import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internship_task/widgets/custom_border.dart';
import 'package:internship_task/widgets/filter_chips.dart';

class CustomSearchBar extends StatelessWidget {
  final double width;
  final double height;
  final double iconContainerWidth;
  final double iconContainerHeight;
  final double iconWidth;
  final double iconHeight;
  final String hintText;
  final double borderRadius;
  final Color containerColor;
  final bool showRightBorder;
  final String iconPath;
  final Function(String) onIconTap;

  const CustomSearchBar({
    super.key,
    required this.width,
    required this.height,
    required this.iconContainerWidth,
    required this.iconContainerHeight,
    required this.iconWidth,
    required this.iconHeight,
    this.hintText = "Search by clients",
    this.borderRadius = 10,
    this.containerColor = const Color(0x22BDBDBD),
    this.showRightBorder = true,
    this.iconPath = "assets/images/user.svg",
    required this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return BorderContainer(
      width: width,
     // height: height,
      radius: borderRadius,
      padding: 0.0,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              bottomLeft: Radius.circular(borderRadius),
            ),
            child: GestureDetector(
              onTap: () {
                if (!_controller.text.isEmpty)
                 onIconTap?.call(_controller.text);
              },
              child: Container(
                width: iconContainerWidth,
                height: height,
                decoration: BoxDecoration(
                  color: containerColor,
                  border: Border(
                    right: showRightBorder
                        ? BorderSide(color: Color(0x8EBDBDBD), width: 1.8)
                        : BorderSide.none,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconPath,
                    width: iconWidth,
                    height: iconHeight,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),

          Expanded(
            child: TextField(
              onSubmitted: (_){
                if (!_controller.text.isEmpty)
                  onIconTap?.call(_controller.text);
              },
              controller: _controller,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: "roboto",
                color: Color(0xFF000000),
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontFamily: "roboto",
                  color: Color(0xFF808080),
                ),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
