import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:ladyfou/core/model/home_banner_list_model.dart';
import 'package:provider/provider.dart';

import '../../../style/Color.dart';
import '../../detail/product_detail_page.dart';
import '../store/home_provider.dart';

class HomeBannerSwiper extends StatefulWidget {
  HomeBannerSwiper();

  @override
  State<StatefulWidget> createState() {
    return new _HomeBannerSwiperState();
  }
}

class _HomeBannerSwiperState extends State<HomeBannerSwiper> {
  //properties want to custom
  int _itemCount = 0;

  bool _loop = false;

  bool _autoplay = false;

  int _autoplayDely = 0;

  double _padding = 0;

  bool _outer = false;

  double _radius = 0;

  double _viewportFraction = 0;

  late SwiperLayout _layout;

  int _currentIndex = 0;

  late double _scale;

  late Axis _scrollDirection;

  late Curve _curve;

  late double _fade;

  late bool _autoplayDisableOnInteraction;

  CustomLayoutOption? customLayoutOption;

  List<BannerModel> banners = [];

  Widget _buildItem(BuildContext context, int index) {
    BannerModel model = banners[index];
    return GestureDetector(
      child: CachedNetworkImage(
        width: double.infinity,
        height: double.infinity,
        imageUrl: model.getImgRealUrl(),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => Center(
          child: Image.asset(
            "assets/images/icon_goods_placeholder.9.png",
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          "assets/images/icon_goods_placeholder.9.png",
          width: double.infinity,
          height: double.infinity,
        ),
      ),
      onTap: () {
        Get.to(() => ProductDetailPage());
      },
    );
  }

  @override
  void didUpdateWidget(HomeBannerSwiper oldWidget) {
    customLayoutOption = new CustomLayoutOption(startIndex: -1, stateCount: 3)
        .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
      new Offset(-370.0, -40.0),
      new Offset(0.0, 0.0),
      new Offset(370.0, -40.0)
    ]);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    customLayoutOption = new CustomLayoutOption(startIndex: -1, stateCount: 3)
        .addRotate([-25.0 / 180, 0.0, 25.0 / 180]).addTranslate([
      new Offset(-350.0, 0.0),
      new Offset(0.0, 0.0),
      new Offset(350.0, 0.0)
    ]);
    _fade = 1.0;
    _currentIndex = 0;
    _curve = Curves.ease;
    _scale = 1;
    _controller = new SwiperController();
    _layout = SwiperLayout.DEFAULT;
    _radius = 10.0;
    _padding = 0.0;
    _loop = true;
    _itemCount = 3;
    _autoplay = true;
    _autoplayDely = 3000;
    _viewportFraction = 1;
    _outer = false;
    _scrollDirection = Axis.horizontal;
    _autoplayDisableOnInteraction = false;
    super.initState();
  }

// maintain the index

  Widget buildSwiper() {
    return new Swiper(
      onTap: (int index) {
        Navigator.of(context)
            .push(new MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("New page"),
            ),
            body: Container(),
          );
        }));
      },
      customLayoutOption: customLayoutOption,
      fade: _fade,
      index: _currentIndex,
      onIndexChanged: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      curve: _curve,
      scale: _scale,
      itemWidth: 330.0,
      controller: _controller,
      layout: _layout,
      outer: _outer,
      itemHeight: 171.0,
      viewportFraction: _viewportFraction,
      autoplayDelay: _autoplayDely,
      loop: _loop,
      autoplay: _autoplay,
      itemBuilder: _buildItem,
      itemCount: banners.length,
      scrollDirection: _scrollDirection,
      indicatorLayout: PageIndicatorLayout.COLOR,
      autoplayDisableOnInteraction: _autoplayDisableOnInteraction,
      pagination:
          new SwiperPagination(builder: const MyFractionPaginationBuilder()),
    );
  }

  late SwiperController _controller;
  TextEditingController numberController = new TextEditingController();
  late HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context, listen: true);

    if (provider.banner != null) {
      banners = provider.banner!.items;
    }

    return ClipRRect(
      borderRadius: new BorderRadius.all(new Radius.circular(_radius)),
      child: Container(
        child: new SizedBox(height: 351.w, width: 351.w, child: buildSwiper()),
      ),
    );
  }
}

class MyFractionPaginationBuilder extends SwiperPlugin {
  ///color ,if set null , will be Theme.of(context).scaffoldBackgroundColor
  final Color? color;

  ///color when active,if set null , will be Theme.of(context).primaryColor
  final Color? activeColor;

  ////font size
  final double fontSize;

  ///font size when active
  final double activeFontSize;

  final Key? key;

  const MyFractionPaginationBuilder(
      {this.color = AppColors.white,
      this.fontSize: 12.0,
      this.key,
      this.activeColor = AppColors.white,
      this.activeFontSize: 12.0});

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    ThemeData themeData = Theme.of(context);
    Color activeColor = this.activeColor ?? themeData.primaryColor;
    Color color = this.color ?? themeData.scaffoldBackgroundColor;

    if (Axis.vertical == config.scrollDirection) {
      return new Column(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Text(
            "${config.activeIndex + 1}",
            style: TextStyle(color: activeColor, fontSize: activeFontSize),
          ),
          new Text(
            "/",
            style: TextStyle(color: color, fontSize: fontSize),
          ),
          new Text(
            "${config.itemCount}",
            style: TextStyle(color: color, fontSize: fontSize),
          )
        ],
      );
    } else {
      return new Row(
        key: key,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(child: SizedBox()),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              color: AppColors.color_66000000,
              child: Row(
                children: [
                  new Text(
                    "${config.activeIndex + 1}",
                    style:
                        TextStyle(color: activeColor, fontSize: activeFontSize),
                  ),
                  new Text(
                    " / ${config.itemCount}",
                    style: TextStyle(color: color, fontSize: fontSize),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }
  }
}
