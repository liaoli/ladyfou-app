// 折扣列表

import 'package:flutter/material.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:ladyfou/style/text.dart';

class PreferentialListWidget extends StatelessWidget {
  const PreferentialListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List preferentialList = [
      '再购买￥5200可以免费配送!',
      '再购买￥7000可以得到￥800折扣!',
      '再购买￥9000可以得到￥1500折扣!',
      '再购买￥12000可以得到￥2000折扣!'
    ];
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 12),
        height: preferentialList.length * 38,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: ListView.builder(
          itemCount: preferentialList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, index) {
            return Container(
              padding: EdgeInsets.only(left: 12),
              alignment: Alignment.centerLeft,
              height: 38,
              child: Text(
                preferentialList[index],
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
