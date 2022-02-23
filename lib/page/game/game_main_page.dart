import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ladyfou/components/base_scaffold.dart';
import 'package:ladyfou/components/clicked_Image_asset.dart';

import '../../components/sliver_header_delegate.dart';
import '../../components/web_view_page.dart';
import '../../core/constant/base_enum.dart';
import '../../style/Color.dart';
import '../home/components/new_product_list.dart';
import '../home/components/recommend_product_bottom.dart';
import '../home/components/recommend_product_head.dart';
import '../home/components/recommend_product_list.dart';

class GameMainPage extends StatefulWidget {
  const GameMainPage({Key? key}) : super(key: key);

  @override
  _GameMainPageState createState() => _GameMainPageState();
}

class _GameMainPageState extends State<GameMainPage> {
  bool showCountdown = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      leadType: AppBarBackType.None,
      actions: [
        ClickedImageAsset(
          image: "assets/images/action_bar_shopping_cart_black.png",
          width: 20.w,
          height: 20.w,
          onTap: () {
            //TODO:跳转到购物车
          },
        ),
        SizedBox(
          width: 12.w,
        ),
      ],
      title: "游 戏",
      body: refresh(),
    );
  }

  Widget refresh() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.w,
      ),
      child: EasyRefresh.custom(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {
            setState(() {});
          });
        },
        slivers: <Widget>[
          SliverToBoxAdapter(child: imageBanner()),
          buildSliverToBoxAdapter(12.w),
          recommendProductHead(),
          recommendProductList(),
          SliverToBoxAdapter(child: recommendProductBottom()),
        ],
      ),
    );
  }

  Widget imageBanner() {
    return GestureDetector(
      child: CachedNetworkImage(
        width: 375.w,
        height: 513.w,
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
      onTap: () {
        Get.to(() => WebViewPage());
      },
    );
  }

  Widget newProductList() {
    return NewProductList(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 12.w,
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

  Widget recommendProductHead() {
    return SliverPersistentHeader(
      pinned: false,
      delegate: SliverHeaderDelegate(
        //有最大和最小高度
        maxHeight: 52.w,
        minHeight: 52.w,
        child: RecommendProductHead(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
        ),
      ),
    );
  }

  Widget recommendProductList() {
    return RecommendProductList(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
    );
  }

  Widget recommendProductBottom() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: RecommendProductBottom(),
    );
  }
}
