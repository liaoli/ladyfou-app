/*
 * @Descripttion: 购物车
 * @FileName: cart_page
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @LastEditors: Hao
 */

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/components/base_scaffold.dart';
import 'package:ladyfou/components/check_box_widget.dart';
import 'package:ladyfou/core/constant/base_enum.dart';
import 'package:ladyfou/page/cart/views/goods_list_widge.dart';
import 'package:ladyfou/page/cart/views/preferential_list_widget.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:ladyfou/generated/l10n.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: BaseScaffold(
        leadType: AppBarBackType.Back,
        actions: [
          Container(
            child: Text(
              S.of(context).charge_title,
              style: TextStyle(
                color: AppColors.color_FF000000,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
        title: S.of(context).cart_title,
        body: Padding(
          padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
          child: EasyRefresh.custom(
              header: MaterialHeader(),
              footer: MaterialFooter(),
              onRefresh: () async {},
              // scrollController: scrollController,
              slivers: <Widget>[
                _topNumHead(context),
                GoodsListWidget(),
                PreferentialListWidget(),
              ]),
        ),
      ),
    );
  }

  // 头部全选商品和购物车无数据时缺省页
  Widget _topNumHead(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 12, bottom: 12),
        width: double.infinity,
        height: 41,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(left: 4),
                child: Row(
                  children: [
                    CheckBoxWidget(),
                    Container(
                      padding: EdgeInsets.only(left: 6),
                      child: Text(
                        '全选商品',
                        style: TextStyle(
                          color: AppColors.primaryBlackText51,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                '（已选择1件商品）',
                style: TextStyle(
                  color: AppColors.primaryBlackText51,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
