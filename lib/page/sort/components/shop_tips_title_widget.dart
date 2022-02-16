/*
 * @Descripttion: TODO
 * @FileName: shop_tips_title_widget
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/16/22 10:38 AM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../style/text.dart';

class TipsTitleLab extends StatefulWidget {
  TipsTitleLab({
    Key? key,
    required this.text,
    this.height = 0,
    this.style,
    this.bgColor1,
    this.bgColor2,
  }) : super(key: key);

  final String text;
  double height;
  Color? bgColor1;
  Color? bgColor2;
  TextStyle? style;

  @override
  State<StatefulWidget> createState() {
    /// : implement createState
    return _TipsTitleLabState();
  }
}

class _TipsTitleLabState extends State<TipsTitleLab> {
  @override
  void initState() {
    /// : implement initState
    super.initState();
  }

  @override
  void dispose() {
    /// : implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// : implement build

    if (widget.height == null || widget.height <= 0.0) {
      widget.height = 15.0;
    }
    if (widget.bgColor1 == null) {
      widget.bgColor1 = Color.fromRGBO(255, 111, 397, 1.0);
    }
    if (widget.bgColor2 == null) {
      widget.bgColor2 = Color.fromRGBO(222, 0, 32, 1.0);
    }
    if (widget.style == null) {
      widget.style = BaseText.style(
          height: 1,
          fontSize: 10.0,
          fontWeight: FontWeight.w400,
          color: Colors.white);
    }
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 200,
        maxHeight: widget.height,
        minWidth: 0.0,
        minHeight: widget.height,
      ),
      child: Container(
        padding: EdgeInsets.only(left: 4.0, right: 4.0, top: 3.0, bottom: 2.0),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: BaseText.style(
            height: widget.style?.height,
            color: widget.style?.color,
            fontSize: widget.style!.fontSize,
            fontWeight: widget.style!.fontWeight,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              widget.bgColor1!,
              widget.bgColor2!,
            ],
          ),
        ),
      ),
    );
  }
}