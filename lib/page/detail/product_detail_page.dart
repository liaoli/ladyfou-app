import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ladyfou/page/detail/store/product_detail_provider.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:provider/provider.dart';

import '../../components/sliver_header_delegate.dart';
import 'components/ProductEvaluationHead.dart';
import 'components/color_and_size_entry_view.dart';
import 'components/detail_bottom_view.dart';
import 'components/detial_default_head.dart';
import 'components/hot_comments_view.dart';
import 'components/limited_time_discount.dart';
import 'components/common_head.dart';
import 'components/product_description_list.dart';
import 'components/product_evaluation_bottom.dart';
import 'components/product_evaluation_list.dart';
import 'components/product_image_swiper.dart';
import 'components/product_info_view.dart';
import 'components/purchase_instructions_entry_view.dart';
import 'components/recommend_product_list.dart';
import 'components/recommend_set_entry_view.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late ProductDetailProvider provider;

  @override
  void initState() {
    provider = ProductDetailProvider();

    provider.getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Scaffold(
        body: Material(
          color: AppColors.color_FFF5F5F5,
          child: Column(
            children: [
              homeHead(),
              Expanded(
                child: DetailListView(),
              ),
              DetailBottomView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeHead() {
    return DetailDefaultNavBar();
  }
}

class DetailListView extends StatelessWidget {
  const DetailListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailProvider provider = Provider.of(context, listen: true);
    return refresh(provider);
  }

  Widget refresh(ProductDetailProvider provider) {
    if (provider.detailModel == null) {
      return loading();
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.w,
      ),
      child: EasyRefresh.custom(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {},
        scrollController: provider.scrollController,
        slivers: <Widget>[
          SliverToBoxAdapter(child: productImageSwiper()), //375
          SliverToBoxAdapter(child: limitTimeDiscount()), //40
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: productInfo()), //141
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: hotComments()), //120
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: productColorAndSizeEntry()), //44
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: purchaseInstructionsEntry()), //44
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: recommendSet()), //124
          buildSliverToBoxAdapter(12.w),
          productEvaluationHead(), //40  //评论
          productEvaluationList(), //180
          SliverToBoxAdapter(child: productEvaluationBottom()), //50
          buildSliverToBoxAdapter(12.w),
          productDescriptionHead(), //40 //详情
          productDescription(), //327x2 + 12x 3
          buildSliverToBoxAdapter(12.w), //
          recommendProductHead(), // 推荐
          RecommendProduct(),
          buildSliverToBoxAdapter(12.w),
        ],
      ),
    );
  }

  Widget loading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitFadingCircle(color: AppColors.Color_E34D59),
      ],
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

  Widget productColorAndSizeEntry() {
    return ColorAndSizeEntryView();
  }

  Widget purchaseInstructionsEntry() {
    return PurchaseInstructionsEntry();
  }

  Widget recommendSet() {
    return RecommendSetEntryView();
  }

  Widget productEvaluation() {
    return RecommendSetEntryView();
  }

  Widget productEvaluationHead() {
    return SliverPersistentHeader(
      pinned: false,
      delegate: SliverHeaderDelegate(
        //有最大和最小高度
        maxHeight: 40.w,
        minHeight: 40.w,
        child: ProductEvaluationHead(),
      ),
    );
  }

  Widget productEvaluationList() {
    return ProductEvaluationList(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 0.w,
      ),
      background: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget productEvaluationBottom() {
    return ProductEvaluationBottom();
  }

  Widget productDescriptionHead() {
    return SliverPersistentHeader(
      pinned: false,
      delegate: SliverHeaderDelegate(
        //有最大和最小高度
        maxHeight: 40.w,
        minHeight: 40.w,
        child: CommonHead(
          title: "商品说明",
        ),
      ),
    );
  }

  Widget productDescription() {
    return ProductDescriptionList(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 12.w,
      ),
      background: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.w),
              bottomRight: Radius.circular(10.w)),
        ),
      ),
    );
  }

  Widget recommendProductHead() {
    return SliverPersistentHeader(
      pinned: false,
      delegate: SliverHeaderDelegate(
        //有最大和最小高度
        maxHeight: 40.w,
        minHeight: 40.w,
        child: CommonHead(
          title: "推荐商品",
        ),
      ),
    );
  }

  Widget RecommendProduct() {
    return RecommendProductList(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 12.w,
      ),
      background: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.w),
              bottomRight: Radius.circular(10.w)),
        ),
      ),
    );
  }
}
