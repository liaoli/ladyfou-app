/*
 * @Descripttion: TODO
 * @FileName: sort_provider
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/14/22 2:00 PM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:ladyfou/core/http/request.dart';
import 'package:ladyfou/core/http/response.dart';
import 'package:ladyfou/core/model/sort_model.dart';

class SortProvider with ChangeNotifier {
  List<SortModel> categoryList = [];
  bool isRequestError = false;

  Future getSortAllDatas() async {
    MyResponse<List<SortModel>> response = await getSortData();
    if(response.common.statusCode == 1000) {
      categoryList = response.response!.data!;
      notifyListeners();
    }
    else {
      isRequestError = true;
      notifyListeners();
    }
  }
}