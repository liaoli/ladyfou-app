import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ladyfou/components/button/common_button.dart';
import 'package:ladyfou/page/login/components/login_view.dart';
import 'package:provider/provider.dart';

import '../../core/http/request.dart';
import '../../core/utils/privacy.dart';
import '../../core/utils/toast.dart';
import '../../components/loading_dialog.dart';
import '../../generated/l10n.dart';
import '../../style/Color.dart';
import '../../utils/provider.dart';
import '../../utils/sputils.dart';
import '../index.dart';
import 'components/login_text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 响应空白处的焦点的Node
  FocusNode blankNode = FocusNode();

  @override
  void initState() {
    super.initState();
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
        body: GestureDetector(
          onTap: () {
            // 点击空白页面关闭键盘
            closeKeyboard(context);
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
            child: login(),
          ),
        ),
      ),
    );
  }

  //构建表单
  Widget login() {
    return LoginView();
  }

  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(blankNode);
  }
}
