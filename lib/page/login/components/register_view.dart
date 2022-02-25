import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/button/common_button.dart';
import '../../../style/Color.dart';
import 'login_text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  TextEditingController _uNameController = TextEditingController();
  TextEditingController _UPJMController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginTextField(
          hintText: "名字",
          prefixIcon: "assets/images/login/user.png",
          controller: _uNameController,
        ),
        SizedBox(
          height: 15.w,
        ),
        LoginTextField(
          hintText: "片假名",
          prefixIcon: "assets/images/login/user.png",
          controller: _UPJMController,
        ),
        SizedBox(
          height: 15.w,
        ),
        LoginTextField(
          hintText: "邮箱地址",
          prefixIcon: "assets/images/login/mail.png",
          controller: _emailController,
        ),
        SizedBox(
          height: 15.w,
        ),
        LoginTextField(
          hintText: "密码",
          prefixIcon: "assets/images/login/lock.png",
          suffixIcon_hide: "assets/images/login/eye_close.png",
          suffixIcon_show: "assets/images/login/eye_open.png",
          controller: _pwdController,
        ),
        SizedBox(
          height: 110.w,
        ),
        CommonButton(
          height: 44.w,
          width: 260.w,
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "完成注册并登陆",
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
}
