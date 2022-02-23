import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';

import '../../generated/l10n.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.color_FFF5F5F5,
      child: Stack(children: [
        Positioned(
          bottom: 0.w,
          child: Image.asset(
            'assets/images/mine/mine_bg.png',
            width: 375.w,
            fit: BoxFit.fitHeight,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            mineHead(),
            SizedBox(
              height: 28.w,
            ),
            mineInformation(),
            SizedBox(
              height: 28.w,
            ),
            mineMenu(),
            SizedBox(
              height: 26.w,
            ),
            mineModul()
          ],
        ),
      ]),
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
          Image.asset(
            "assets/images/mine/icon_frame.png",
            width: 20.w,
            height: 20.w,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 12.w,
          ),
          Image.asset(
            "assets/images/mine/icon_settings.png",
            width: 20.w,
            height: 20.w,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 12.w,
          ),
          Image.asset(
            "assets/images/mine/icon_shopping.png",
            width: 20.w,
            height: 20.w,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 12.w,
          ),
          Image.asset(
            "assets/images/mine/icon_message.png",
            width: 20.w,
            height: 20.w,
            fit: BoxFit.cover,
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
          isLogin
              ? Text('Hello，前田敦子',
                  style: TextStyle(
                    color: AppColors.color_FF333333,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ))
              : InkWell(
                  onTap: () => {
                    setState(() {
                      isLogin = true;
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
                  onTap: () => {
                    setState(() {
                      isLogin = false;
                    })
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

  Widget mineMenu() {
    final List gridList = [
      {"name": S.current.integral, "url": 'assets/images/mine/menu_icon1.png'},
      {
        "name": S.current.collection,
        "url": 'assets/images/mine/menu_icon2.png'
      },
      {
        "name": S.current.discount_code,
        "url": 'assets/images/mine/menu_icon3.png'
      },
      {"name": S.current.footprint, "url": 'assets/images/mine/menu_icon4.png'},
      {"name": S.current.address, "url": 'assets/images/mine/menu_icon5.png'},
    ];

    return Container(
      width: 313.w,
      height: 55.w,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: gridList.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 0,
          crossAxisSpacing: 34.w,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return Center(
            child: InkWell(
              onTap: () => _record(index, context),
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
                        gridList[index]['url'],
                        width: 18.w,
                        height: 18.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    '${gridList[index]['name']}',
                    style: TextStyle(
                      color: AppColors.color_FF333333,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // icon点击事件
  void _record(int type, BuildContext context) async {
    switch (type) {
      default:
    }
  }

  Widget mineModul() {
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

    return Container(
      height: 104.w,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 0),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 32.w,
              right: 32.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  /// 我的订单
                  '我的订单',
                  style: TextStyle(
                    color: AppColors.primaryBlackText,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '查看全部订单',

                          /// 查看全部订单
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 24.w,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        // Image.asset(
                        //   'assets/images/mine/right_icon_grey.png',
                        //   width: 16.0,
                        //   height: 16.0,
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 63,
            child: GridView.builder(
              padding: EdgeInsets.only(top: 0),
              shrinkWrap: true,
              itemCount: _orderList.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: 0.1,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 42,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          _orderList[index]['icon'],
                          width: 48.0,
                          height: 48.0,
                        ),
                        Text(
                          _orderList[index]['name'],
                          style: TextStyle(
                            color: AppColors.primaryBlackText,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
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
}
