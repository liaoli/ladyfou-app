import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/page/setting/components/setting_item_view.dart';

import '../../../components/line.dart';
import '../../../style/Color.dart';
import '../../address/components/address_text_field.dart';
import '../../detail/components/arrow_forward.dart';

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
              leftChild: Switch(
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
