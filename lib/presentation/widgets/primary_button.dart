import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';

enum ButtonType {
  filled,
  outlined,
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ButtonType type;

  // Colors
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  final double height;
  final double borderRadius;
  final Widget? icon;

  const CustomButton({
    super.key,
    required this.text,
     this.onPressed,
    this.isLoading = false,
    this.type = ButtonType.filled,
    this.backgroundColor = const Color(0xFF5E17EB),
    this.borderColor = const Color(0xFF5E17EB),
    this.textColor = Colors.white,
    this.height = 56,
    this.borderRadius = 15,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: type == ButtonType.filled ? backgroundColor : ColorManager.transparent,
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
            : Row(mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.min,
            children: [
              if(icon !=null)...[
                icon!,const SizedBox(width: 8,)
              ],Text(text,style: TextStyle(
                color: textColor,fontSize: 16,
                fontWeight: FontWeight.bold
              ),)
            ],)
      ),
    );
  }
}
