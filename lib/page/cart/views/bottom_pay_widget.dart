import 'package:flutter/material.dart';
import 'package:ladyfou/page/cart/views/discounts_tab_widget.dart';
import 'package:ladyfou/style/Color.dart';

class BottomPayWidget extends StatelessWidget {
  const BottomPayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double bottomSafeHg = MediaQuery.of(context).padding.bottom;
    double screenWd = MediaQuery.of(context).size.width;
    double couponsWd = (screenWd - 36) / 2.6; // 优惠券按钮宽度

    return Container(
      padding: EdgeInsets.fromLTRB(12, 13, 12, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 0.5, color: AppColors.transparent_Black3),
        ),
      ),
      height: bottomSafeHg + 76,
      width: screenWd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(children: [
              TextSpan(
                text: "合计金额：",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryBlackText51),
              ),
              TextSpan(
                text: "3,479円 ",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlackText51),
              ),
              TextSpan(
                text: "(不含配送费)",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.jp_color153),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            height: 33,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _showDiscountsWidget(context, bottomSafeHg),
                  child: Container(
                    alignment: Alignment.center,
                    width: couponsWd,
                    height: 33,
                    decoration: new BoxDecoration(
                      color: AppColors.color_FCE6E9,
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: Text(
                      '使用积分/优惠券',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryBlackText51),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 12),
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      color: AppColors.color_E34D59,
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: Text(
                      '购入',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 选择积分/优惠券弹框
  void _showDiscountsWidget(BuildContext context, double bottomSafeHg) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          width: double.infinity,
          height: 134 + bottomSafeHg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 12, top: 12),
                width: double.infinity,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      width: 4,
                      color: AppColors.primaryBackground,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DiscountsTabWidget(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 7),
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          'assets/images/close_icon.png',
                          width: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IntegralWidget(),
              Container(
                padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Text(
                  '*当前最大可使用积分为100pt',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.jp_color153,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// 积分输入框
class IntegralWidget extends StatelessWidget {
  const IntegralWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 12),
              alignment: Alignment.centerLeft,
              height: 40,
              decoration: BoxDecoration(
                border:
                    Border.all(width: 0.5, color: AppColors.primaryBlackText51),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.jp_color153,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration.collapsed(hintText: "输入积分数额"),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 10),
            width: 73,
            height: 40,
            decoration: new BoxDecoration(
              color: AppColors.color_E34D59,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            child: Text(
              '使用',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
