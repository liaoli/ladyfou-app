import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ladyfou/page/setting/components/setting_item_view.dart';
import 'package:provider/provider.dart';

import '../../../components/button/common_button.dart';
import '../../../style/Color.dart';
import '../../detail/components/attention_content_view.dart';
import '../../detail/components/comon_forward_item_view.dart';
import '../setting_user_info_page.dart';
import '../store/edit_user_info_provider.dart';
import 'change_password_text_field.dart';

class EditPasswordItemView extends StatefulWidget {
  const EditPasswordItemView({Key? key}) : super(key: key);

  @override
  _EditPasswordItemViewState createState() => _EditPasswordItemViewState();
}

class _EditPasswordItemViewState extends State<EditPasswordItemView> {
  @override
  Widget build(BuildContext context) {
    EditUserUserInfoProvider provider = Provider.of(context, listen: false);
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
                  controller: provider.emailController,
                  onChanged: (String text) {
                    provider.buttonEnable();
                  },
                  bottomText: "请使用登录使用的邮箱号，需要收到验证码消息。",
                ),
                ChangePasswordTextField(
                  hintText: "确认验证码",
                  prefixIcon: "assets/images/login/lock.png",
                  controller: provider.codeController,
                  onChanged: (String text) {
                    provider.buttonEnable();
                  },
                  bottomText: "",
                  left: SendCodeButton(),
                ),
                ChangePasswordTextField(
                  hintText: "新密码输入",
                  prefixIcon: "assets/images/login/lock.png",
                  controller: provider.passwordController,
                  onChanged: (String text) {
                    provider.buttonEnable();
                  },
                  bottomText: "请输入新密码 8位字以上",
                ),
                ChangePasswordTextField(
                  hintText: "再次确认新密码",
                  prefixIcon: "assets/images/login/lock.png",
                  controller: provider.rePasswordController,
                  onChanged: (String text) {
                    provider.buttonEnable();
                  },
                  bottomText: "请再次确认输入的新密码.8位字以上",
                ),
              ],
            )),
      ),
    );
  }
}

class SendCodeButton extends StatefulWidget {
  const SendCodeButton({Key? key}) : super(key: key);

  @override
  _SendCodeButtonState createState() => _SendCodeButtonState();
}

class _SendCodeButtonState extends State<SendCodeButton> {
  late Timer time;

  int count = 60;

  bool enable = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EditUserUserInfoProvider provider = Provider.of(
      context,
    );

    return CommonButton(
      onTap: () {
        provider.sendCode();
      },
      enable: provider.sendCodeEnable,
      height: 24.w,
      width: 84.w,
      borderRadius: BorderRadius.all(Radius.circular(12.w)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            provider.sendCodeEnable ? "发送验证码" : "${provider.count}",
            style: TextStyle(
              color:
                  provider.sendCodeEnable ? AppColors.white : AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
