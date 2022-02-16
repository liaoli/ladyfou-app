/*
 * @Descripttion: TODO
 * @FileName: shop_gradient_button
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/16/22 5:03 PM
 * @LastEditors: tang
 */


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../style/Color.dart';
import '../../../style/text.dart';

class GradientButton extends StatefulWidget {
  GradientButton(
      {Key? key,
        this.begin = Alignment.centerLeft,
        this.end =  Alignment.centerRight,
        this.onTap,
        this.child,
        this.colors = const [AppColors.gradientColorStart, AppColors.gradientColorEnd],
        this.width = 343,
        this.height = 28,
        this.fontWeight = FontWeight.w400,
        this.fontSize = 12.0,
        this.borderRadius = 20,
        this.text = ''})
      : super(key: key);
  Widget? child;
  List<Color> colors;
  FontWeight fontWeight;
  AlignmentGeometry begin;
  AlignmentGeometry end;
  double width;
  double height;
  double borderRadius;
  String text;
  double fontSize;
  Function()? onTap;

  @override
  _MineButtonState createState() => _MineButtonState();
}

class _MineButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: widget.colors,
            begin: widget.begin,
            end: widget.end,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: widget.child ==  null ? SizedBox() : widget.child,
            ),
            Text(
              widget.text,
              textAlign: TextAlign.center,
              style: BaseText.style(
                  fontSize: widget.fontSize,
                  color: Colors.white,
                  fontWeight: widget.fontWeight),
            ),
          ],
        ),
      ),
    );
  }
}