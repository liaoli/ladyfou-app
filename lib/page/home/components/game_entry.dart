import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../../style/Color.dart';

class GameEntrySwiper extends StatefulWidget {
  GameEntrySwiper();

  @override
  State<StatefulWidget> createState() {
    return new _GameEntrySwiperState();
  }
}

class _GameEntrySwiperState extends State<GameEntrySwiper> {
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

  List<String> img = [
    "http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg",
    "http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/5b3/6203715b36dcb268484339.jpg",
    "http://ccshop-erp.neverdown.cc/storage/app/uploads/public/614/d32/3d5/614d323d524f2537290680.jpg",
  ];

  Widget _buildItem(BuildContext context, int index) {
    return CachedNetworkImage(
      width: double.infinity,
      height: double.infinity,
      imageUrl: img[index],
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
          width: 20,
          height: 20,
          child: SpinKitFadingCircle(color: AppColors.Color_E34D59),
        ),
      ),
      errorWidget: (context, url, error) => SizedBox(),
    );
  }

  @override
  void didUpdateWidget(GameEntrySwiper oldWidget) {
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
      itemCount: img.length,
      scrollDirection: _scrollDirection,
      indicatorLayout: PageIndicatorLayout.COLOR,
      autoplayDisableOnInteraction: _autoplayDisableOnInteraction,
    );
  }

  late SwiperController _controller;
  TextEditingController numberController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: new BorderRadius.all(new Radius.circular(_radius)),
      child: Container(
        child: new SizedBox(height: 100.w, width: 351.w, child: buildSwiper()),
      ),
    );
  }
}

