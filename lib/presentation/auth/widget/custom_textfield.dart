import 'package:flutter/material.dart';

import '../../../core/constansts/color_manager.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;

  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;

  final int maxLines;
  final double minHeight;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.enabledBorderColor = ColorManager.black12,
    this.focusedBorderColor = ColorManager.primary,
    this.errorBorderColor = Colors.red,
    this.maxLines = 1,
    this.minHeight = 56,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: minHeight),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        textAlignVertical: TextAlignVertical.top,
        textInputAction: maxLines > 1
            ? TextInputAction.newline
            : TextInputAction.next,
        cursorColor: ColorManager.black,
        style: const TextStyle(color: ColorManager.black, fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: ColorManager.transparent,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 16,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: enabledBorderColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: focusedBorderColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: errorBorderColor, width: 1),
          ),
        ),
      ),
    );
  }
}
