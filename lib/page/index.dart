import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ladyfou/components/blur_bottom_bar/my_blur_bottom_bar.dart';
import 'package:ladyfou/core/utils/click.dart';
import 'package:ladyfou/core/utils/xupdate.dart';
import 'package:ladyfou/page/game/game_main_page.dart';
import 'package:ladyfou/page/sort/page/sort_page.dart';
import 'package:ladyfou/utils/provider.dart';
import 'package:provider/provider.dart';

import '../components/web_view_page.dart';
import '../generated/l10n.dart';
import '../style/Color.dart';
import 'history/browsing_history_page.dart';
import 'home/home_page.dart';
import 'mine/mine_page.dart';
import 'menu/menu_drawer.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<TabBarModel> tabs = [
    TabBarModel(
        title: S.current.home,
        defaultImg: "assets/images/bottom_tab/tab_home_default.png",
        selectedImg: "assets/images/bottom_tab/tab_home_selected.png",
        selected: true,
        size: 24),
    TabBarModel(
      title: S.current.category,
      defaultImg: "assets/images/bottom_tab/tab_category_defualt.png",
      selectedImg: "assets/images/bottom_tab/tab_category_selected.png",
      size: 24,
    ),
    TabBarModel(
      title: S.current.game,
      defaultImg: "assets/images/bottom_tab/tab_game_defalult.png",
      selectedImg: "assets/images/bottom_tab/tab_game_defalult.png",
      // selectedTextColor: AppColors.color_FF333333,
      size: 24,
    ),
    TabBarModel(
      title: S.current.me,
      defaultImg: "assets/images/bottom_tab/tab_profile_default.png",
      selectedImg: "assets/images/bottom_tab/tab_profile_selected.png",
      size: 24,
    ),
    TabBarModel(
      title: S.current.history,
      defaultImg: "assets/images/bottom_tab/tab_history_default.png",
      selectedImg: "assets/images/bottom_tab/tab_history_selected.png",
      size: 24,
    )
  ];

  List<Widget> getTabWidget(BuildContext context) => [
        HomePage(),
        SortPage(),
        GameMainPage(),
        MinePage(),
        BrowsingHistoryPage(),
      ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  YYDialog? permissionDialog; //Dialog 统一用这个

  @override
  void initState() {
    XUpdate.initAndCheck();
    super.initState();
  }

  @override
  void dispose() {
    permissionDialog?.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => Consumer(
        builder: (BuildContext context, AppStatus status, Widget? child) {
          return WillPopScope(
              child: Scaffold(
                key: _scaffoldKey,
                drawer: MenuDrawer(),
                endDrawer: MenuDrawer(),
                body: Column(
                  children: [
                    Expanded(
                      child: IndexedStack(
                        index: status.tabIndex,
                        children: getTabWidget(context),
                      ),
                    ),
                    MyBlurBottomView(
                        tabModels: tabs,
                        currentIndex: status.tabIndex,
                        onIndexChange: (val) {
                          if (val == 4) {
                            showModalBottomSheet(
                              // backgroundColor: AppColors.transparent,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.w),
                              ),
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: 502.w,
                                  child: ClipRRect(
                                    //剪裁为圆角矩形
                                    borderRadius: BorderRadius.circular(10.w),
                                    child: Container(
                                      width: double.infinity,
                                      height: 502.w,
                                      color: AppColors.white,
                                      alignment: Alignment.centerLeft,
                                      child: BrowsingHistoryPage(),
                                    ),
                                  ),
                                );
                              },
                            );
                            return;
                          }
                          status.tabIndex = val;
                        })
                  ],
                ),
              ),
              //监听导航栏返回,类似onKeyEvent
              onWillPop: () =>
                  ClickUtils.exitBy2Click(status: _scaffoldKey.currentState!));
        },
      ),
    );
  }

  YYDialog YYDialogDemo(BuildContext context) {
    return YYDialog().build(context)
      ..width = 295.w
      ..height = 259.w
      ..borderRadius = 20.w
      ..widget(
        Padding(
          padding: EdgeInsets.all(0.0),
          child: Text("center"),
        ),
      )
      ..show();
  }

  void go2Game() {
    Get.to(() => WebViewPage());
  }
}
