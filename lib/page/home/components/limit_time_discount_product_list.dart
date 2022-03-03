import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../components/button/common_button.dart';
import '../../../core/constant/constant.dart';
import '../../../core/utils/event.dart';
import '../../../style/Color.dart';

class LimitTimeDiscountProductList extends StatefulWidget {
  final EdgeInsetsGeometry padding;
  final int count;

  const LimitTimeDiscountProductList({
    Key? key,
    required this.padding,
    this.count = 6,
  }) : super(key: key);

  @override
  _LimitTimeDiscountProductListState createState() =>
      _LimitTimeDiscountProductListState();
}

class _LimitTimeDiscountProductListState
    extends State<LimitTimeDiscountProductList> {
  int style = 0;

  late StreamSubscription<int> styleSubscription;

  @override
  void initState() {
    styleSubscription =
        XEvent.on<int>(EVENT_KEY_CHANGE_LIMIT_PRODUCT_LIST_STYLE, (int value) {
      if (mounted) {
        setState(() {
          style = value;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    styleSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: widget.padding,
      sliver: SliverGrid(
        gridDelegate: style == 0
            ? SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 12.w,
                crossAxisSpacing: 12.w,
                childAspectRatio: 170 / 258,
              )
            : SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, //Grid按两列显示
                mainAxisSpacing: 12.w,
                crossAxisSpacing: 12.w,
                childAspectRatio: 351 / 116,
              ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {

            //创建子widget
            if(style == 0){
             return  DiscountProductItemViewTwo(
               index: index,
             );
            }
            return DiscountProductItemViewOne(
              index: index,
            );
          },
          childCount: widget.count,
        ),
      ),
    );
  }
}

class DiscountProductItemViewOne extends StatelessWidget {
  final int index;

  const DiscountProductItemViewOne({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(new Radius.circular(10.w)),
              child: CachedNetworkImage(
                width: 92.w,
                height: 92.w,
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
              width: 10.w,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.w,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "小柄長袖カジュアルスウィート清新パフスリーブボウ...",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              color: AppColors.color_FF222222,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Row(
                      children: [
                        CommonButton(
                          borderRadius:
                              new BorderRadius.all(Radius.circular(17.w)),
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
                                  fontSize: 8,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "￥8687",
                          style: TextStyle(
                            color: AppColors.color_FF353547,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Row(
                      children: [
                        Text(
                          "￥4475",
                          style: TextStyle(
                            color: AppColors.Color_E34D59,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        LimitTimeDiscountScore(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        color: AppColors.white,
      ),
    );
  }
}

class DiscountProductItemViewTwo extends StatelessWidget {
  final int index;

  const DiscountProductItemViewTwo({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: Material(
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
                    width: 40.w,
                    height: 40.w,
                    child: SpinKitFadingCircle(color: AppColors.Color_E34D59),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 6.w,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "小柄長袖カジュアルスウィート清新パフスリーブボウ...",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: AppColors.color_FF222222,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      CommonButton(
                        borderRadius:
                            new BorderRadius.all(Radius.circular(17.w)),
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
                                fontSize: 8,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "￥8687",
                        style: TextStyle(
                          color: AppColors.color_FF353547,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      Text(
                        "￥4475",
                        style: TextStyle(
                          color: AppColors.Color_E34D59,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      LimitTimeDiscountScore(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        color: AppColors.white,
      ),
    );
  }
}

class LimitTimeDiscountScore extends StatelessWidget {
  const LimitTimeDiscountScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/images/limit_time_discount_star.png",
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          "4.5",
          style: TextStyle(
            color: AppColors.Color_E34D59,
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
