import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ladyfou/page/detail/components/thumbs_up_view.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../style/Color.dart';

class ProductDescriptionList extends StatefulWidget {
  final Widget background;
  final EdgeInsetsGeometry padding;
  final int count;

  const ProductDescriptionList({
    Key? key,
    required this.background,
    required this.padding,
    this.count = 2,
  }) : super(key: key);

  @override
  _ProductDescriptionListState createState() => _ProductDescriptionListState();
}

class _ProductDescriptionListState extends State<ProductDescriptionList> {
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
              crossAxisCount: 1, //Grid按两列显示
              mainAxisSpacing: 12.w,
              crossAxisSpacing: 12.w,
              childAspectRatio: 1 / 1,
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
    return  ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: CachedNetworkImage(
        width: 327.w,
        height: 327.w,
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
    );
  }
}
