import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/page/login/components/login_view.dart';
import 'package:ladyfou/style/Color.dart';

import '../../components/common_label.dart';
import '../../core/utils/privacy.dart';
import '../../core/utils/toast.dart';
import '../../generated/l10n.dart';
import '../../utils/sputils.dart';
import 'components/LoginTabBar.dart';
import 'components/register_view.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 响应空白处的焦点的Node
  FocusNode blankNode = FocusNode();
  List<CommentLabel> labels = [];
  int index = 0;

  @override
  void initState() {
    super.initState();

    labels.add(CommentLabel(
        label: "注册",
        isSelected: true,
        data: 0,
        default_bg: AppColors.color_FFF5F5F5,
        selected_bg: AppColors.transparent,
        default_text_color: AppColors.color_FF333333,
        selected_text_color: AppColors.Color_E34D59,
        selected_borderColor: AppColors.Color_E34D59,
        height: 32.w,
        width: 120.w,
        borderRadius: 16.w,
        useTextWidth: false));
    labels.add(
      CommentLabel(
          label: "登录",
          data: 1,
          default_bg: AppColors.color_FFF5F5F5,
          selected_bg: AppColors.transparent,
          default_text_color: AppColors.color_FF333333,
          selected_text_color: AppColors.Color_E34D59,
          selected_borderColor: AppColors.Color_E34D59,
          height: 32.w,
          width: 120.w,
          borderRadius: 16.w,
          useTextWidth: false),
    );

    if (!SPUtils.isAgreePrivacy()) {
      PrivacyUtils.showPrivacyDialog(context, onAgressCallback: () {
        Navigator.of(context).pop();
        SPUtils.saveIsAgreePrivacy(true);
        ToastUtils.success(S.of(context).agreePrivacy);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => Scaffold(
        backgroundColor: AppColors.white,
        body: GestureDetector(
          onTap: () {
            // 点击空白页面关闭键盘
            closeKeyboard(context);
          },
          child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
              // child: login(),
              child: Column(
                children: [
                  SizedBox(
                    height: 80.w,
                  ),
                  Image.asset("assets/images/login/ladyfou_1.png"),
                  SizedBox(
                    height: 40.w,
                  ),
                  LoginTabBar(
                    dataS: labels,
                    onTap: (CommentLabel model) {
                      setState(() {
                        index = model.data;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  content(),
                ],
              )),
        ),
      ),
    );
  }

  //登录
  Widget content() {
    return IndexedStack(
      index: index,
      children: getTabWidget(context),
    );
  }

  List<Widget> getTabWidget(BuildContext context) => [
        LoginView(),
        RegisterView(),
      ];

  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(blankNode);
  }
}
