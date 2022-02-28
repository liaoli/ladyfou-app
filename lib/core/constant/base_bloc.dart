/*
 * @Descripttion: TODO
 * @FileName: base_bloc
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/15/22 6:33 PM
 * @LastEditors: tang
 */

import 'dart:async';

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

  final _addListenerAlertShow = StreamController<bool>.broadcast();
  Stream<bool> get addListenerAlertShowStream => _addListenerAlertShow.stream;
  void addListenerAlertShow(bool isShow) {
    _addListenerAlertShow.add(isShow);
  }

  final _addListenerConditionShow = StreamController<bool>.broadcast();
  Stream<bool> get addListenerConditionStream => _addListenerConditionShow.stream;

  void addListenerConditionShow(bool isShow) {
    _addListenerConditionShow.add(isShow);
  }

  final _addListenerAllSortShow = StreamController<bool>.broadcast();
  Stream<bool> get addListenerAllSortShowStream => _addListenerAllSortShow.stream;
  void addListenerAllSortShow(bool isShow) {
    _addListenerAllSortShow.add(isShow);
  }

  final _addListenerCollectionAlertShow = StreamController<bool>.broadcast();
  Stream<bool> get addListenerCollectionAlertShowStream => _addListenerCollectionAlertShow.stream;
  void addListenerCollectionAlertShowShow(bool isShow) {
    _addListenerCollectionAlertShow.add(isShow);
  }

  final _addUpdateCollectionAlertShow = StreamController<bool>.broadcast();
  Stream<bool> get addUpdateCollectionAlertStream => _addUpdateCollectionAlertShow.stream;
  void addUpdateCollectionAlertShow(bool isUpdate) {
    _addUpdateCollectionAlertShow.add(isUpdate);
  }

}
