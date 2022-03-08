import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/http/request.dart';
import '../../../core/http/response.dart';

import '../../../core/model/no_data_model.dart';
import '../../../core/utils/toast.dart';

class EditUserUserInfoProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  int count = 60;

  late Timer time;

  EditUserUserInfoProvider() {}

  bool sendCodeEnable = true; //是否可以发送验证码

  void startTime() {
    //发送验证码之后 开始倒计时
    sendCodeEnable = false;
    count = 60;
    time = Timer.periodic(Duration(seconds: 1), (timer) {
      if (count <= 0) {
        sendCodeEnable = true;
        notifyListeners();
        timer.cancel();
        return;
      }
      count = count - 1;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  bool enable = false; //去人按钮是否可以点击

  void buttonEnable() {
    String code = codeController.text;
    String password = passwordController.text;
    String rePassword = rePasswordController.text;
    String email = codeController.text;

    if (code.isNotEmpty &&
        password.length >= 8 &&
        rePassword.length >= 8 &&
        email.isNotEmpty) {
      enable = true;
    } else {
      enable = false;
    }

    notifyListeners();
  }

  //验证通过提交数据
  Future<void> getData(BuildContext context) async {}

  Future<MyResponse<NoDataModel>> sendCode() async {
    String email = emailController.text;

    if (email.isEmpty) {
      ToastUtils.error("请输入新邮箱");
      throw Exception("没输入新邮箱");
    }

    try {
      MyResponse<NoDataModel> result = await sendEmailCode(email: email);
      ToastUtils.success(result.common.debugMessage);
      if (result.common.statusCode == 1000) {}
      startTime();
      notifyListeners();
      return result;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }

  Future<MyResponse<NoDataModel>> reset() async {
    String code = codeController.text;
    String password = passwordController.text;
    String rePassword = rePasswordController.text;

    if (password.isEmpty) {
      ToastUtils.error("请输入新密码");
      throw Exception("没输入新密码");
    }

    if (rePassword.isEmpty) {
      ToastUtils.error("请确认新密码");
      throw Exception("没确认新密码");
    }

    if (password != rePassword) {
      ToastUtils.error("密码不一致");
      throw Exception("密码不一致");
    }

    if (code.isEmpty) {
      ToastUtils.error("请输入验证码");
      throw Exception("没有验证码");
    }

    try {
      MyResponse<NoDataModel> result = await resetPassword(
        code: code,
        password: password,
        re_password: rePassword,
      );
      ToastUtils.success(result.common.debugMessage);
      if (result.common.statusCode == 1000) {}
      notifyListeners();
      return result;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }
}
