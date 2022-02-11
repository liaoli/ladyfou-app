import 'package:flutter/material.dart';
import 'package:ladyfou/generated/l10n.dart';
import 'package:ladyfou/utils/provider.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    LocaleModel localeModel = Provider.of<LocaleModel>(context);
    S s = S.of(context);

    Widget _buildLanguageItem(String lan, value) {
      return ListTile(
        title: Text(
          lan,
          // 对APP当前语言进行高亮显示
          style: TextStyle(color: localeModel.locale == value ? color : null),
        ),
        trailing:
            localeModel.locale == value ? Icon(Icons.done, color: color) : null,
        onTap: () {
          // 此行代码会通知MaterialApp重新build
          localeModel.locale = value;
        },
      );
    }

    return Scaffold(
        appBar: AppBar(title: Text(s.language)),
        body: ListView(
          children: <Widget>[
            _buildLanguageItem(s.english, "en_US"),
            _buildLanguageItem(s.chinese, "zh_CN"),
            _buildLanguageItem(s.auto, LOCALE_FOLLOW_SYSTEM),
          ],
        ));
  }
}
