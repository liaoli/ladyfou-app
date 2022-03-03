import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/components/clicked_Image_asset.dart';
import 'package:ladyfou/style/Color.dart';

import 'components/browsing_history_list_item_view.dart';

class BrowsingHistoryPage extends StatefulWidget {
  const BrowsingHistoryPage({Key? key}) : super(key: key);

  @override
  _BrowsingHistoryPageState createState() => _BrowsingHistoryPageState();
}

class _BrowsingHistoryPageState extends State<BrowsingHistoryPage> {
  late int count = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          head(),
          Expanded(
            child: refresh(),
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
      child: EasyRefresh.custom(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {
            setState(() {
              count = 20;
            });
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 1), () {
            setState(() {
              count += 20;
            });
          });
        },
        slivers: <Widget>[
          historyList(),
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
      child: Row(
        children: [
          Text(
            "今日浏览商品",
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

  Widget historyList() {
    return SliverPadding(
      padding: EdgeInsets.only(left: 12.w, top: 2.w, bottom: 2.w, right: 12.w),
      sliver: SliverGrid(
        //Grid
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //Grid按两列显示
          mainAxisSpacing: 12.w,
          crossAxisSpacing: 6.w,
          childAspectRatio: 110 / 138,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            //创建子widget
            return BrowsingHistoryListItemView();
          },
          childCount: count,
        ),
      ),
    );
  }
}
