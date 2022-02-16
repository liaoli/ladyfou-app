import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ladyfou/page/login/register.dart';
import 'package:provider/provider.dart';

import '../../core/http/http.dart';
import '../../core/http/request.dart';
import '../../core/utils/privacy.dart';
import '../../core/utils/toast.dart';
import '../../components/loading_dialog.dart';
import '../../generated/l10n.dart';
import '../../utils/provider.dart';
import '../../utils/sputils.dart';
import '../index.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 响应空白处的焦点的Node
  bool _isShowPassWord = false;
  FocusNode blankNode = FocusNode();
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

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
      builder: () => WillPopScope(
          child: Scaffold(
            appBar: AppBar(
              // leading: _leading(context),
              title: Text(S.of(context).login),
              actions: <Widget>[
                TextButton(
                  child: Text(S.of(context).register,
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Get.to(() => RegisterPage());
                  },
                )
              ],
            ),
            body: GestureDetector(
              onTap: () {
                // 点击空白页面关闭键盘
                closeKeyboard(context);
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                child: buildForm(context),
              ),
            ),
          ),
          onWillPop: () async {
            return Future.value(false);
          }),
    );
  }

  //构建表单
  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: <Widget>[
          Center(
              heightFactor: 1.5,
              child: FlutterLogo(
                size: 64,
              )),
          TextFormField(
              autofocus: false,
              controller: _unameController,
              decoration: InputDecoration(
                  labelText: S.of(context).loginName,
                  hintText: S.of(context).loginNameHint,
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.person)),
              //校验用户名
              validator: (v) {
                return v!.trim().length > 0
                    ? null
                    : S.of(context).loginNameError;
              }),
          TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                  labelText: S.of(context).password,
                  hintText: S.of(context).passwordHint,
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                      icon: Icon(
                        _isShowPassWord
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: showPassWord)),
              obscureText: !_isShowPassWord,
              //校验密码
              validator: (v) {
                return v!.trim().length >= 6
                    ? null
                    : S.of(context).passwordError;
              }),
          // 登录按钮
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(child: Builder(builder: (context) {
                  return ElevatedButton(
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        padding: EdgeInsets.all(15.0)),
                    child: Text(S.of(context).login,
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                      if (Form.of(context)!.validate()) {
                        onSubmit(context);
                      }
                    },
                  );
                })),
              ],
            ),
          )
        ],
      ),
    );
  }

  ///点击控制密码是否显示
  void showPassWord() {
    setState(() {
      _isShowPassWord = !_isShowPassWord;
    });
  }

  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(blankNode);
  }

  //验证通过提交数据
  void onSubmit(BuildContext context) {
    closeKeyboard(context);

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingDialog(
            showContent: false,
            backgroundColor: Colors.black38,
            loadingView: SpinKitCircle(color: Colors.white),
          );
        });

    UserProfile userProfile = Provider.of<UserProfile>(context, listen: false);

    login(username: _unameController.text, password: _pwdController.text)
        .then((response) {
      Navigator.pop(context);
      if (response.common.statusCode == 0) {
        userProfile.nickName = response.response!.data!.username;
        ToastUtils.toast(S.of(context).loginSuccess);
        Get.off(() => IndexPage());
      } else {
        ToastUtils.error(response.common.debugMessage);
      }
    }).catchError((onError) {
      Navigator.of(context).pop();
      ToastUtils.error(onError);
    });
  }
}
