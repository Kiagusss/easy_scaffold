import 'package:easy_scaffold/src/base_color.dart';
import 'package:easy_scaffold/src/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String label;
  final double? labelFontSize;
  final String? hint;
  final TextEditingController? textEditingController;
  final bool obscureText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final bool isWithLabel;
  final bool isRequired;
  final Function(String?)? onChanged;
  final Function(String?)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final FocusNode? focusNode;
  final bool isError;
  final String? errorText;
  final int? limit;
  final bool onlyBottom;
  final BorderRadius? radius;
  final Color? borderColor;
  final TextStyle? style;
  final EdgeInsets? padding;
  final int? maxLines;

  const TextFormFieldWidget({
    super.key,
    required this.label,
    this.labelFontSize,
    this.textEditingController,
    this.hint,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
    this.suffix,
    this.focusNode,
    this.isWithLabel = true,
    this.isRequired = false,
    this.prefix,
    this.onChanged,
    this.onFieldSubmitted,
    this.inputFormatters = const <TextInputFormatter>[],
    this.readOnly = false,
    this.isError = false,
    this.errorText,
    this.limit,
    this.onlyBottom = false,
    this.radius,
    this.borderColor,
    this.style,
    this.padding,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isWithLabel
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: label,
                    fontSize: labelFontSize ?? 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(height: 7),
                ],
              )
            : Container(),
        TextFormField(
          controller: textEditingController,
          inputFormatters: inputFormatters,
          keyboardType: textInputType,
          obscureText: obscureText,
          readOnly: readOnly,
          maxLines: maxLines,
          maxLength: limit,
          validator: isRequired
              ? (String? value) {
                  return (value == null || value.isEmpty)
                      ? "$label ${'Input Cannot Be Empty'}"
                      : null;
                }
              : null,
          focusNode: focusNode,
          style: style ?? GoogleFonts.mulish(color: colorTextPrimary),
          decoration: onlyBottom
              ? InputDecoration(
                  contentPadding:
                      padding ?? const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  hintText: hint ?? label,
                  suffixIcon: suffixIcon,
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: colorLightTextSecondary),
                  ),
                  prefix: prefix,
                  suffix: suffix,
                  errorText: isError ? errorText : null,
                )
              : InputDecoration(
                  contentPadding:
                      padding ?? const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  hintText: hint ?? label,
                  hintStyle: GoogleFonts.mulish(
                      color: colorTextPrimary.withOpacity(0.5)),
                  fillColor: colorGrey.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius:
                        radius ?? const BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(color: colorTextPrimary),
                  ),
                  suffixIcon: suffixIcon,
                  suffixIconColor: colorLightTextSecondary,
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        radius ?? const BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: borderColor ??
                          (readOnly ? Colors.grey : colorLightTextSecondary),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        radius ?? const BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color:
                          borderColor ?? (readOnly ? Colors.grey : colorGrey),
                    ),
                  ),
                  prefix: prefix,
                  suffix: suffix,
                  errorText: isError ? errorText : null,
                ),
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
