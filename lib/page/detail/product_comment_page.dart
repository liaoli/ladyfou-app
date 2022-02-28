import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/components/base_scaffold.dart';
import 'package:ladyfou/components/circle_image.dart';
import 'package:ladyfou/components/round_rect_image.dart';

import '../../components/button/common_button.dart';
import '../../core/constant/base_enum.dart';
import '../../style/Color.dart';
import '../../components/common_label.dart';
import 'components/thumbs_up_view.dart';

class ProductCommentPage extends StatefulWidget {
  const ProductCommentPage({Key? key}) : super(key: key);

  @override
  _ProductCommentPageState createState() => _ProductCommentPageState();
}

class _ProductCommentPageState extends State<ProductCommentPage> {
  List<Comment> comments = [];
  List<String> img = [
    "http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg",
    "http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/5b3/6203715b36dcb268484339.jpg",
    "http://ccshop-erp.neverdown.cc/storage/app/uploads/public/614/d32/3d5/614d323d524f2537290680.jpg",
  ];

  List<CommonLabelData> labels = [];

  @override
  void initState() {
    resetData();

    labels.add(
        CommonLabelData(label: "全部", isSelected: true, data: 1, height: 24.w));
    labels.add(
      CommonLabelData(label: "带图评论", data: 2, height: 24.w),
    );

    super.initState();
  }

  void resetData() {
    comments.clear();
    for (int i = 0; i < 10; i++) {
      Comment comment = Comment("", i % 4 == 0 ? img : []);
      comments.add(comment);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      leadType: AppBarBackType.Back,
      title: "商品评价",
      body: Column(
        children: [head(), Expanded(child: refresh())],
      ),
    );
  }

  Widget refresh() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.w,
      ),
      child: EasyRefresh(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {
            setState(() {});
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 1), () {
            setState(() {});
          });
        },
        child: commentList(),
      ),
    );
  }

  Widget head() {
    return Container(
      height: 48.w,
      color: AppColors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: Row(
        children: [
          MyTabBar(
            dataS: labels,
            onTap: (CommonLabelData label) {
              if (label.data == 1) {
                resetData();
              } else {
                comments = comments.where((element) {
                  return element.images.length > 0;
                }).toList();
              }

              setState(() {});
            },
          ),
          Expanded(child: SizedBox()),
          Text(
            "共64条",
            style: TextStyle(
              color: AppColors.color_FF333333,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget commentList() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.w,
        ),
        itemBuilder: (context, index) {
          return ProductEvaluationItemView(
            comment: comments[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 12.w,
          );
        },
        itemCount: comments.length);
  }
}

class ProductEvaluationItemView extends StatelessWidget {
  final Comment comment;

  const ProductEvaluationItemView({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
        padding: EdgeInsets.all(12.w),
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleImage(
                  url:
                      "http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg",
                  size: 40.w,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "好人一生平安",
                      style: TextStyle(
                        color: AppColors.color_FF333333,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Text(
                      "2020-12-25",
                      style: TextStyle(
                        color: AppColors.color_FF999999,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                CommonButton(
                  borderRadius: new BorderRadius.all(Radius.circular(11.w)),
                  width: 98.w,
                  height: 22.w,
                  bg: AppColors.color_FFF5F5F5,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "尺码：L   颜色：黑色",
                        style: TextStyle(
                          color: AppColors.color_FF666666,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.w,
            ),
            Text(
              "とても可愛いですすごくよいです，サイズもちょうどよく大人っぽいデザインで着心地も良いです。",
              style: TextStyle(
                color: AppColors.color_FF333333,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            comment.images.length == 0
                ? SizedBox(
                    height: 9.w,
                  )
                : ImageList(),
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
                Expanded(child: SizedBox()),
                ThumbsUpView(
                  count: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget ImageList() {
    return SizedBox(
      height: 114.w,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 6.w,
          ),
          itemBuilder: (context, index) {
            return RoundRectImage(
              height: 102.w,
              width: 102.w,
              url: comment.images[index],
              borderRadius: BorderRadius.all(new Radius.circular(10.w)),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 12.w,
            );
          },
          itemCount: comment.images.length),
    );
  }
}

class Comment {
  String content;
  List<String> images;

  Comment(this.content, this.images);
}

class MyTabBar extends StatefulWidget {
  final List<CommonLabelData> dataS;

  final ValueSetter<CommonLabelData>? onTap;

  const MyTabBar({
    Key? key,
    required this.dataS,
    required this.onTap,
  }) : super(key: key);

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: tabS(),
      ),
    );
  }

  List<Widget> tabS() {
    List<Widget> children = [];

    List<Widget> tabs = widget.dataS.map((e) {
      return GestureDetector(
        child: CommonLabel(model: e),
        onTap: () {
          widget.dataS.forEach((element) {
            element.isSelected = false;
          });

          e.isSelected = true;

          setState(() {});

          widget.onTap!(e);
        },
      );
    }).toList();

    children.addAll(tabs);

    children.insert(
      1,
      SizedBox(
        width: 16.w,
      ),
    );
    return children;
  }
}
