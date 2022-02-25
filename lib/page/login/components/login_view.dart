import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/button/common_button.dart';
import '../../../style/Color.dart';
import 'login_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  bool enable = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginTextField(
            hintText: "邮箱地址",
            prefixIcon: "assets/images/login/user.png",
            controller: _unameController,
            onChanged: (String text) {
              isEnable();
            }),
        SizedBox(
          height: 15.w,
        ),
        LoginTextField(
          hintText: "密码",
          prefixIcon: "assets/images/login/lock.png",
          suffixIcon_hide: "assets/images/login/eye_close.png",
          suffixIcon_show: "assets/images/login/eye_open.png",
          controller: _pwdController,
          onChanged: (String text) {
            isEnable();
          },
        ),
        SizedBox(
          height: 110.w,
        ),
        CommonButton(
          enable: enable,
          height: 44.w,
          width: 260.w,
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "登  录",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void isEnable() {
    if (_unameController.text.length > 0 && _pwdController.text.length > 0) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {});
  }
}
