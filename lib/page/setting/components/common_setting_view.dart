import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ladyfou/page/setting/components/setting_item_view.dart';

import '../../../components/line.dart';
import '../../../style/Color.dart';
import '../setting_edit_user_info_page.dart';

class CommonSettingView extends StatefulWidget {
  const CommonSettingView({Key? key}) : super(key: key);

  @override
  _CommonSettingViewState createState() => _CommonSettingViewState();
}

class _CommonSettingViewState extends State<CommonSettingView> {
  TextEditingController controller = TextEditingController();

  bool openPush = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
        height: 209.w,
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SettingItemView(
              title: "消息通知推送",
              leftChild: cupertino.CupertinoSwitch(
                  activeColor: AppColors.Color_E34D59,
                  value: openPush,
                  onChanged: (bool flag) {
                    setState(() {
                      openPush = flag;
                    });
                  }),
            ),
            line(),
            SettingItemView(
              title: "密码修改",
              onTap: () {
                Get.to(() => SettingEditUserInfoPage());
              },
            ),
            line(),
            SettingItemView(
              title: "版本号",
            ),
            line(),
            SettingItemView(
              title: "清除缓存",
            ),
            line(),
            SettingItemView(
              title: "Ladyfou介绍",
            ),
          ],
        ),
      ),
    );
  }

  Widget line() {
    return Line(
      color: AppColors.color_EAEAEA,
      height: 1.w,
    );
  }
}
