import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ladyfou/components/blur_bottom_bar/my_blur_bottom_bar.dart';
import 'package:ladyfou/core/utils/click.dart';
import 'package:ladyfou/core/utils/xupdate.dart';
import 'package:ladyfou/page/sort/page/sort_page.dart';
import 'package:ladyfou/utils/provider.dart';
import 'package:provider/provider.dart';

import '../components/web_view_page.dart';
import '../generated/l10n.dart';
import '../style/Color.dart';
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
      selectedTextColor: AppColors.color_FF333333,
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
        // DiscoverPage(),
        // TabActivityPage(),
        // TabMePage(),
        // Center(child: Text(S.current.category)),
        SortPage(),
        Center(child: Text(S.current.game)),
        MinePage(),
        Center(child: Text(S.current.history)),
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
      designSize: Size(350, 812),
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
                          if (val == 2) {
                            go2Game();
                            return;
                          }
                          // setState(() {
                          //   if (val > 2) {
                          //     status.tabIndex = val - 1;
                          //   } else {
                          //     status.tabIndex = val;
                          //   }
                          // });

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
