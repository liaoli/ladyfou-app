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
import 'package:ladyfou/core/common/global.dart';
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

import '../../../style/text.dart';
import '../../../utils/sputils.dart';
import '../../sort/components/shop_gradient_button.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late CartProvider provider;
  bool isSelect = true;

  @override
  void initState() {
    provider = CartProvider();

    if (Global.isLogin()) {
      provider.getSortAllDatas().then((value) {
        // 默认全选
        provider.selectAllAction();
        setState(() {});
      });

      provider.getShoppingCartList().then((value) {
        setState(() {});
      });

      provider.getRecommendList().then((value) {
        setState(() {});
      });

      provider.getCouponCodeList().then((value) {
        setState(() {});
      });
    }

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
          body: Global.isLogin()
              ? Consumer<CartProvider>(
                  builder: (context, child, value) {
                    // 请求失败
                    if (child.requestStatus == 2) {
                      return _noDataWidget(context);
                    } else {
                      if (child.requestStatus == 1) {
                        // 请求成功，购物车无数据
                        if (child.productList.length == 0) {
                          return _noDataWidget(context);
                        } else {
                          return Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    12, 0, 12, bottomSafeHg + 110),
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
                                      GoodsListWidget(
                                        productList: child.productList,
                                        selectProductList:
                                            child.selectProductList,
                                        selectListCallBack: (p) {
                                          child.selectProduct(p);
                                        },
                                      ),
                                      PreferentialListWidget(
                                        cartTextList: provider.cartTextList,
                                      ),
                                      OrderDetailWidget(
                                        cartInfo: provider.cartModel.cartInfo,
                                      ),
                                      _recommendProductHead(),
                                      RecommendProductList(
                                          data: provider.reCommend),
                                    ]),
                              ),
                              Positioned(
                                bottom: 0,
                                child: BottomPayWidget(
                                    cartInfo: provider.cartModel.cartInfo),
                              ),
                            ],
                          );
                        }
                      } else {
                        // 请求中
                        return Container(
                          width: 375,
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
                )
              : _noLoginWidget(context),
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
              onTap: () {
                provider.selectAllAction();
              },
              child: Container(
                padding: EdgeInsets.only(left: 4),
                child: Row(
                  children: [
                    CheckBoxWidget(isSelect: provider.isSelectAll),
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
                '（已选择${provider.selectProductList.length}件商品）',
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
        maxHeight: 52,
        minHeight: 52,
        child: RecommendProductHead(
          padding: EdgeInsets.only(top: 8),
        ),
      ),
    );
  }

  // 无数据缺省页
  Widget _noDataWidget(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: EasyRefresh.custom(
            header: MaterialHeader(),
            onRefresh: () async {
              provider.getSortAllDatas().then((value) {
                setState(() {});
              });

              provider.getRecommendList().then((value) {
                setState(() {});
              });
            },
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: 375,
                      height: 200,
                      child:
                          Image.asset('assets/images/cart/fi_cart_empty.png'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 11.w),
                      child: Text(
                        '当前购物车为空',
                        style: BaseText.style(
                            fontSize: 12,
                            color: AppColors.color_FF999999,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: 0.w),
                  ],
                ),
              ),
              _recommendProductHead(),
              RecommendProductList(data: provider.reCommend),
            ]));
  }

  //没有登录的情况
  Widget _noLoginWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          width: 375,
          height: 200,
          child: Image.asset('assets/images/cart/fi_cart_no_login.png'),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 11),
          child: Text(
            '未登录',
            style: BaseText.style(
                fontSize: 12,
                color: AppColors.color_FF999999,
                fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 2),
          child: Text(
            '登录后同步购物车中的商品',
            style: BaseText.style(
                fontSize: 12,
                color: AppColors.color_FF999999,
                fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(height: 20),
        GradientButton(
          width: 80,
          height: 35,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          text: '去登录',
          onTap: () {
            if (SPUtils.tryToLogin(context)) {}
          },
        ),
      ],
    );
  }
}
