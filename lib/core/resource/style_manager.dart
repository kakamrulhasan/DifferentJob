import 'package:flutter/material.dart';
import 'font_manager.dart'; // make sure this path is correct

class AppTextStyles {
  // Generic private method to create TextStyle
  static TextStyle _getTextStyle({
    double fontSize = FontSize.s12,
    FontWeight fontWeight = FontWeightManager.regural400,
    Color color = Colors.black,
    String fontFamily = FontConstants.fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
    );
  }

  // Example: Light 300, size 24
  static TextStyle getBold700Style24({required Color color}) {
    return _getTextStyle(
      fontSize: FontSize.s24,
      fontWeight: FontWeightManager.bold700,
      color: color,
    );
  }

  // Example: Regular 400, size 14
  static TextStyle getRegular400Style14({Color color = Colors.black}) {
    return _getTextStyle(
      fontSize: FontSize.s14,
      fontWeight: FontWeightManager.regural400,
      color: color,
    );
  }

  // Example: Medium 500, size 16
  static TextStyle getMedium500Style16({Color color = Colors.black}) {
    return _getTextStyle(
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.medium500,
      color: color,
    );
  }

  // Example: SemiBold 600, size 18
  static TextStyle getSemiBold600Style18({Color color = Colors.black}) {
    return _getTextStyle(
      fontSize: FontSize.s18,
      fontWeight: FontWeightManager.semiBold600,
      color: color,
    );
  }

  // Example: Bold 700, size 20
  static TextStyle getBold700Style20({Color color = Colors.black}) {
    return _getTextStyle(
      fontSize: FontSize.s20,
      fontWeight: FontWeightManager.bold700,
      color: color,
    );
  }
}
