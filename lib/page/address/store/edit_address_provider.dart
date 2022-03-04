import 'package:flutter/material.dart';

import '../../../core/http/request.dart';
import '../../../core/http/response.dart';

import '../../../core/model/my_address_list_model.dart';
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

  TextEditingController name1Controller = TextEditingController();
  TextEditingController name2Controller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  EditAddressProvider({required this.addressModel}) {
    name1Controller.text = addressModel.chineseName;
    name2Controller.text = addressModel.katakanaName;
    phoneController.text = addressModel.phone;
    emailController.text = addressModel.email;
    postController.text = addressModel.zip;
    cityController.text = addressModel.state + " " + addressModel.city;
    addressController.text = addressModel.address;
    state_id = addressModel.stateId;
    state = addressModel.state;

    List<String> list = addressModel.address.split(";");

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
    String address_detail = addressController.text;
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
        address_detail: address_detail,
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

    cityController.text = state + " " + city;
    addressController.text = city + ";" + detailAddress;
  }
}
