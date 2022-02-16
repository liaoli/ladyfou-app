/*
 * @Descripttion: TODO
 * @FileName: base_bloc
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/15/22 6:33 PM
 * @LastEditors: tang
 */

import 'base_enum.dart';

typedef GetObject = Function(dynamic object);

class BaseBloc {

  factory BaseBloc() => _getInstance();

  static BaseBloc get instance => _getInstance();
  static BaseBloc? _instance;

  static BaseBloc _getInstance() {
    if (_instance == null) {
      _instance = new BaseBloc._internal();
    }
    return _instance!;
  }

  BaseBloc._internal() {
    //初始化...
  }

  //获取用户选择的列表展示模式
  DisplayType _displayType = DisplayType.grid_shape;
  // ignore: unnecessary_getters_setters
  DisplayType get displayType => _displayType;
  // ignore: unnecessary_getters_setters
  set displayType(DisplayType type) {
    _displayType = type;
  }


}