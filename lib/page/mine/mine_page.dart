import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ladyfou/components/clicked_Image_asset.dart';
import 'package:ladyfou/core/constant/base_enum.dart';
import 'package:ladyfou/page/address/address_main_page.dart';
import 'package:ladyfou/page/message/sell_info_page.dart';
import 'package:ladyfou/page/mine/order/page/mine_order_page.dart';
import 'package:ladyfou/style/Color.dart';

import '../../components/button/common_button.dart';
import '../../components/web_view_page.dart';
import '../../generated/l10n.dart';
import '../../router/router.dart';
import '../address/my_address_page.dart';
import '../cs/cs_main_page.dart';
import '../history/browsing_history_page.dart';
import '../login/login.dart';
import '../message/coupon_info_page.dart';
import '../message/message_page.dart';
import '../setting/setting_main_page.dart';
import 'order/page/mine_collection_page.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.color_FFF5F5F5,
      child: Stack(children: [
        Image.asset(
          'assets/images/mine/mine_bg.png',
          width: 375.w,
          fit: BoxFit.fitWidth,
        ),
        refresh(),
      ]),
    );
  }

  Padding refresh() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: EasyRefresh.custom(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {},
        slivers: <Widget>[
          SliverToBoxAdapter(child: mineHead()),
          buildSliverToBoxAdapter(28.w),
          SliverToBoxAdapter(child: mineInformation()),
          buildSliverToBoxAdapter(28.w),
          SliverToBoxAdapter(child: mineMenu()),
          buildSliverToBoxAdapter(60.w),
          SliverToBoxAdapter(child: mineModul()),
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: game()),
          buildSliverToBoxAdapter(28.w),
        ],
      ),
    );
  }

  SliverToBoxAdapter buildSliverToBoxAdapter(double height) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
      ),
    );
  }

  Widget mineHead() {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double headHeight = 20.w;

    return Container(
      height: headHeight,
      margin: EdgeInsets.only(top: statusBarHeight + 13.w),
      child: Row(
        children: [
          Expanded(child: SizedBox()),
          ClickedImageAsset(
            image: "assets/images/mine/icon_frame.png",
            width: 20.w,
            height: 20.w,
            fit: BoxFit.cover,
            onTap: () {
              Get.to(() => CSMainPage());
            },
          ),
          SizedBox(
            width: 12.w,
          ),
          ClickedImageAsset(
            image: "assets/images/mine/icon_settings.png",
            width: 20.w,
            height: 20.w,
            fit: BoxFit.cover,
            onTap: () {
              Get.to(() => SettingMainPage());
            },
          ),
          SizedBox(
            width: 12.w,
          ),
          ClickedImageAsset(
            image: "assets/images/mine/icon_shopping.png",
            width: 20.w,
            height: 20.w,
            fit: BoxFit.cover,
            onTap: () {
              XRouter.goCartPage();
            },
          ),
          SizedBox(
            width: 12.w,
          ),
          ClickedImageAsset(
            image: "assets/images/mine/icon_message.png",
            width: 20.w,
            height: 20.w,
            fit: BoxFit.cover,
            onTap: () {
              Get.to(() => MessagePage());
            },
          ),
          SizedBox(
            width: 12.w,
          ),
        ],
      ),
    );
  }

  Widget mineInformation() {
    final double widgetHeight = 48.w;
    final double fontSize = 18;

    return Container(
      height: widgetHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 24.w,
          ),
          // isLogin
          //     ? Text('Hello，前田敦子',
          //         style: TextStyle(
          //           color: AppColors.color_FF333333,
          //           fontSize: fontSize,
          //           fontWeight: FontWeight.bold,
          //         ))
          //     :
          InkWell(
            onTap: () => {
              setState(() {
                isLogin = true;
                Get.to(() => LoginPage());
              })
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome To Ladyfou',
                    style: TextStyle(
                      color: AppColors.color_FF333333,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  width: 4.w,
                ),
                Row(
                  children: [
                    Text('登录/注册',
                        style: TextStyle(
                          color: AppColors.color_FF333333,
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        )),
                    Image.asset(
                      "assets/images/mine/black_right.png",
                      width: 24.w,
                      height: 24.w,
                      fit: BoxFit.cover,
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          isLogin
              ? InkWell(
                  onTap: () {
                    setState(() {
                      isLogin = false;
                    });
                  },
                  child: Container(
                    width: 68.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.transparent_Black5),
                    child: Center(
                      //加上Center让文字居中
                      child: Row(
                        children: [
                          SizedBox(
                            width: 8.w,
                          ),
                          Text('会员情报',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              )),
                          Image.asset(
                            "assets/images/mine/white_right.png",
                            width: 16.w,
                            height: 16.w,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          SizedBox(
            width: 12.w,
          ),
        ],
      ),
    );
  }

  final List gridList = [
    {"name": S.current.integral, "url": 'assets/images/mine/menu_icon1.png'},
    {"name": S.current.collection, "url": 'assets/images/mine/menu_icon2.png'},
    {
      "name": S.current.discount_code,
      "url": 'assets/images/mine/menu_icon3.png'
    },
    {"name": S.current.footprint, "url": 'assets/images/mine/menu_icon4.png'},
    {"name": S.current.address, "url": 'assets/images/mine/menu_icon5.png'},
  ];

  Widget mineMenu() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: menuList(),
      ),
    );
  }

  List<Widget> menuList() {
    List<Widget> result = gridList.map((e) {
      return InkWell(
        onTap: () {
          //TODO: 点击跳转
          if (e['name'] == S.current.collection) {
            Get.to(() => MineCollectionPage());
          } else if (e['name'] == S.current.discount_code) {
            Get.to(() => CouponInfoPage());
          } else if (e['name'] == S.current.footprint) {
            showModalBottomSheet(
              // backgroundColor: AppColors.transparent,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.w),
              ),
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 502.w,
                  child: ClipRRect(
                    //剪裁为圆角矩形
                    borderRadius: BorderRadius.circular(10.w),
                    child: Container(
                      width: double.infinity,
                      height: 502.w,
                      color: AppColors.white,
                      alignment: Alignment.centerLeft,
                      child: BrowsingHistoryPage(),
                    ),
                  ),
                );
              },
            );
          } else if (e['name'] == S.current.address) {
            Get.to(() => MyAddressPage());

          }
        },
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 4.w),
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.w),
                  color: Colors.white),
              child: Center(
                child: Image.asset(
                  e['url'],
                  width: 18.w,
                  height: 18.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              '${e['name']}',
              style: TextStyle(
                color: AppColors.color_FF333333,
                fontWeight: FontWeight.w700,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      );
    }).toList();

    return result;
  }

  // icon点击事件
  void _record(int type, BuildContext context) async {
    switch (type) {
      default:
    }
  }

  final List _orderList = [
    {
      "name": S.current.not_shipped,
      "icon": "assets/images/mine/mine_modul_icon1.png"
    },
    {
      "name": S.current.shipped,
      "icon": "assets/images/mine/mine_modul_icon2.png"
    },
    {
      "name": S.current.distribution,
      "icon": "assets/images/mine/mine_modul_icon3.png"
    },
    {
      "name": S.current.received,
      "icon": "assets/images/mine/mine_modul_icon4.png"
    },
  ];

  Widget mineModul() {
    return Container(
      height: 104.w,
      width: 351.w,
      padding: EdgeInsets.all(
        12.w,
      ),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '我的订单',
                  style: TextStyle(
                    color: AppColors.color_FF333333,
                    fontSize: 14.w,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //TODO: 跳转到订单页面
                    Get.to(() => MineOrderPage());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '查看全部订单',
                        style: TextStyle(
                          color: AppColors.color_FF333333,
                          fontSize: 10.w,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Image.asset("assets/images/mine/me_right_arrow.png"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.w,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: orderList(),
            ),
          )),
        ],
      ),
    );
  }

  List<Widget> orderList() {
    List<Widget> result = _orderList.map((e) {
      return GestureDetector(
        onTap: () {
          OrderStatus orderStatus = OrderStatus.all;
          if (e['name'] == S.current.not_shipped) {
            orderStatus = OrderStatus.delivering;
          } else if (e['name'] == S.current.shipped) {
            orderStatus = OrderStatus.delivering;
          } else if (e['name'] == S.current.distribution) {
            orderStatus = OrderStatus.delivering;
          } else if (e['name'] == S.current.received) {
            orderStatus = OrderStatus.finished;
          }

          Get.to(() => MineOrderPage(orderStatus: orderStatus));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              e['icon'],
              width: 24.w,
              height: 24.w,
            ),
            SizedBox(
              height: 6.w,
            ),
            Text(
              e['name'],
              style: TextStyle(
                color: AppColors.color_FF030319,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
    }).toList();

    return result;
  }

  Widget game() {
    return Stack(
      children: [
        GestureDetector(
          child: ClipRRect(
            borderRadius: BorderRadius.all(new Radius.circular(10.w)),
            child: CachedNetworkImage(
              width: 375.w,
              height: 230.w,
              imageUrl:
                  "https://goerp.oss-cn-hongkong.aliyuncs.com/apk/erp/game.png",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => Center(
                child: SizedBox(
                  width: 40.w,
                  height: 40.w,
                  child: SpinKitFadingCircle(color: AppColors.Color_E34D59),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          onTap: () {
            Get.to(() => WebViewPage());
          },
        ),
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
            ),
            child: GestureDetector(
              onTap: () {
                Get.to(() => WebViewPage());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(new Radius.circular(10.w)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 10,
                  ),
                  child: Opacity(
                    opacity: 0.8,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 7.w,
                      ),
                      color: AppColors.white,
                      width: 327.w,
                      height: 48.w,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Game",
                                  style: TextStyle(
                                    color: AppColors.color_FF333333,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                Text(
                                  "点击加入跳一跳游戏中，多重好礼优惠等你来拿",
                                  style: TextStyle(
                                    color: AppColors.color_FF333333,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CommonButton(
                            borderRadius:
                                new BorderRadius.all(Radius.circular(17.w)),
                            width: 70.w,
                            height: 24.w,
                            bg: AppColors.Color_E34D59,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "现在去玩>",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
