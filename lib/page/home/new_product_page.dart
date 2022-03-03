import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ladyfou/components/base_scaffold.dart';
import 'package:ladyfou/components/clicked_Image_asset.dart';
import 'package:ladyfou/page/home/store/daily_new_provider.dart';
import 'package:provider/provider.dart';

import '../../style/Color.dart';
import 'components/new_product_list.dart';

class NewProductPage extends StatefulWidget {
  const NewProductPage({Key? key}) : super(key: key);

  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  late DailyNewProvider provider;

  @override
  void initState() {
    provider = DailyNewProvider();
    provider.getDailyNew(isRefresh: true);
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
        title: "新品专区",
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
        controller: provider.refreshController,
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {
          await provider.getDailyNew(isRefresh: true);
        },
        onLoad: () async {
          await provider.getDailyNew(isRefresh: false);
        },
        slivers: <Widget>[
          SliverToBoxAdapter(child: imageBanner()),
          buildSliverToBoxAdapter(12.w),
          newProductList(),
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
}
