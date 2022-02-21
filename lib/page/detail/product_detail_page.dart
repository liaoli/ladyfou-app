import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';

import 'components/detial_default_head.dart';
import 'components/hot_comments_view.dart';
import 'components/limited_time_discount.dart';
import 'components/product_image_swiper.dart';
import 'components/product_info_view.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      debugPrint("controller.offset = ${scrollController.offset}");

      if (scrollController.offset >= 0) {
      } else {
        if (showSearch == true) {}
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: AppColors.color_FFF5F5F5,
        child: Column(
          children: [
            homeHead(),
            Expanded(
              child: refresh(),
            ),
          ],
        ),
      ),
    );
  }

  Widget homeHead() {
    return DetailDefaultNavBar();
  }

  Widget refresh() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.w,
      ),
      child: EasyRefresh.custom(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {},
        scrollController: scrollController,
        slivers: <Widget>[
          SliverToBoxAdapter(child: productImageSwiper()), //375
          SliverToBoxAdapter(child: limitTimeDiscount()), //40
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: productInfo()), //141
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: hotComments()), //40
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

  Widget productImageSwiper() {
    return ProductImageSwiper();
  }

  Widget limitTimeDiscount() {
    return LimitedTimeDiscount();
  }

  Widget productInfo() {
    return ProductInfoView();
  }

  Widget hotComments() {
    return HotCommentsView();
  }
}
