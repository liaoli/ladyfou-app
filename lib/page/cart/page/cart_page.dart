/*
 * @Descripttion: 购物车
 * @FileName: cart_page
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @LastEditors: Hao
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ladyfou/components/base_scaffold.dart';
import 'package:ladyfou/components/check_box_widget.dart';
import 'package:ladyfou/components/sliver_header_delegate.dart';
import 'package:ladyfou/core/constant/base_enum.dart';
import 'package:ladyfou/page/cart/store/cart_provider.dart';
import 'package:ladyfou/page/cart/components/bottom_pay_widget.dart';
import 'package:ladyfou/page/cart/components/goods_list_widge.dart';
import 'package:ladyfou/page/cart/components/order_detail_widget.dart';
import 'package:ladyfou/page/cart/components/preferential_list_widget.dart';
import 'package:ladyfou/page/home/components/recommend_product_head.dart';
import 'package:ladyfou/page/home/components/recommend_product_list.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:ladyfou/generated/l10n.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late CartProvider provider;

  @override
  void initState() {
    provider = CartProvider();
    provider.getSortAllDatas().then((value) {
      setState(() {});
    });

    provider.getRecommendList().then((value) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double bottomSafeHg = MediaQuery.of(context).padding.bottom;
    return ChangeNotifierProvider.value(
      value: provider,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: BaseScaffold(
          leadType: AppBarBackType.Back,
          actions: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 12),
              child: Text(
                S.of(context).charge_title,
                style: TextStyle(
                  color: AppColors.color_FF000000,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
          title: S.of(context).cart_title,
          body: Consumer<CartProvider>(
            builder: (context, child, value) {
              // 请求失败
              if (child.requestStatus == 2) {
                return Center(child: Text(S.current.erro_message));
              } else {
                if (child.requestStatus == 1) {
                  // 请求成功，购物车无数据
                  if (child.productList.length == 0) {
                    return Container(
                      child: Text('无数据缺省页'),
                    );
                  } else {
                    return Stack(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(12, 0, 12, bottomSafeHg + 110),
                          child: EasyRefresh.custom(
                              header: MaterialHeader(),
                              footer: MaterialFooter(),
                              onRefresh: () async {
                                provider.getSortAllDatas().then((value) {
                                  setState(() {});
                                });

                                provider.getRecommendList().then((value) {
                                  setState(() {});
                                });
                              },
                              // scrollController: scrollController,
                              slivers: <Widget>[
                                _topNumHead(context),
                                GoodsListWidget(productList: child.productList),
                                PreferentialListWidget(),
                                OrderDetailWidget(),
                                _recommendProductHead(),
                                RecommendProductList(data: provider.reCommend),
                              ]),
                        ),
                        Positioned(
                          bottom: 0,
                          child: BottomPayWidget(),
                        ),
                      ],
                    );
                  }
                } else {
                  // 请求中
                  return Container(
                    width: 375.w,
                    height: double.infinity,
                    child: Center(
                      child: SpinKitDualRing(
                        color: AppColors.navigationColor,
                        size: 40,
                        lineWidth: 3,
                      ),
                    ),
                  );
                }
              }
            },
          ),
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
                          fontSize: 12,
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
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _recommendProductHead() {
    return SliverPersistentHeader(
      pinned: false,
      delegate: SliverHeaderDelegate(
        maxHeight: 52.w,
        minHeight: 52.w,
        child: RecommendProductHead(
          padding: EdgeInsets.only(top: 8),
        ),
      ),
    );
  }
}
