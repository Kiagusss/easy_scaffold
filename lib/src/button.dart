import 'package:flutter/material.dart';

class ButtonWiget extends StatelessWidget {
  final Color? backGroundColor;
  final String? text;
  final Color? borderColor;
  final Color? textColor;
  final Function? onPressed;
  final EdgeInsets? padding;
  final double? fontSize;
  final double? borderWidth;
  final IconData? icon;
  const ButtonWiget({
    super.key,
    this.backGroundColor,
    this.text,
    this.borderColor,
    this.textColor,
    this.onPressed,
    this.padding,
    this.fontSize,
    this.borderWidth,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed;
      },
      style: ElevatedButton.styleFrom(
          padding: padding ?? const EdgeInsets.all(16),
          backgroundColor: backGroundColor ?? Colors.blue,
          side: BorderSide(
            color: borderColor ?? Colors.black,
            width: borderWidth ?? 0,
          )),
      child: icon != null
          ? Icon(icon)
          : Text(
              text ?? "none",
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: fontSize ?? 20,
              ),
            ),
    );
  }
}
