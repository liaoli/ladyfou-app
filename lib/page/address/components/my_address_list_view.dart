import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ladyfou/core/model/my_address_list_model.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:provider/provider.dart';

import '../../../components/dialog/tip_dialog.dart';
import '../edit_address_page.dart';
import '../store/my_address_provider.dart';

class MyAddressListView extends StatefulWidget {
  const MyAddressListView({Key? key}) : super(key: key);

  @override
  _MyAddressListViewState createState() => _MyAddressListViewState();
}

class _MyAddressListViewState extends State<MyAddressListView> {
  @override
  Widget build(BuildContext context) {
    MyAddressProvider provider = Provider.of(context);

    if (provider.addressList == null) {
      return loading();
    }

    if (provider.addressList!.isEmpty) {
      return noData();
    }

    return SliverPadding(
      padding: EdgeInsets.zero,
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, //Grid按两列显示
          mainAxisSpacing: 12.w,
          crossAxisSpacing: 12.w,
          childAspectRatio: 351 / 81,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            AddressModel model = provider.addressList![index];
            return GestureDetector(
              child: SellInfoItemView(
                address: model,
                delete: (AddressModel addressModel) {
                  provider
                      .deleteAddressById(addressId: addressModel.id)
                      .then((value) {
                    provider.getData(context);
                  });
                },
              ),
              onTap: () {
                // Get.to(() => ProductDetailPage());
              },
            );
          },
          childCount: provider.addressList!.length,
        ),
      ),
    );
  }

  Widget loading() {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            child: SpinKitFadingCircle(color: AppColors.Color_E34D59),
            padding: EdgeInsets.only(
              top: 200.w,
            ),
          ),
        ],
      ),
    );
  }

  Widget noData() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 84.w,
          ),
          Image.asset("assets/images/no_address.png"),
          SizedBox(
            height: 10.w,
          ),
          Text(
            "暂无收货地址",
            style: TextStyle(
              color: AppColors.color_FF666666,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class SellInfoItemView extends StatelessWidget {
  final AddressModel address;
  final Function(AddressModel address) delete;

  const SellInfoItemView({
    Key? key,
    required this.address,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyAddressProvider provider = Provider.of(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.w,
        ),
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  address.katakanaName,
                  style: TextStyle(
                    color: AppColors.color_FF333333,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  address.phone,
                  style: TextStyle(
                    color: AppColors.color_FF333333,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Expanded(child: SizedBox()),
                GestureDetector(
                  child: Row(
                    children: [
                      Image.asset("assets/images/edit.png"),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "编辑",
                        style: TextStyle(
                          color: AppColors.color_FF333333,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Get.to(() => EditAddressPage(
                              model: address,
                            ))!
                        .then((value) {
                      provider.getData(context);
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 4.w,
            ),
            Text(
              address.address,
              style: TextStyle(
                color: AppColors.color_FF333333,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 4.w,
            ),
            Row(
              children: [
                Visibility(
                  child: Row(
                    children: [
                      Image.asset("assets/images/selected.png"),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "默认地址",
                        style: TextStyle(
                          color: AppColors.color_FF999999,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                  visible: address.isDefault == 1,
                ),
                Text(
                  address.state + address.city,
                  style: TextStyle(
                    color: AppColors.color_FF999999,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Expanded(child: SizedBox()),
                GestureDetector(
                  child: Row(
                    children: [
                      Image.asset("assets/images/trash.png"),
                      SizedBox(
                        width: 3.w,
                      ),
                    ],
                  ),
                  onTap: () {
                    TipDialog(context, sure: () {
                      delete(address);
                    }, cancel: () {});

                    // delete(address);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
