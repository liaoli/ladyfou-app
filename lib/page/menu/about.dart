import 'package:flutter/material.dart';
import 'package:ladyfou/core/utils/utils.dart';
import 'package:ladyfou/core/utils/xupdate.dart';
import 'package:ladyfou/generated/l10n.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:ladyfou/style/text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/button/next_button.dart';
import '../../components/list/about_list_item.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String _versionName = '';
  bool _isUpdown = true;

  @override
  void initState() {
    super.initState();
    Utils.getPackageInfo().then((value) => {
          setState(() {
            _versionName = value.version;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "About Us",
            style: myTextStyle(
              color: AppColors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/images/icon_to_back.png',
            ),
          ),
        ),
        body: Container(
            color: AppColors.white,
            child: ListView(children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 51.w),
                  child: Image.asset(
                    "assets/images/Group_2033.png",
                    width: 90.w,
                    height: 90.w,
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10.w),
                  //Group_2033.png
                  child: Center(
                      child: Text("FUD",
                          style: myTextStyle(
                            color: AppColors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          )))),
              Padding(
                  padding: EdgeInsets.only(top: 5.w),
                  //Group_2033.png
                  child: Center(
                      child: Text("${S.of(context).versionName}: $_versionName",
                          style: myTextStyle(
                            color: AppColors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                          )))),
              Center(
                child: _isUpdown
                    ? Container(
                        padding: EdgeInsets.only(top: 20.w),
                        child: NextButton(
                          text: "Update",
                          color: AppColors.Color_E34D59,
                          isLoad: false,
                          height: 30.w,
                          width: 84,
                          fontS: 14,
                          circular: 6,
                          fontW: FontWeight.w300,
                          cb: () {
                            XUpdate.checkUpdateWithErrorTip();
                          },
                        ),
                      )
                    : Container(),
              ),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                color: AppColors.white,
                padding: EdgeInsets.only(left: 5.w),
                child: Column(
                  children: <Widget>[
                    AboutListItem(
                      rightWidget:
                          Image.asset("assets/images/me/icon_back.png"),
                      title: "Terms of Service",
                      titleColor: AppColors.black,
                      onPressed: () {
                        launch('https://github.com/hummingbirdstudio');
                      },
                    ),
                    AboutListItem(
                      rightWidget:
                          Image.asset("assets/images/me/icon_back.png"),
                      title: "Privacy Policies",
                      titleColor: AppColors.black,
                      onPressed: () {
                        launch('https://github.com/hummingbirdstudio/fud-app');
                      },
                    ),
                    AboutListItem(
                      rightWidget:
                          Image.asset("assets/images/me/icon_back.png"),
                      title: "FUD Website",
                      titleColor: AppColors.black,
                      onPressed: () {
                        // XUpdate.checkUpdateWithErrorTip();
                      },
                    )
                  ],
                ),
              ),
            ])));
  }
}
