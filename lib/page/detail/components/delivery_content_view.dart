import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/page/detail/components/arrow_forward.dart';
import 'package:ladyfou/style/Color.dart';

import '../../../components/clicked_Image_asset.dart';

class DeliveryContentView extends StatefulWidget {
  const DeliveryContentView({Key? key}) : super(key: key);

  @override
  _DeliveryContentViewState createState() => _DeliveryContentViewState();
}

class _DeliveryContentViewState extends State<DeliveryContentView> {
  @override
  Widget build(BuildContext context) {
    double bottomBarHeight = MediaQuery.of(context).padding.bottom;
    return Container(
      color: AppColors.white,
      width: 375.w,
      child: Column(
        children: [
          head(),
          Container(
            width: double.infinity,
            height: 2.w,
            color: AppColors.color_FFF5F5F5,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                item("配送", "订单满9999元可以参与全场商品包邮"),
                item("佐川急便(999元)", "5~7工作日送达",
                    contentColor: AppColors.color_F6AD2A),
                item("佐将急便(1999元)", "3~4工作日送达",
                    contentColor: AppColors.color_F6AD2A),
                item("您的地区", "请选择地址",
                    contentColor: AppColors.color_FF333333, showArrow: true),
                item("预估送达时间", "选择地址后显示"),
              ],
            ),
          ),
          SizedBox(
            height: bottomBarHeight,
          ),
        ],
      ),
    );
  }

  Widget item(String title, String content,
      {Color contentColor = AppColors.color_FF999999, bool showArrow = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.color_FF333333,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(child: SizedBox()),
          Text(
            content,
            style: TextStyle(
              color: contentColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Visibility(
            visible: showArrow,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 16.w,
              color: AppColors.color_FF333333,
            ),
          ),
        ],
      ),
    );
  }

  Widget head() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      height: 44.w,
      width: 375.w,
      child: Row(
        children: [
          Text(
            "配送",
            style: TextStyle(
              color: AppColors.color_FF333333,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(child: SizedBox()),
          ClickedImageAsset(
            image: "assets/images/history/browsing_history_close.png",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
