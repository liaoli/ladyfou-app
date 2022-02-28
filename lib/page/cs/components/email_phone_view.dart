import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/Color.dart';

class EmailPhoneView extends StatelessWidget {
  final String title;
  final String content;
  final Function(String)? onTab;

  const EmailPhoneView({
    Key? key,
    required this.title,
    required this.content,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        title,
        style: TextStyle(
            color: AppColors.color_FF333333,
            fontSize: 10.w,
            fontWeight: FontWeight.w400),
      ),
      SizedBox(
        width: 12.w,
      ),
      GestureDetector(
        onTap: (){
          if(onTab != null){
            onTab!(content);
          }
        },
        child: Text(
          content,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 10.w,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ]);
  }
}
