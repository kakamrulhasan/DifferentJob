import 'dart:ui';

import 'package:flutter_application_5/core/resource/font_manager.dart';

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

TextStyle getBoldStyle16({
  double fontSize = FontSize.s16,

  FontWeight fontWeight = FontWeightManager.bold,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, fontWeight, color);
}
