import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/page/home/components/home_banner_swiper.dart';
import 'package:ladyfou/style/Color.dart';

import 'components/daily_new_product.dart';
import 'components/game_entry.dart';
import 'components/limited_time_discount.dart';

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
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        child: EasyRefresh.custom(
          header: MaterialHeader(),
          footer: MaterialFooter(),
          onRefresh: () async {},
          onLoad: () async {},
          slivers: <Widget>[
            SliverToBoxAdapter(child: homeBanner()),
            buildSliverToBoxAdapter(12.w),
            SliverToBoxAdapter(child: gameEntry()),
            buildSliverToBoxAdapter(12.w),
            SliverToBoxAdapter(child: limitedTimeDiscount()),
            buildSliverToBoxAdapter(12.w),
            SliverToBoxAdapter(child: dailyNewProduct()),
          ],
        ),
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
}
