import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ladyfou/page/detail/components/thumbs_up_view.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../components/button/common_button.dart';
import '../../../core/model/daily_new_product_list_model.dart';
import '../../../style/Color.dart';
import '../product_detail_page.dart';
import '../store/product_detail_provider.dart';

class RecommendProductList extends StatefulWidget {
  final Widget background;
  final EdgeInsetsGeometry padding;

  const RecommendProductList({
    Key? key,
    required this.background,
    required this.padding,
  }) : super(key: key);

  @override
  _RecommendProductListState createState() => _RecommendProductListState();
}

class _RecommendProductListState extends State<RecommendProductList> {
  @override
  Widget build(BuildContext context) {
    ProductDetailProvider provider = Provider.of(context, listen: false);
    List<DailyNewProduct> data = provider.reCommend;

    return SliverStack(
      insetOnOverlap: false, // defaults to false
      children: <Widget>[
        SliverPositioned.fill(
          child: widget.background,
        ),
        SliverPadding(
          padding: widget.padding,
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
                DailyNewProduct product = data[index];
                return RecommendProductItemView(
                  product: product,
                );
              },
              childCount: data.length,
            ),
          ),
        ),
      ],
    );
  }
}

class RecommendProductItemView extends StatelessWidget {
  final DailyNewProduct product;

  const RecommendProductItemView({
    Key? key,
    required this.product,
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
                  product.fThumb??"",
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
          //     fontSize: 10,
          //     fontWeight: FontWeight.w400,
          //   ),
          // ),
          Expanded(
              child: Text(
            product.name ?? "",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: AppColors.color_FF222222,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          )),

          SizedBox(
            height: 4.w,
          ),
          Row(
            children: [
              Text(
                "￥${product.price ?? 0}",
                style: TextStyle(
                  color: AppColors.Color_E34D59,
                  fontSize: 14,
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
                      product.discount ?? "",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 8,
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
