import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../style/Color.dart';
import '../../detail/product_detail_page.dart';

class ProductRankList extends StatefulWidget {
  final Widget background;
  final EdgeInsetsGeometry padding;
  final int count;

  const ProductRankList({
    Key? key,
    required this.background,
    required this.padding,
    this.count = 6,
  }) : super(key: key);

  @override
  _ProductRankListState createState() => _ProductRankListState();
}

class _ProductRankListState extends State<ProductRankList> {
  @override
  Widget build(BuildContext context) {
    return SliverStack(
      insetOnOverlap: false, // defaults to false
      children: <Widget>[
        SliverPositioned.fill(
          child: widget.background,
          // child: Container(
          //   // margin: EdgeInsets.symmetric(horizontal: 12.w,),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     // boxShadow: const <BoxShadow>[
          //     //   BoxShadow(
          //     //     offset: Offset(0, 4),
          //     //     blurRadius: 8,
          //     //     color: Colors.black26,
          //     //   )
          //     // ],
          //     // borderRadius: BorderRadius.circular(8),
          //   ),
          // ),
        ),
        SliverPadding(
          padding: widget.padding,
          sliver: SliverGrid(
            //Grid
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //Grid按两列显示
              mainAxisSpacing: 12.w,
              crossAxisSpacing: 12.w,
              childAspectRatio: 158 / 270,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //创建子widget
                return GestureDetector(
                  child: RankProductItemView(
                    index: index,
                  ),
                  onTap: () {
                    Get.to(() => ProductDetailPage());
                  },
                );
              },
              childCount: widget.count,
            ),
          ),
        ),
      ],
    );
  }
}

class ProductCategoryRankList extends StatefulWidget {
  const ProductCategoryRankList({Key? key}) : super(key: key);

  @override
  _ProductCategoryRankListState createState() =>
      _ProductCategoryRankListState();
}

class _ProductCategoryRankListState extends State<ProductCategoryRankList> {
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
        Row(
          children: [
            Visibility(
                visible: index < 3,
                child: Image.asset(
                  "assets/images/home/rank_${index + 1}.png",
                  width: 18.w,
                  height: 18.w,
                )),
            Text(
              "NO.${index + 1}",
              style: TextStyle(
                color: AppColors.color_FF333333,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.w,
        ),
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
                width: 40.w,
                height: 40.w,
                child: SpinKitFadingCircle(color: AppColors.Color_E34D59),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(
          height: 8.w,
        ),
        Text(
          "月销量件数200件",
          style: TextStyle(
            color: AppColors.color_FF999999,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Expanded(
            child: Text(
          "小柄長袖カジュアルスウィート清新パフスリーブボウ...",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            color: AppColors.color_FF222222,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        )),
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
            Text(
              "￥8687",
              style: TextStyle(
                color: AppColors.color_FF353547,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
