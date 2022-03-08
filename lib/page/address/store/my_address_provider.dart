import 'package:flutter/material.dart';

import '../../../core/http/request.dart';
import '../../../core/http/response.dart';

import '../../../core/model/my_address_list_model.dart';
import '../../../core/model/no_data_model.dart';
import '../../../core/utils/toast.dart';

class MyAddressProvider extends ChangeNotifier {
  List<AddressModel>? addressList ; //我的地址列表


  //验证通过提交数据
  Future<void> getData(BuildContext context) async {
    await myAddressList();
  }

  Future<MyResponse<MyAddressListModel>> myAddressList() async {
    try {
      MyResponse<MyAddressListModel> result = await getAddressList();
      ToastUtils.success(result.common.debugMessage);
      if (result.common.statusCode == 1000) {

        if(addressList == null ){
          addressList = [];
        }

        addressList!.clear();
        addressList!.addAll(result.response!.data!.list);
      }
      notifyListeners();
      return result;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }

  Future<MyResponse<NoDataModel>> deleteAddressById(
      {required int addressId}) async {
    try {
      MyResponse<NoDataModel> result = await deleteAddress(id: addressId);
      ToastUtils.success(result.common.debugMessage);
      if (result.common.statusCode == 1000) {}
      notifyListeners();
      return result;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }
}
