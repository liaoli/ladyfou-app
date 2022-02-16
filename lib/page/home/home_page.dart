import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/components/sliver_header_delegate.dart';
import 'package:ladyfou/page/home/components/home_banner_swiper.dart';
import 'package:ladyfou/page/home/components/recommend_product_head.dart';
import 'package:ladyfou/style/Color.dart';

import 'components/daily_new_product.dart';
import 'components/game_entry.dart';
import 'components/heng_fu.dart';
import 'components/limited_time_discount.dart';
import 'components/product_rank_bottom.dart';
import 'components/product_rank_head.dart';
import 'components/product_rank_list.dart';
import 'components/recommend_product_bottom.dart';
import 'components/recommend_product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.color_FFF5F5F5,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/home/home_head_default_bg.png",
            width: 375.w,
            height: 172.w,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              homeHead(),
              Expanded(
                child: refresh(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget homeHead() {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double headHeight = 92.w;

    return Container(
      height: headHeight,
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Row(
        children: [
          SizedBox(
            width: 12.w,
          ),
          Image.asset(
            "assets/images/home/home_head_logo.png",
            width: 105.w,
            height: 28.w,
            fit: BoxFit.cover,
          ),
          Expanded(child: SizedBox()),
          Image.asset(
            "assets/images/home/home_head_search.png",
            width: 20.w,
            height: 20.w,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 12.w,
          ),
          Image.asset(
            "assets/images/home/home_head_heart.png",
            width: 20.w,
            height: 20.w,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 12.w,
          ),
          Image.asset(
            "assets/images/home/home_shopping_cart.png",
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
          SliverToBoxAdapter(child: hengFu()),
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: homeBanner()),
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: gameEntry()),
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: limitedTimeDiscount()),
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: dailyNewProduct()),
          buildSliverToBoxAdapter(12.w),
          productRankHead(),
          productRankList(),
          SliverToBoxAdapter(child: productRankBottom()),
          recommendProductHead(),
          recommendProductList(),
          SliverToBoxAdapter(child: recommendProductBottom()),
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

  Widget hengFu() {
    return HengFu();
  }

  Widget homeBanner() {
    return HomeBannerSwiper();
  }

  Widget gameEntry() {
    return GameEntrySwiper();
  }

  Widget limitedTimeDiscount() {
    return LimitedTimeDiscount();
  }

  Widget dailyNewProduct() {
    return DailyNewProduct();
  }

  Widget productRankHead() {
    return SliverPersistentHeader(
      pinned: false,
      delegate: SliverHeaderDelegate(
        //有最大和最小高度
        maxHeight: 120.w,
        minHeight: 120.w,
        child: ProductRankHead(),
      ),
    );
  }

  Widget productRankList() {
    return ProductRankList();
  }

  Widget productRankBottom() {
    return ProductRankBottom();
  }

  Widget recommendProductHead() {
    return SliverPersistentHeader(
      pinned: false,
      delegate: SliverHeaderDelegate(
        //有最大和最小高度
        maxHeight: 52.w,
        minHeight: 52.w,
        child: RecommendProductHead(),
      ),
    );
  }

  Widget recommendProductList() {
    return RecommendProductList();
  }

  Widget recommendProductBottom() {
    return RecommendProductBottom();
  }
}
