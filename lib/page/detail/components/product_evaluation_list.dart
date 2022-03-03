import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ladyfou/page/detail/components/thumbs_up_view.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../style/Color.dart';

class ProductEvaluationList extends StatefulWidget {
  final Widget background;
  final EdgeInsetsGeometry padding;
  final int count;

  const ProductEvaluationList({
    Key? key,
    required this.background,
    required this.padding,
    this.count = 6,
  }) : super(key: key);

  @override
  _ProductEvaluationListState createState() => _ProductEvaluationListState();
}

class _ProductEvaluationListState extends State<ProductEvaluationList> {
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

          sliver: SliverFixedExtentList(
            itemExtent: 90.w,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //创建列表项
                return ProductEvaluationItemView();
              },
              childCount: 2,
            ),
          ),
          // sliver: SliverGrid(
          //   //Grid
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 1, //Grid按两列显示
          //     mainAxisSpacing: 12.w,
          //     crossAxisSpacing: 12.w,
          //     childAspectRatio: 158 / 270,
          //   ),
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       //创建子widget
          //       return ProductEvaluationItemView();
          //     },
          //     childCount: widget.count,
          //   ),
          // ),
        ),
      ],
    );
  }
}

class ProductEvaluationItemView extends StatelessWidget {
  const ProductEvaluationItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "好人一生平安",
              style: TextStyle(
                color: AppColors.color_FF333333,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "2020-12-25",
              style: TextStyle(
                color: AppColors.color_FF999999,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
            Expanded(child: SizedBox()),
            SizedBox(
              width: 3.w,
            ),
            ThumbsUpView(
              count: 2,
            ),
          ],
        ),
        SizedBox(
          height: 5.w,
        ),
        Row(
          children: [
            RatingBarIndicator(
              rating: 4.5,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: AppColors.Color_E34D59,
              ),
              itemCount: 5,
              itemSize: 16.0,
              unratedColor: Colors.amber.withAlpha(50),
              direction: Axis.horizontal,
            ),
            Text(
              "尺码：L   颜色：黑色",
              style: TextStyle(
                color: AppColors.color_FF666666,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 9.w,
        ),
        Text(
          "とても可愛いですすごくよいです，サイズもちょうどよく大人っぽいデザインで着心地も良いです。",
          style: TextStyle(
            color: AppColors.color_FF333333,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
