import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ladyfou/components/base_scaffold.dart';
import 'package:ladyfou/components/clicked_Image_asset.dart';
import 'package:ladyfou/page/home/store/limit_time_discount_provider.dart';
import 'package:provider/provider.dart';

import '../../components/sliver_header_delegate.dart';
import '../../core/constant/constant.dart';
import '../../core/utils/event.dart';
import '../../style/Color.dart';
import '../../utils/date_util.dart';
import 'components/limit_time_discount_product_list.dart';

class LimitTimeDiscountPage extends StatefulWidget {
  const LimitTimeDiscountPage({Key? key}) : super(key: key);

  @override
  _LimitTimeDiscountPageState createState() => _LimitTimeDiscountPageState();
}

class _LimitTimeDiscountPageState extends State<LimitTimeDiscountPage> {
  late ScrollController scrollController;

  bool showCountdown = false;

  late LimitTimeDiscountProvider provider;

  @override
  void initState() {
    provider = LimitTimeDiscountProvider();
    provider.limitTimeDiscountList(isRefresh: true);
    scrollController = ScrollController();
    scrollController.addListener(() {
      debugPrint("controller.offset = ${scrollController.offset}");

      if (scrollController.offset >= 182.w) {
        showCountdown = true;
      } else {
        showCountdown = false;
      }
      XEvent.post(EVENT_KEY_SHOW_LIMIT_COUNTDOWN, showCountdown);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: BaseScaffold(
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
        title: "限时特惠",
        body: refresh(),
      ),
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
        scrollController: scrollController,
        onRefresh: () async {
          provider.limitTimeDiscountList(isRefresh: true);
        },
        onLoad: () async {
          await provider.limitTimeDiscountList(isRefresh: false);
        },
        slivers: <Widget>[
          SliverToBoxAdapter(child: imageBanner()),
          SliverToBoxAdapter(child: countdown()),
          productRankHead(),
          buildSliverToBoxAdapter(12.w),
          limitTimeDiscountProductList(),
        ],
      ),
    );
  }

  Widget imageBanner() {
    return CachedNetworkImage(
      width: 375.w,
      height: 120.w,
      imageUrl:
          "http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg",
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
    );
  }

  Widget productRankHead() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        //有最大和最小高度
        maxHeight: 48.w,
        minHeight: 48.w,
        child: Container(
          color: AppColors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LimitTimeDiscountListHead(
                showCountdown: showCountdown,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget limitTimeDiscountProductList() {
    return LimitTimeDiscountProductList(
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

  Widget countdown() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10.w),
        ),
        child: Container(
          color: AppColors.white,
          height: 48.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DiscountCountdown(),
            ],
          ),
        ),
      ),
    );
  }
}

class LimitTimeDiscountListHead extends StatefulWidget {
  final bool showCountdown;

  const LimitTimeDiscountListHead({Key? key, this.showCountdown = false})
      : super(key: key);

  @override
  _LimitTimeDiscountListHeadState createState() =>
      _LimitTimeDiscountListHeadState();
}

class _LimitTimeDiscountListHeadState extends State<LimitTimeDiscountListHead> {
  late bool showCountdown = false;
  late StreamSubscription<bool> homeTabBarViewSubscription;

  @override
  void initState() {
    homeTabBarViewSubscription =
        XEvent.on<bool>(EVENT_KEY_SHOW_LIMIT_COUNTDOWN, (bool value) {
      if (mounted) {
        setState(() {
          showCountdown = value;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    homeTabBarViewSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 48.w,
          width: 375.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                child: DiscountCountdown(),
                visible: showCountdown,
              ),
            ],
          ),
        ),
        Positioned(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
            child: Row(
              children: [
                Text(
                  "综合",
                  style: TextStyle(
                    color: AppColors.color_FF333333,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 6.w,
                ),
                Image.asset("assets/images/triangle.png")
              ],
            ),
          ),
          top: 0,
          left: 0,
          bottom: 0,
        ),
        Positioned(
          child: ChangeStyleView(),
          top: 0,
          right: 0,
          bottom: 0,
        ),
      ],
    );
  }
}

class ChangeStyleView extends StatefulWidget {
  final int style;

  const ChangeStyleView({Key? key, this.style = 0}) : super(key: key);

  @override
  _ChangeStyleViewState createState() => _ChangeStyleViewState();
}

class _ChangeStyleViewState extends State<ChangeStyleView> {
  late int style;

  @override
  void initState() {
    style = widget.style;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
        child: Image.asset(
          style == 0
              ? "assets/images/change_list_style_1.png"
              : "assets/images/change_list_style_2.png",
        ),
      ),
      onTap: () {
        if (style > 0) {
          style = 0;
        } else {
          style = 1;
        }

        setState(() {});
        XEvent.post(EVENT_KEY_CHANGE_LIMIT_PRODUCT_LIST_STYLE, style);
      },
    );
  }
}

///倒计时
class DiscountCountdown extends StatefulWidget {
  final int second;

  const DiscountCountdown({Key? key, this.second = 360000}) : super(key: key);

  @override
  _DiscountCountdownState createState() => _DiscountCountdownState();
}

class _DiscountCountdownState extends State<DiscountCountdown> {
  late DayHourMinSec dayHourMinSec;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LimitTimeDiscountProvider provider = Provider.of(context);
    dayHourMinSec = getDayHourMinSec(provider.count);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/limit_time_discount_clock.png",
          width: 24.w,
          height: 24.w,
        ),
        countItem(dayHourMinSec.formatDay),
        buildSizedBox(),
        textItem("天"),
        buildSizedBox(),
        countItem(dayHourMinSec.formatHour),
        buildSizedBox(),
        textItem("时"),
        buildSizedBox(),
        countItem(dayHourMinSec.formatMin),
        buildSizedBox(),
        textItem("分"),
        buildSizedBox(),
        countItem(dayHourMinSec.formatSec),
        buildSizedBox(),
        textItem("秒"),
      ],
    );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
      width: 4.w,
    );
  }

  Text textItem(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget countItem(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.Color_E34D59,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
