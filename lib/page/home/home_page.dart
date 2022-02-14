import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ladyfou/page/home/components/home_banner_swiper.dart';

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
        ],
      ),
    );
  }

  Widget homeBanner() {
    return HomeBannerSwiper();
  }
}
