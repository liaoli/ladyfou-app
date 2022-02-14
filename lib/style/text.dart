import 'package:flutter/material.dart';
import 'package:ladyfou/core/constant/constant.dart';
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


class BaseText {
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? height;
  final Color? color;
  final TextDecoration? decoration;
  final Color? decorationColor;

  const BaseText(
      {this.color,
        this.fontSize,
        this.fontWeight,
        this.height,
        this.fontFamily,
        this.decoration,
        this.decorationColor});

  static style(
      {double? fontSize,
        FontWeight? fontWeight,
        Color? color,
        String? fontFamily,
        double? height,
        TextDecoration? decoration,
        Color? decorationColor}) {
    fontFamily = fontFamily == null || fontFamily.length == 0
        ? fontFamily = pingfang
        : fontFamily;
    fontWeight = fontWeight == null ? FontWeight.normal : fontWeight;
    fontSize = fontSize == null ? 1.0 : fontSize;
    color = color == null ? AppColors.primaryBlackText : color;
    height = height == null ? null : height;
    decoration = decoration == null ? TextDecoration.none : decoration;
    decorationColor = decorationColor == null ? null : decorationColor;

    return TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
        height: height,
        decoration: decoration,
        decorationColor: decorationColor);
  }
}
