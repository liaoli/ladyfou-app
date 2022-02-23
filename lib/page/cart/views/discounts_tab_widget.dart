import 'package:flutter/material.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:ladyfou/style/text.dart';

class DiscountsTabWidget extends StatefulWidget {
  DiscountsTabWidget({Key? key}) : super(key: key);

  @override
  State<DiscountsTabWidget> createState() => _DiscountsTabWidgetState();
}

class _DiscountsTabWidgetState extends State<DiscountsTabWidget> {
  bool isSlectFirst = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSlectFirst = true;
            });
          },
          child: Container(
            padding: EdgeInsets.only(right: 6),
            child: Text(
              '积分使用',
              style: _textStyle(isSlectFirst),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isSlectFirst = false;
            });
          },
          child: Container(
            padding: EdgeInsets.only(left: 6),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 1,
                  color: AppColors.jp_color196,
                ),
              ),
            ),
            child: Text(
              '优惠券',
              style: _textStyle(!isSlectFirst),
            ),
          ),
        ),
      ],
    );
  }

  TextStyle _textStyle(bool isSelect) {
    return isSelect
        ? myTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryBlackText51,
          )
        : myTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.jp_color153,
          );
  }
}
