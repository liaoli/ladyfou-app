import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/components/button/common_button.dart';
import 'package:ladyfou/style/Color.dart';

class DetailBottomView extends StatefulWidget {
  const DetailBottomView({Key? key}) : super(key: key);

  @override
  _DetailBottomViewState createState() => _DetailBottomViewState();
}

class _DetailBottomViewState extends State<DetailBottomView> {
  late bool like;

  @override
  void initState() {
    like = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double bottomBarHeight = MediaQuery.of(context).padding.bottom;

    final double bottomHeight = 49.w + bottomBarHeight;
    return Container(
      height: bottomHeight,
      padding: EdgeInsets.only(
        bottom: bottomBarHeight,
        left: 24.w,
        right: 24.w,
      ),
      color: AppColors.white,
      child: Row(
        children: [
          GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  like
                      ? "assets/images/history/browsing_history_like.png"
                      : "assets/images/detail/detail_like_black.png",
                ),
                Text(
                  like ? "已收藏" : "收 藏",
                  style: TextStyle(
                    color: AppColors.color_FF333333,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            onTap: () {
              like = !like;
              setState(() {});
            },
          ),
          Expanded(child: SizedBox()),
          CommonButton(
            height: 33.w,
            width: 281.w,
            borderRadius: BorderRadius.all(Radius.circular(17.w)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "加入购物车",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
