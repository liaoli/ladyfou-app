import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ladyfou/page/detail/components/thumbs_up_view.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../components/button/common_button.dart';
import '../../../style/Color.dart';
import '../product_detail_page.dart';

class RecommendProductList extends StatefulWidget {
  final Widget background;
  final EdgeInsetsGeometry padding;
  final int count;

  const RecommendProductList({
    Key? key,
    required this.background,
    required this.padding,
    this.count = 10,
  }) : super(key: key);

  @override
  _RecommendProductListState createState() => _RecommendProductListState();
}

class _RecommendProductListState extends State<RecommendProductList> {
  @override
  Widget build(BuildContext context) {
    return SliverStack(
      insetOnOverlap: false, // defaults to false
      children: <Widget>[
        SliverPositioned.fill(
          child: widget.background,
        ),
        SliverPadding(
          padding: widget.padding,

          // sliver: SliverFixedExtentList(
          //   itemExtent: 90.w,
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       //创建列表项
          //       return ProductEvaluationItemView();
          //     },
          //     childCount: 2,
          //   ),
          // ),
          sliver: SliverGrid(
            //Grid
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //Grid按两列显示
              mainAxisSpacing: 12.w,
              crossAxisSpacing: 12.w,
              childAspectRatio: 158 / 207,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //创建子widget
                return ProductDescriptionItemView();
              },
              childCount: widget.count,
            ),
          ),
        ),
      ],
    );
  }
}

class ProductDescriptionItemView extends StatelessWidget {
  const ProductDescriptionItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(new Radius.circular(10.w)),
            child: CachedNetworkImage(
              width: 158.w,
              height: 158.w,
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
                  width: 20.w,
                  height: 20.w,
                  child: SpinKitFadingCircle(color: AppColors.Color_E34D59),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: 6.w,
          ),
          // Text(
          //   "月销量件数200件",
          //   style: TextStyle(
          //     color: AppColors.color_FF999999,
          //     fontSize: 10.sp,
          //     fontWeight: FontWeight.w400,
          //   ),
          // ),
          Expanded(
              child: Text(
            "小柄長袖カジュアルスウィート清新パフスリーブボウ...",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: AppColors.color_FF222222,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          )),

          SizedBox(
            height: 4.w,
          ),
          Row(
            children: [
              Text(
                "￥4475",
                style: TextStyle(
                  color: AppColors.Color_E34D59,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              CommonButton(
                borderRadius: new BorderRadius.all(Radius.circular(17.w)),
                width: 32.w,
                height: 12.w,
                bg: AppColors.Color_E34D59,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "-21%",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      onTap: () {
        Get.to(() => ProductDetailPage());
      },
    );
  }
}
