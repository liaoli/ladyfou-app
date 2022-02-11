import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ladyfou/generated/l10n.dart';
import 'package:ladyfou/router/router.dart';
import 'utils.dart';

//隐私弹窗工具
class PrivacyUtils {
  PrivacyUtils._internal();

  //隐私服务政策地址
  static const PRIVACY_URL =
      'https://gitee.com/xuexiangjys/fud_app/raw/master/LICENSE';

  static void showPrivacyDialog(BuildContext context,
      {required VoidCallback onAgressCallback}) {
    Utils.getPackageInfo().then((packageInfo) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(S.of(context).reminder),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(S.of(context).welcome(packageInfo.appName)),
                  SizedBox(height: 5),
                  Text(S.of(context).welcome1),
                  SizedBox(height: 5),
                  Text.rich(TextSpan(children: [
                    TextSpan(text: S.of(context).welcome2),
                    TextSpan(
                        text: S.of(context).privacyName(packageInfo.appName),
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            XRouter.goWeb(
                                PRIVACY_URL,
                                S.of(context)
                                    .privacyName(packageInfo.appName));
                          }),
                    TextSpan(text: S.of(context).welcome3),
                  ])),
                  SizedBox(height: 5),
                  Text.rich(TextSpan(children: [
                    TextSpan(text: S.of(context).welcome4),
                    TextSpan(
                        text: S.of(context).privacyName(packageInfo.appName),
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            XRouter.goWeb(
                                PRIVACY_URL,
                                S.of(context)
                                    .privacyName(packageInfo.appName));
                          }),
                    TextSpan(text: S.of(context).welcome5),
                  ])),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(S.of(context).disagree),
                onPressed: () {
                  Navigator.of(context).pop();
                  showPrivacySecond(context,
                      onAgressCallback: onAgressCallback);
                },
              ),
              TextButton(
                child: Text(S.of(context).agree),
                onPressed: onAgressCallback == null
                    ? () {
                        Navigator.of(context).pop();
                      }
                    : onAgressCallback,
              ),
            ],
          );
        },
      );
    });
  }

  ///第二次提醒
  static void showPrivacySecond(BuildContext context,
      {required VoidCallback onAgressCallback}) {
    Utils.getPackageInfo().then((packageInfo) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(S.of(context).reminder),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(S.of(context)
                      .privacyExplainAgain(packageInfo.appName)),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(S.of(context).stillDisagree),
                onPressed: () {
                  Navigator.of(context).pop();
                  showPrivacyThird(context, onAgressCallback: onAgressCallback);
                },
              ),
              TextButton(
                child: Text(S.of(context).lookAgain),
                onPressed: () {
                  Navigator.of(context).pop();
                  showPrivacyDialog(context,
                      onAgressCallback: onAgressCallback);
                },
              ),
            ],
          );
        },
      );
    });
  }

  ///第三次提醒
  static void showPrivacyThird(BuildContext context,
      {required VoidCallback onAgressCallback}) {
    Utils.getPackageInfo().then((packageInfo) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(S.of(context).thinkAboutItAgain),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(S.of(context).exitApp),
                onPressed: () {
                  //退出程序
                  // SystemNavigator.pop();
                  exit(0);
                },
              ),
              TextButton(
                child: Text(S.of(context).lookAgain),
                onPressed: () {
                  Navigator.of(context).pop();
                  showPrivacyDialog(context,
                      onAgressCallback: onAgressCallback);
                },
              ),
            ],
          );
        },
      );
    });
  }
}
