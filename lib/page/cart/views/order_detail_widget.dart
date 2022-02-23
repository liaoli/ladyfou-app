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
    List numList = [
      '19p',
      '￥5,525',
      '-￥1,999',
      '暂无可使用优惠',
      '￥7,399',
    ];
    Color numColor = AppColors.primaryBlackText51;
    return SliverToBoxAdapter(
      child: Container(
          margin: EdgeInsets.only(top: 12),
          height: titleList.length * 37 + 36,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 12, bottom: 2, left: 12),
                child: Text(
                  '订单详情',
                  style: BaseText.style(
                    fontSize: 14,
                    color: AppColors.primaryBlackText51,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                height: 37.0 * titleList.length,
                child: ListView.builder(
                  itemCount: titleList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    if (index == 3) {
                      numColor = AppColors.color_FF666666;
                    } else if (index == 4) {
                      numColor = AppColors.color_E34D59;
                    }
                    return Container(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      alignment: Alignment.centerLeft,
                      height: 37,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            titleList[index],
                            style: BaseText.style(
                              fontSize: 12,
                              color: AppColors.primaryBlackText51,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            numList[index],
                            style: BaseText.style(
                              fontSize: 12,
                              color: numColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
