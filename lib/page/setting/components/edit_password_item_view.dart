import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ladyfou/page/setting/components/setting_item_view.dart';

import '../../../components/button/common_button.dart';
import '../../../style/Color.dart';
import '../../detail/components/attention_content_view.dart';
import '../../detail/components/comon_forward_item_view.dart';
import '../setting_user_info_page.dart';
import 'change_password_text_field.dart';

class EditPasswordItemView extends StatefulWidget {
  const EditPasswordItemView({Key? key}) : super(key: key);

  @override
  _EditPasswordItemViewState createState() => _EditPasswordItemViewState();
}

class _EditPasswordItemViewState extends State<EditPasswordItemView> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => SettingUserInfoPage());
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(new Radius.circular(10.w)),
        child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.w,
            ),
            height: 282.w,
            color: AppColors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChangePasswordTextField(
                  hintText: "输入邮箱号",
                  prefixIcon: "assets/images/login/lock.png",
                  controller: _pwdController,
                  onChanged: (String text) {},
                  bottomText: "请使用登录使用的邮箱号，需要收到验证码消息。",
                ),
                ChangePasswordTextField(
                  hintText: "确认验证码",
                  prefixIcon: "assets/images/login/lock.png",
                  controller: _pwdController,
                  onChanged: (String text) {},
                  bottomText: "",
                  left: CommonButton(
                    height: 24.w,
                    width: 84.w,
                    borderRadius: BorderRadius.all(Radius.circular(12.w)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "发送验证码",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ChangePasswordTextField(
                  hintText: "新密码输入",
                  prefixIcon: "assets/images/login/lock.png",
                  controller: _pwdController,
                  onChanged: (String text) {},
                  bottomText: "请输入新密码 8位字以上",
                ),
                ChangePasswordTextField(
                  hintText: "再次确认新密码",
                  prefixIcon: "assets/images/login/lock.png",
                  controller: _pwdController,
                  onChanged: (String text) {},
                  bottomText: "请再次确认输入的新密码.8位字以上",
                ),
              ],
            )),
      ),
    );
  }
}
