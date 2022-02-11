import 'package:flutter/material.dart';
import 'package:ladyfou/core/utils/toast.dart';
import 'package:ladyfou/core/utils/xuifont.dart';
import 'package:ladyfou/generated/l10n.dart';
import 'package:ladyfou/page/login/login.dart';
import 'package:ladyfou/page/menu/settings.dart';
import 'package:ladyfou/utils/provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer2<UserProfile, AppStatus>(builder: (BuildContext context,
        UserProfile value, AppStatus status, Widget? child) {

      return Drawer(

          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.only(top: 40, bottom: 20),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipOval(
                        // 如果已登录，则显示用户头像；若未登录，则显示默认头像
                        child: FlutterLogo(
                          size: 80,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      value.nickName != null
                          ? value.nickName
                          : S.of(context).title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ))
                  ],
                ),
              ),
              onTap: () {
                ToastUtils.toast("点击头像");
              },
            ),
            MediaQuery.removePadding(
              context: context,
              // DrawerHeader consumes top MediaQuery padding.
              removeTop: true,

              child: ListView(
                shrinkWrap: true, //为true可以解决子控件必须设置高度的问题
                physics: NeverScrollableScrollPhysics(), //禁用滑动事件
                scrollDirection: Axis.vertical, // 水平listView
                children: <Widget>[
                  //首页
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text(S.of(context).home),
                    onTap: () {
                      status.tabIndex = TAB_HOME_INDEX;
                      Navigator.pop(context);
                    },
                    selected: status.tabIndex == TAB_HOME_INDEX,
                  ),
                  ListTile(
                    leading: Icon(Icons.list),
                    title: Text(S.of(context).category),
                    onTap: () {
                      status.tabIndex = TAB_CATEGORY_INDEX;
                      Navigator.pop(context);
                    },
                    selected: status.tabIndex == TAB_CATEGORY_INDEX,
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text(S.of(context).game),
                    onTap: () {
                      status.tabIndex = TAB_GAME_INDEX;
                      Navigator.pop(context);
                    },
                    selected: status.tabIndex == TAB_GAME_INDEX,
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(S.of(context).me),
                    onTap: () {
                      status.tabIndex = TAB_PROFILE_INDEX;
                      Navigator.pop(context);
                    },
                    selected: status.tabIndex == TAB_PROFILE_INDEX,
                  ),
                  ListTile(
                    leading: Icon(Icons.local_activity),
                    title: Text(S.of(context).history),
                    onTap: () {
                      status.tabIndex = TAB_HISTORY_INDEX;
                      Navigator.pop(context);
                    },
                    selected: status.tabIndex == TAB_HISTORY_INDEX,
                  ),
                  //设置、关于、赞助
                  Divider(height: 1.0, color: Colors.grey),
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text("Blacked"),
                    onTap: () {
                      Navigator.pop(context);
                      Get.toNamed('/me/blacked-page');

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(S.of(context).settings),
                    onTap: () {
                      Get.to(() => SettingsPage());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.error_outline),
                    title: Text(S.of(context).about),
                    onTap: () {
                      Navigator.pop(context);
                      Get.toNamed('/menu/about-page');

                    },
                  ),
                  //退出
                  Divider(height: 1.0, color: Colors.grey),
                  ListTile(
                    leading: Icon(XUIIcons.logout),
                    title: Text(S.of(context).logout),
                    onTap: () {
                      value.nickName = "";
                      // SPUtils.saveToken("");//清楚token
                      Get.offAll(() => LoginPage());
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ));
    });
  }
}
