import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/core/http/request.dart';
import 'package:ladyfou/page/login/components/register_view.dart';
import 'package:ladyfou/utils/sputils.dart';
import '../../../components/button/common_button.dart';
import '../../../core/utils/toast.dart';
import '../../../generated/l10n.dart';
import '../../../style/Color.dart';
import '../../../utils/provider.dart';
import 'login_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
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
            hintText: S.of(context).login_email,
            prefixIcon: "assets/images/login/user.png",
            controller: _emailController,
            onChanged: (String text) {
              isEnable();
            }),
        SizedBox(
          height: 15.w,
        ),
        LoginTextField(
          hintText: S.of(context).login_password,
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
                S.of(context).login_button_text,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          onTap: () {
            onSubmit(context);
          },
        )
      ],
    );
  }

  void isEnable() {
    if (_emailController.text.length > 0 && _pwdController.text.length > 0) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {});
  }

  //验证通过提交数据
  void onSubmit(BuildContext context) {
    closeKeyboard(context);
    login(
      email: _emailController.text,
      password: _pwdController.text,
    ).then((value) {
      if (value.common.statusCode == 1000) {
        if (!mounted) {
          return;
        }

        ToastUtils.toast(S.of(context).loginSuccess);

        SPUtils.saveTokenInfo(value.response!.data!);
        Store.of<UserProfile>(context, listen: false).tokenInfoModel =
            value.response!.data!;
        Navigator.of(context).pop();
      } else {
        ToastUtils.error(value.common.debugMessage);
      }
    }).catchError((onError) {
      ToastUtils.error(onError);
    });
  }
}
