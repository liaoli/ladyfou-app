/*
 * @Descripttion: TODO
 * @FileName: base_scaffold
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/15/22 5:07 PM
 * @LastEditors: tang
 */

import 'package:flutter/material.dart';

import '../core/constant/base_enum.dart';
import '../style/Color.dart';
import '../style/text.dart';

class BaseScaffold extends Scaffold {
  BaseScaffold({
    String? title,
    PreferredSizeWidget? appBar,
    Widget? body,
    List<Widget>? actions,
    AppBarBackType leadType = AppBarBackType.Back,
    WillPopCallback? onWillPop,
    Brightness brightness = Brightness.light,
    Widget? floatingActionButton,
    Color appBarBackgroundColor = Colors.white,
    Color titleColor = AppColors.primaryBlackText51,
    bool centerTitle = true,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    bool isResizeToAvoidBottomInset = true, // 输入框是否随键盘顶起
  }) : super(
          appBar: appBar ??
              BaseAppBar(
                brightness: Brightness.light,
                leadingType: leadType,
                onWillPop: onWillPop ?? onWillPop,
                actions: actions ?? actions,
                centerTitle: centerTitle,
                title: MyTitle(title ?? '', color: titleColor),
                backgroundColor: appBarBackgroundColor,
              ),
          backgroundColor: AppColors.primaryBackground,
          body: body ?? body,
          floatingActionButton: floatingActionButton ?? floatingActionButton,
          floatingActionButtonLocation:
              floatingActionButtonLocation ?? floatingActionButtonLocation,
          resizeToAvoidBottomInset: isResizeToAvoidBottomInset,
        );
}

// 自定义 AppBar
class BaseAppBar extends AppBar implements PreferredSizeWidget {
  BaseAppBar(
      {Key? key,
      Widget? title,
      AppBarBackType? leadingType,
      WillPopCallback? onWillPop,
      Widget? leading,
      PreferredSizeWidget? bottom,
      Widget? flexibleSpace,
      Brightness? brightness,
      Color? backgroundColor,
      List<Widget>? actions,
      bool centerTitle = true,
      double? elevation})
      : super(
          key: key ?? key,
          title: title ?? title,
          bottom: bottom ?? bottom,
          flexibleSpace: flexibleSpace ?? flexibleSpace,
          centerTitle: centerTitle,
          // brightness: brightness ?? Brightness.light,
          backgroundColor: backgroundColor ?? Color(0xfffefefe),
          leading: leading ??
              (leadingType == AppBarBackType.None
                  ? Container()
                  : AppBarBack(
                      leadingType ?? AppBarBackType.Back,
                      onWillPop: onWillPop ?? onWillPop,
                    )),
          actions: actions ?? actions,
          elevation: elevation ?? 0.5,
        );
  @override
  get preferredSize => Size.fromHeight(44.0);
}

// 自定义返回按钮
class AppBarBack extends StatelessWidget {
  final AppBarBackType? _backType;
  final Color? color;
  final WillPopCallback? onWillPop;

  AppBarBack(this._backType, {this.onWillPop, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final willBack = onWillPop == null ? true : await onWillPop!();
        if (!willBack) return;
        Navigator.pop(context);
      },
      child: _backType == AppBarBackType.Close
          ? Container(
              child: Icon(Icons.close,
                  color: color ?? Color(0xFF222222), size: 24.0),
            )
          : Container(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: Image.asset(
                'assets/images/home/nav_back.png',
                color: color,
              ),
            ),
    );
  }
}

class MyTitle extends StatelessWidget {
  final String? _title;
  final Color? color;

  MyTitle(this._title, {this.color});

  @override
  Widget build(BuildContext context) {
    return Text(_title!,
        style: BaseText.style(
            color: color ?? AppColors.primaryBlackText,
            fontSize: 16,
            fontWeight: FontWeight.w700));
  }
}
