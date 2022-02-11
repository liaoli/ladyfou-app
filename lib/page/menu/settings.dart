import 'package:flutter/material.dart';
import 'package:ladyfou/generated/l10n.dart';
import 'package:ladyfou/page/menu/language.dart';
import 'package:ladyfou/page/menu/theme_color.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).settings)),
        body: SingleChildScrollView(
            child: ListBody(children: <Widget>[
          SizedBox(height: 10),
          ListTile(
              leading: Icon(Icons.color_lens),
              title: Text(S.of(context).theme),
              trailing: Icon(Icons.keyboard_arrow_right),
              contentPadding: EdgeInsets.only(left: 20, right: 10),
              onTap: () {
                Get.to(() => ThemeColorPage());
              }),
          ListTile(
            leading: Icon(Icons.language),
            title: Text(S.of(context).language),
            trailing: Icon(Icons.keyboard_arrow_right),
            contentPadding: EdgeInsets.only(left: 20, right: 10),
            onTap: () {
              Get.to(() => LanguagePage());
            },
          ),
        ])));
  }
}
