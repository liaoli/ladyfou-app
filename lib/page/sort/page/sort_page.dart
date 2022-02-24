/*
 * @Descripttion: 分类
 * @FileName: sort_page
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/14/22 1:54 PM
 * @LastEditors: tang
 */


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../../style/text.dart';
import '../../home/components/home_search_nav_bar.dart';
import '../components/left_category_widget.dart';
import '../components/right_category_widget.dart';
import '../store/sort_provider.dart';

// class SortPage extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return ChangeNotifierProvider(create: (_) => SortProvider(),child: SortPageFul());
//   }
// }

class SortPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _SortPageState();
  }
}

class _SortPageState extends State<SortPage> with AutomaticKeepAliveClientMixin {

  int currentPage = 0;
  GlobalKey<RightListViewState> rightListviewKey =
  new GlobalKey<RightListViewState>();
  GlobalKey<CategoryMenueState> categoryMenueKey =
  new GlobalKey<CategoryMenueState>();
  late SortProvider provider;

  @override
  void initState() {
    // TODO: implement initState

    // 状态栏颜色
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    provider = SortProvider();

    // 请求分类数据
    provider.getSortAllDatas();
    //     {
    //   setState(() {
    //
    //   });
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);

    double rightListViewHeight = MediaQuery.of(context).size.height -
        ScreenUtil().statusBarHeight -
        ScreenUtil().bottomBarHeight -
        44.w -
        49.w;
    return ChangeNotifierProvider.value(
        value: provider,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
          // 输入框
          HomeSearchNavBar(),
          _listWidget(context, rightListViewHeight),
        ]),
      ),
    ));
  }

  Widget _listWidget(BuildContext context, double listHeight) {
    return Consumer<SortProvider>(builder: (context, child, value) {
      // 请求失败
      if (child.isRequestError) {
        return Center(child: Text(S.current.erro_message));
      } else {
        // 没数据，说明还在请求中
        if (child.categoryList.isEmpty) {
          return Container(
            width: 375.w,
            height: listHeight - 2,
            child: Center(
              child: SpinKitDualRing(
                  color: AppColors.navigationColor, size: 40, lineWidth: 3),
            ),
          );
        } else {
          return Expanded(
            child: Row(
              children: <Widget>[
                // 左边分类列表
                CategoryWidget(
                  key: categoryMenueKey,
                  items: child.categoryList,
                  itemHeight: 60.w,
                  showHeight: listHeight,
                  menueTaped: menueItemTap,
                ),
                // 右边商品
                RightListView(
                  key: rightListviewKey,
                  height: listHeight,
                  dataItems: child.categoryList,
                  listViewChanged: listViewChanged,
                ),
              ],
            ),
          );
        }
      }
    });
  }

  Widget _searchBarWidget() {
    return GestureDetector(
      onTap: () {
        // BaseNavigation.present('search', context: context);
      },
      child: Container(
        width: 375.w,
        height: ScreenUtil().statusBarHeight + 44.w,
        padding: EdgeInsets.fromLTRB(16.w, ScreenUtil().statusBarHeight, 16.w, 0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 32,
                decoration: new BoxDecoration(
                  color: AppColors.primaryBackground,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 5),
                      child: Image.asset(
                        'assets/images/sort/search_icon_black.png',
                        width: 16,
                        height: 16,
                      ),
                    ),
                    Text(S.current.home_search_name,

                        /// 当前热搜词
                        style: BaseText.style(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.jp_color153,
                        )),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // BaseNavigation.push('mine/news/list', context: context);
              },
              child: Container(
                height: 44,
                padding: EdgeInsets.only(left: 16),
                alignment: Alignment.centerRight,
                child: Image.asset("assets/images/sort/news_icon_black.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  menueItemTap(int i) {
    rightListviewKey.currentState?.jumpTopage(i);
  }

  listViewChanged(i) {
    this.categoryMenueKey.currentState?.moveToTap(i);
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
