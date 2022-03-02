

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/line.dart';
import '../../../style/Color.dart';

class AddressListItem extends StatelessWidget {

  final double susHeight;
  final String text;
  const AddressListItem({Key? key,required this.susHeight,this.text = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: susHeight,
          color: AppColors.white,
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text(
               text,
                style: TextStyle(
                  color: AppColors.color_FF333333,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(
                  child: SizedBox(
                    width: 1,
                  )),
              SizedBox(
                width: 20,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Line(
            width: double.infinity,
            height: 1.w,
          ),
        )
      ],
    );
  }
}


class AddressSusItem extends StatelessWidget {

  final double susHeight;
  final String tag;

  const AddressSusItem({Key? key,required this.susHeight,this.tag = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.0),
      color: AppColors.color_FFF5F5F5,
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: TextStyle(
          color: AppColors.color_FF666666,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
