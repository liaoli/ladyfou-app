import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ladyfou/page/home/components/home_banner_swiper.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: EasyRefresh.custom(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {},
        onLoad: () async {},
        slivers: <Widget>[
          SliverToBoxAdapter(child: homeBanner()),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          SliverToBoxAdapter(child: gameEntry()),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          SliverToBoxAdapter(child: limitedTimeDiscount()),
        ],
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
}
