import 'package:flutter/material.dart';

class CustomButtonLayout extends StatelessWidget {
  const CustomButtonLayout({Key? key,
    this.borderColor = Colors.black,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.backgroundColor
  }) : super(key: key);
  final Color borderColor;
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor
      ),
      child: child,
    );
  }
}
