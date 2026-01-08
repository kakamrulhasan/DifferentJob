import 'package:flutter/material.dart';

enum ButtonType {
  filled,
  outlined,
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final ButtonType type;

  // Colors
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  final double height;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.type = ButtonType.filled,
    this.backgroundColor = const Color(0xFF5E17EB),
    this.borderColor = const Color(0xFF5E17EB),
    this.textColor = Colors.white,
    this.height = 56,
    this.borderRadius = 15,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: type == ButtonType.filled ? backgroundColor : Colors.transparent,
          foregroundColor: textColor,
          side: type == ButtonType.outlined ? BorderSide(color: borderColor, width: 2) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: textColor,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
