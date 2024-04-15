import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color? backGroundColor;
  final String? text;
  final Color? borderColor;
  final Color? textColor;
  final Function onPressed;
  final EdgeInsets? padding;
  final double? fontSize;
  final double? borderWidth;
  final Widget? child;
  final double? borderRadius;
  final IconData? icon;

  const ButtonWidget({
    super.key,
    this.backGroundColor,
    this.text,
    this.borderColor,
    this.textColor,
    required this.onPressed,
    this.padding,
    this.fontSize,
    this.borderWidth,
    this.icon,
    this.child,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          padding: padding ?? const EdgeInsets.all(16),
          backgroundColor: backGroundColor ?? Colors.blue,
          side: BorderSide(
            color: borderColor ?? Colors.black,
            width: borderWidth ?? 0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
        ),
        child: child);
  }
}
