import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../components/button/common_button.dart';
import '../../../style/Color.dart';

class RecommendProductList extends StatefulWidget {
  const RecommendProductList({Key? key}) : super(key: key);

  @override
  _RecommendProductListState createState() => _RecommendProductListState();
}

class _RecommendProductListState extends State<RecommendProductList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
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
          return RankProductItemView(
            index: index,
          );
        },
        childCount: 20,
      ),
    );
  }
}

class ProductCategoryList extends StatefulWidget {
  const ProductCategoryList({Key? key}) : super(key: key);

  @override
  _ProductCategoryListState createState() => _ProductCategoryListState();
}

class _ProductCategoryListState extends State<ProductCategoryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 76.w,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 15.w, top: 0.w, bottom: 6.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: RankProductItemView(
              index: index,
            ),
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 12.w,
          );
        },
        itemCount: 10,
      ),
    );
  }
}

class RankProductItemView extends StatelessWidget {
  final int index;

  const RankProductItemView({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(new Radius.circular(10.w)),
          child: CachedNetworkImage(
            width: 170.w,
            height: 170.w,
            imageUrl:
                "http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg",
                // "https://ccshop-test.oss-cn-shenzhen.aliyuncs.com/uploads/public/61d/938/0c9/61d9380c90cc7134502048.webp",
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
        // Text(
        //   "月销量件数200件",
        //   style: TextStyle(
        //     color: AppColors.color_FF999999,
        //     fontSize: 10.sp,
        //     fontWeight: FontWeight.w400,
        //   ),
        // ),
        // Expanded(
        //     child: Text(
        //   "小柄長袖カジュアルスウィート清新パフスリーブボウ...",
        //   overflow: TextOverflow.ellipsis,
        //   maxLines: 2,
        //   style: TextStyle(
        //     color: AppColors.color_FF222222,
        //     fontSize: 12.sp,
        //     fontWeight: FontWeight.w400,
        //   ),
        // )),
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
    );
  }
}
