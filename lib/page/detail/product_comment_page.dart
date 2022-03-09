import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ladyfou/components/base_scaffold.dart';
import 'package:ladyfou/components/circle_image.dart';
import 'package:ladyfou/components/round_rect_image.dart';
import 'package:ladyfou/core/model/product_comment_list_model.dart';
import 'package:ladyfou/page/detail/store/comment_page_provider.dart';
import 'package:ladyfou/utils/net_image_url_util.dart';
import 'package:provider/provider.dart';

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
  late CommentPageProvider provider;

  @override
  void initState() {
    provider = CommentPageProvider();

    provider.getProductReviews(isRefresh: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: BaseScaffold(
        leadType: AppBarBackType.Back,
        title: "商品评价",
        body: ContentView(),
      ),
    );
  }
}

class ContentView extends StatefulWidget {
  const ContentView({Key? key}) : super(key: key);

  @override
  _ContentViewState createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  late CommentPageProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return provider.comment == null ? loading() : hasContent();
  }

  Column hasContent() {
    return Column(
      children: [head(), Expanded(child: refresh())],
    );
  }

  Widget loading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitFadingCircle(color: AppColors.Color_E34D59),
      ],
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
            dataS: provider.labels,
            onTap: (CommonLabelData label) {
              provider.filterImg = label.data;
              provider.refreshController.callRefresh();
            },
          ),
          Expanded(child: SizedBox()),
          Text(
            "共64条",
            style: TextStyle(
              color: AppColors.color_FF333333,
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget refresh() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.w,
      ),
      child: EasyRefresh(
        controller: provider.refreshController,
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {
          await provider.getProductReviews(isRefresh: true);
        },
        onLoad: () async {
          await provider.getProductReviews(isRefresh: false);
        },
        child: commentList(),
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
            comment: provider.comments[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 12.w,
          );
        },
        itemCount: provider.comments.length);
  }
}

class ProductEvaluationItemView extends StatelessWidget {
  final CommentModel comment;

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
                        fontSize: 12,
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
                        fontSize: 10,
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
                          fontSize: 10,
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
              comment.content ?? "",
              style: TextStyle(
                color: AppColors.color_FF333333,
                fontSize: 10,
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
              url: getImageUrl(comment.images[index].path),
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
