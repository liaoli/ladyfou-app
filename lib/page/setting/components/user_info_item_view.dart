import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/page/setting/components/setting_item_view.dart';

import '../../../style/Color.dart';
import '../../detail/components/attention_content_view.dart';
import '../../detail/components/comon_forward_item_view.dart';

class UserInfoItemView extends StatefulWidget {
  const UserInfoItemView({Key? key}) : super(key: key);

  @override
  _UserInfoItemViewState createState() => _UserInfoItemViewState();
}

class _UserInfoItemViewState extends State<UserInfoItemView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      child: GestureDetector(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.all(new Radius.circular(10.w)),
          child: Container(
            height: 41.w,
            color: AppColors.white,
            child: SettingItemView(
              title: "个人资料",
            ),
          ),
        ),
      ),
    );
  }
}
