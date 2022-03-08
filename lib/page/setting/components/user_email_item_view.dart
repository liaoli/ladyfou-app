import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ladyfou/page/setting/components/setting_item_view.dart';

import '../../../core/common/global.dart';
import '../../../style/Color.dart';
import '../../detail/components/attention_content_view.dart';
import '../../detail/components/comon_forward_item_view.dart';
import '../setting_user_info_page.dart';

class UserEmailItemView extends StatefulWidget {
  const UserEmailItemView({Key? key}) : super(key: key);

  @override
  _UserEmailItemViewState createState() => _UserEmailItemViewState();
}

class _UserEmailItemViewState extends State<UserEmailItemView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      child: GestureDetector(
        onTap: () {
          Get.to(() => SettingUserInfoPage());
        },
        child: ClipRRect(
          borderRadius: BorderRadius.all(new Radius.circular(10.w)),
          child: Container(
            height: 41.w,
            color: AppColors.white,
            child: SettingItemView(
              title: "邮箱号",
              subTitle: Global.tokenInfo.email,
            ),
          ),
        ),
      ),
    );
  }
}
