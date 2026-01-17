import 'dart:ui';

import 'package:flutter_application_5/core/resource/font_manager.dart';

class AppTextStyles {
  TextStyle _getTextStyle(
    double fontSize,
    String fontFamily,
    FontWeight fontWeight,
    Color color,
  ) {
    return TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: color);
  }

  TextStyle getLight300Style12({
    double fontSize = FontSize.s12,
    FontWeight fontWeight = FontWeightManager.light300,
    required Color color,
  }) {
    return _getTextStyle(fontSize, FontConstants.fontFamily, fontWeight, color);
  }
}
