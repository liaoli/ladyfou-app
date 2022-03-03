import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';

import 'clicked_Image_asset.dart';

class CountEditView extends StatefulWidget {
  const CountEditView({Key? key}) : super(key: key);

  @override
  _CountEditViewState createState() => _CountEditViewState();
}

class _CountEditViewState extends State<CountEditView> {
  int count = 0;

  TextEditingController controller = TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 20.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        border: new Border.all(color: AppColors.Color_FF939597, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              count -= 1;
              if (count < 0) {
                count = 0;
              }
              controller.text = count.toString();
            },
            child: Container(
              width: 23.w,
              height: 20.w,
              child: Center(
                child: Image.asset(
                  "assets/images/detail/minus.png",
                ),
              ),
            ),
          ),
          Container(
            width: 32.w,
            height: 20.w,
            decoration: BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(color: AppColors.Color_FF939597, width: 1),
              ),
            ),
            child: TextField(
              controller: controller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              onChanged: (String text) {
                if (text.isEmpty) {
                  count = 0;
                } else {
                  count = int.parse(text);
                }
              },
              style:
                  TextStyle(fontSize: 12, color: AppColors.color_FF333333),
              autofocus: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: 3.w,
                ),
                hintStyle:
                    TextStyle(color: AppColors.color_FF999999, fontSize: 12.sp),
                hintText: "0",
                isDense: true,
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              count += 1;
              controller.text = count.toString();
            },
            child: Container(
              width: 23.w,
              height: 20.w,
              child: Center(
                child: Image.asset(
                  "assets/images/detail/plus.png",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
