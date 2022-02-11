import 'package:flutter/material.dart';
import 'package:ladyfou/style/Color.dart';

TextStyle myTextStyle(
    {Color color = AppColors.black,
    double fontSize = 15,
    double? height = null,
    FontWeight fontWeight = FontWeight.w500,
    String fontFamily = "Seravek"}) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      fontFamily: fontFamily);
}
