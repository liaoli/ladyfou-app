import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../components/button/common_button.dart';
import '../../../core/model/daily_new_product_list_model.dart';
import '../../../style/Color.dart';
import '../../detail/product_detail_page.dart';

class RecommendProductList extends StatefulWidget {
  final EdgeInsetsGeometry padding;

  final List<DailyNewProduct> data;
  const RecommendProductList({Key? key, this.padding = EdgeInsets.zero,this.data = const []})
      : super(key: key);

  @override
  _RecommendProductListState createState() => _RecommendProductListState();
}

class _RecommendProductListState extends State<RecommendProductList> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: widget.padding,
      sliver: SliverGrid(
        //Grid
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //Grid按两列显示
          mainAxisSpacing: 12.w,
          crossAxisSpacing: 12.w,
          childAspectRatio: 170 / 216,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            //创建子widget
            DailyNewProduct product = widget.data[index];
            return RecommendProductItemView(
              product: product,
            );
          },
          childCount: widget.data.length,
        ),
      ),
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
              width: 170.w,
              height: 170.w,
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
            height: 8.w,
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
