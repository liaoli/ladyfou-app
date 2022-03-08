import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ladyfou/core/constant/base_bloc.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:ladyfou/style/text.dart';

typedef SelectCallBack = void Function(bool isSelect);

class DiscountsTabWidget extends StatefulWidget {
  DiscountsTabWidget({Key? key}) : super(key: key);

  @override
  State<DiscountsTabWidget> createState() => _DiscountsTabWidgetState();
}

class _DiscountsTabWidgetState extends State<DiscountsTabWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        initialData: true,
        stream: BaseBloc.instance.addLisenerCartDiscountsStream,
        builder: (ctx, snapshot) {
          bool isSelect = snapshot.data != false ? true : false;
          return Container(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    BaseBloc.instance.addCartDiscountsLisenShow(true);
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      '积分使用',
                      style: _textStyle(isSelect),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    BaseBloc.instance.addCartDiscountsLisenShow(false);
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
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
                      style: _textStyle(!isSelect),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
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
