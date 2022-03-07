import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/components/button/common_button.dart';
import 'package:provider/provider.dart';

import '../../../style/Color.dart';
import '../store/product_detail_provider.dart';

class ProductInfoView extends StatefulWidget {
  const ProductInfoView({Key? key}) : super(key: key);

  @override
  _ProductInfoViewState createState() => _ProductInfoViewState();
}

class _ProductInfoViewState extends State<ProductInfoView> {
  late ProductDetailProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context, listen: true);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: ClipRRect(
        borderRadius: BorderRadius.all(new Radius.circular(10.w)),
        child: Container(
          padding: EdgeInsets.all(12.w),
          height: 141.w,
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  getProductName(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: AppColors.color_FF333333,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 7.w,
              ),
              Row(
                children: [
                  CommonButton(
                    borderRadius: new BorderRadius.all(Radius.circular(17.w)),
                    width: 32.w,
                    height: 12.w,
                    bg: AppColors.Color_E34D59,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          provider.detailModel!.discount ?? "",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  Text(
                    "￥${provider.detailModel!.listPrice ?? ""}",
                    style: TextStyle(
                      color: AppColors.color_FF353547,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7.w,
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: "￥",
                      style: TextStyle(
                        color: AppColors.Color_E34D59,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: "${provider.detailModel!.price ?? ""}",
                          style: TextStyle(
                            color: AppColors.Color_E34D59,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: "税込",
                          style: TextStyle(
                            color: AppColors.color_FF333333,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    "商品番号:${provider.detailModel!.id ?? ""}",
                    style: TextStyle(
                      color: AppColors.color_FF999999,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 7.w,
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(new Radius.circular(4.w)),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 3.w,
                  ),
                  color: AppColors.color_FCE6E9,
                  child: Text(
                    "【本周内衣类商品TOP1】",
                    style: TextStyle(
                      color: AppColors.Color_E34D59,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getProductName() {
    if (provider.detailModel != null) {
      return provider.detailModel!.name!;
    }

    return "正在加载...";
  }
}
