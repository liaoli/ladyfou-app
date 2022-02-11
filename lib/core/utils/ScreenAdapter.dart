
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ScreenAdaper{

  static init(context){

    ScreenUtil.init(BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(750, 1624),
        orientation: Orientation.portrait);

  }
  static sp(double value){
    return ScreenUtil().setSp(value);  /// 获取 计算后的字体
  }
  static height(double value){

    return  ScreenUtil().setHeight(value);  /// 获取 计算后的高度
  }
  static width(double value){
    return ScreenUtil().setWidth(value);    /// 获取 计算后的宽度
  }
  static getScreenHeight(){
    return  ScreenUtil().screenHeight;  /// 获取 计算后的屏幕高度
  }
  static getScreenWidth(){
    return  ScreenUtil().screenWidth;  /// 获取 计算后的屏幕高度
  }
  static statusBarHeight(){
    return  ScreenUtil().statusBarHeight;  /// 获取 计算后的状态栏高度
  }
  static bottomBarHeight(){
    return  ScreenUtil().bottomBarHeight;  /// 获取 计算后的底部安全高度
  }
}
class ScreenAdapter{

  static init(context){
    ScreenUtil.init(BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(750, 1334),
        orientation: Orientation.portrait);
  }
  static height(double value){
    return ScreenUtil().setHeight(value);
  }
  static width(double value){
    return ScreenUtil().setWidth(value);
  }
  static getScreenHeight(){
    return ScreenUtil().screenHeight;
  }
  static getScreenWidth(){
    return ScreenUtil().screenWidth;
  }

  static size(double value){
    return ScreenUtil().setSp(value);
  }

// ScreenUtil.screenHeight
}