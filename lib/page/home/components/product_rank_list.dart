import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../style/Color.dart';

class ProductRankList extends StatefulWidget {
  const ProductRankList({Key? key}) : super(key: key);

  @override
  _ProductRankListState createState() => _ProductRankListState();
}

class _ProductRankListState extends State<ProductRankList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        //Grid
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //Grid按两列显示
          mainAxisSpacing: 13.w,
          crossAxisSpacing: 14.w,
          childAspectRatio: 158 / 222,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            //创建子widget
            return RankProductItemView(
              index: index,
            );
          },
          childCount: 6,
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
