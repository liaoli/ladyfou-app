import 'package:flutter/material.dart';
import 'package:ladyfou/style/Color.dart';

import '../../../components/horizontal_scroll_tab_bar.dart';
import '../../../core/http/request.dart';
import '../../../core/http/response.dart';
import '../../../core/model/city_list_model.dart';
import '../../../core/model/county_list_model.dart';
import '../../../core/model/province_list_model.dart';
import '../../../core/utils/toast.dart';
import '../components/city_list_view.dart';
import '../components/county_list_view.dart';
import '../components/province_list_view.dart';
import '../model/province_city_county.dart';

const int province_index = 0;
const int city_index = 1;
const int county_index = 2;

class SelectedAddressProvider extends ChangeNotifier {
  ProvinceModel? _provinceModel;

  ProvinceCityCounty get result {
    return ProvinceCityCounty(
        province: _provinceModel, county: _county, city: _city);
  }

  set provinceModel(ProvinceModel? provinceModel) {
    _provinceModel = provinceModel;
    _city = null;
    getCities();
    notifyListeners();
  }

  ProvinceModel? get provinceModel => _provinceModel;

  String? _city;

  set city(String? city) {
    _city = city;
    getCounties();
    notifyListeners();
  }

  String? get city => _city;

  String? _county;

  set county(String? county) {
    _county = county;
    notifyListeners();
  }

  String? get county => _county;

  List<ProvinceModel> provinces = [];
  List<String> cities = [];
  List<String> counties = [];

  final List<TabData> tabS = [];
  TabData provinceTab = TabData(
      selectedTextColor: AppColors.Color_E34D59,
      defaultTextColor: AppColors.color_FF333333,
      selectedLineColor: AppColors.Color_E34D59,
      title: "都道府县选择",
      index: province_index,
      selected: true);
  TabData cityTab = TabData(
    selectedTextColor: AppColors.Color_E34D59,
    defaultTextColor: AppColors.color_FF333333,
    selectedLineColor: AppColors.Color_E34D59,
    title: "町市区选择",
    index: city_index,
  );
  TabData countyTab = TabData(
    selectedTextColor: AppColors.Color_E34D59,
    defaultTextColor: AppColors.color_FF333333,
    selectedLineColor: AppColors.Color_E34D59,
    title: "地区选择",
    index: county_index,
  );

  SelectedAddressProvider() {
    getTabs();
  }

  List<TabData> getTabs() {
    tabS.clear();

    if (_provinceModel == null) {
      provinceTab.title = "都道府县选择";
      tabS.add(provinceTab);
      return tabS;
    } else {
      provinceTab.title = _provinceModel!.name;
      tabS.add(provinceTab);
    }

    if (_city == null) {
      cityTab.title = "町市区选择";
      tabS.add(cityTab);
      return tabS;
    } else {
      cityTab.title = _city!;
      tabS.add(cityTab);
    }

    if (_county == null) {
      countyTab.title = "地区选择";
      tabS.add(countyTab);
      return tabS;
    } else {
      countyTab.title = _county!;
      tabS.add(countyTab);
    }

    return tabS;
  }

  void resetTabs() {
    tabS.forEach((e) {
      e.selected = false;
    });
  }

  List<Widget> getTabWidget(BuildContext context) {
    switch (tabS.length) {
      case 1:
        return [
          ProvinceListView(),
        ];
      case 2:
        return [
          ProvinceListView(),
          CityListView(),
        ];
      case 3:
        return [
          ProvinceListView(),
          CityListView(),
          CountyListView(),
        ];
      default:
        return [];
    }
  }

  Future<MyResponse<ProvinceListModel>> getProvinces() async {
    try {
      MyResponse<ProvinceListModel> result = await getProvinceList();
      ToastUtils.success(result.common.debugMessage);
      if (result.common.statusCode == 1000) {
        provinces.clear();
        provinces.addAll(result.response!.data!.data);
      }
      return result;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }

  Future<MyResponse<CityListModel>> getCities() async {
    try {
      MyResponse<CityListModel> result =
          await getCityList(country: _provinceModel!.name);
      ToastUtils.success(result.common.debugMessage);
      if (result.common.statusCode == 1000) {
        cities.clear();
        cities.addAll(result.response!.data!.data);
      }
      notifyListeners();
      return result;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }

  Future<MyResponse<CountyListModel>> getCounties() async {
    try {
      MyResponse<CountyListModel> result =
          await getCountyList(country: _provinceModel!.name, city: _city!);
      ToastUtils.success(result.common.debugMessage);
      if (result.common.statusCode == 1000) {
        counties.clear();
        counties.addAll(result.response!.data!.data);
      }
      notifyListeners();
      return result;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }
}
