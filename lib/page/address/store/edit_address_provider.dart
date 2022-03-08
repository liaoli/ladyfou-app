import 'package:flutter/material.dart';
import 'package:ladyfou/core/model/province_list_model.dart';

import '../../../core/http/request.dart';
import '../../../core/http/response.dart';

import '../../../core/model/my_address_list_model.dart';
import '../../../core/model/zip_address_list_model.dart';
import '../../../core/utils/toast.dart';
import '../model/province_city_county.dart';

class EditAddressProvider extends ChangeNotifier {
  late AddressModel addressModel;
  bool isDefault = false;

  late int state_id;
  late String state;

  late String city;

  late String county;

  late String detailAddress;
  late String zip;

  TextEditingController name1Controller = TextEditingController();
  TextEditingController name2Controller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  FocusNode addressFocusNode = FocusNode();

  EditAddressProvider({required this.addressModel}) {
    addressFocusNode.addListener(() {
      if (addressFocusNode.hasFocus) {
        String text = addressController.text;
        addressController.selection = TextSelection.fromPosition(
            TextPosition(
                affinity: TextAffinity.downstream, offset: text.length));
      }
    });

    name1Controller.text = addressModel.chineseName;
    name2Controller.text = addressModel.katakanaName;
    phoneController.text = addressModel.phone;
    emailController.text = addressModel.email;
    postController.text = addressModel.zip;
    cityController.text = addressModel.state + " " + addressModel.city;
    addressController.text = addressModel.address;
    state_id = addressModel.stateId;
    state = addressModel.state;
    zip = addressModel.zip;
    List<String> list = addressModel.address.split(";");

    isDefault = addressModel.isDefault == 1;
    city = addressModel.city;
    county = list[0];
    detailAddress = list[1];
  }

  //验证通过提交数据
  Future<void> getData(BuildContext context) async {}

  Future<MyResponse<AddressModel>> saveAddress() async {
    String phone = phoneController.text;
    String zip = postController.text;
    String chinese_name = name1Controller.text;
    String katakana_name = name2Controller.text;

    String text = addressController.text;

    List<String> list = text.split(";");

    if (list.length > 1) {
      detailAddress = list[1];
      detailAddress = detailAddress.replaceAll(";", "");
    } else {
      ToastUtils.error("请输入详细地址");
    }

    String email = emailController.text;

    int is_default = isDefault ? 1 : 0;

    int? address_id = null;

    address_id = addressModel.id;

    try {
      MyResponse<AddressModel> result = await updateAddress(
        phone: phone,
        zip: zip,
        chinese_name: chinese_name,
        katakana_name: katakana_name,
        address_id: address_id,
        city: city,
        address: county,
        email: email,
        address_detail: detailAddress,
        is_default: is_default,
        state_id: state_id,
      );
      ToastUtils.success(result.common.debugMessage);
      if (result.common.statusCode == 1000) {}
      notifyListeners();
      return result;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }

  void setProvinceCityCounty(ProvinceCityCounty value) {
    county = value.county!;
    city = value.city!;
    state_id = value.province!.id;
    detailAddress = "";
    state = value.province!.name;

    updateAdd();
    getZip();
  }

  void updateAdd() {
    cityController.text = state + " " + city;
    postController.text = zip;
    addressController.text = county + ";" + detailAddress;
  }

  Future<MyResponse<ZipAddressModel>> getZip() async {
    try {
      MyResponse<ZipAddressModel> result =
      await getZIPByAddress(country: state, city: city, town: county);
      ToastUtils.success(result.common.debugMessage);
      if (result.common.statusCode == 1000) {
        ZipAddressModel model = result.response!.data!;
        state = model.county;
        city = model.county;
        county = model.town;
        zip = model.zipCode;
        updateAdd();
      }
      return result;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }

  Future<MyResponse<ZipAddressListModel>> getAddress() async {
    try {
      MyResponse<ZipAddressListModel> result =
      await getAddressByZIP(zip: postController.text);
      ToastUtils.success(result.common.debugMessage);
      if (result.common.statusCode == 1000) {
        ZipAddressModel model = result.response!.data!.data[0];

        state = model.county;
        city = model.county;
        county = model.town;
        zip = model.zipCode;
        state_id =  ProvinceListModel.getProvinceByName(state).id;
        updateAdd();
      }

      return result;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }
}
