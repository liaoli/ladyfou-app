import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ladyfou/components/base_scaffold.dart';
import 'package:ladyfou/components/clicked_Image_asset.dart';

import '../../components/sliver_header_delegate.dart';
import '../../style/Color.dart';
import 'components/product_rank_head.dart';
import 'components/product_rank_list.dart';

class ProductRankPage extends StatefulWidget {
  const ProductRankPage({Key? key}) : super(key: key);

  @override
  _ProductRankPageState createState() => _ProductRankPageState();
}

class _ProductRankPageState extends State<ProductRankPage> {
  int count = 6;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
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
      title: "商品排行榜",
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
            setState(() {
              count = 6;
            });
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 1), () {
            setState(() {
              count += 10;
            });
          });
        },
        slivers: <Widget>[
          SliverToBoxAdapter(child: imageBanner()),
          productRankHead(),
          buildSliverToBoxAdapter(12.w),
          productRankList(),
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
        maxHeight: 100.w,
        minHeight: 100.w,
        child: Container(
          color: AppColors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ProductCategoryList()],
          ),
        ),
      ),
    );
  }

  Widget productRankList() {
    return ProductRankList(
      count: count,
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 24.w,
      ),
      background: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.w,
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 12.w,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            // boxShadow: const <BoxShadow>[
            //   BoxShadow(
            //     offset: Offset(0, 4),
            //     blurRadius: 8,
            //     color: Colors.black26,
            //   )
            // ],
            borderRadius: BorderRadius.circular(10.w),
          ),
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
}
