// 订单详情

import 'package:flutter/material.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:ladyfou/style/text.dart';

class OrderDetailWidget extends StatelessWidget {
  const OrderDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List titleList = [
      '赚取积分：',
      '产品小计（含税）：',
      '抵扣积分：',
      '抵扣优惠券：',
      '总金额（含税）：',
    ];
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 12),
        height: titleList.length * 37 + 36,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: ListView.builder(
          itemCount: titleList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, index) {
            return Container(
              padding: EdgeInsets.only(left: 12),
              alignment: Alignment.centerLeft,
              height: 37,
              child: Text(
                titleList[index],
                style: BaseText.style(
                  fontSize: 12,
                  color: AppColors.primaryBlackText51,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
