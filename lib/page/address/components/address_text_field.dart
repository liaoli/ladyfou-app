import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';

class AddressTextField extends StatefulWidget {
  final String prefixIcon;
  final String? title;
  final TextEditingController controller;
  final bool obscureText;
  final Function(String)? onChanged;
  final Widget? leftChild;
  final Color borderColor;
  final bool enable;

  const AddressTextField(
      {Key? key,
      this.prefixIcon = "assets/images/login/user.png",
      this.obscureText = false,
      this.title,
      this.onChanged,
      this.leftChild,
      this.enable = true,
      this.borderColor = AppColors.color_EAEAEA,
      required this.controller})
      : super(key: key);

  @override
  _AddressTextFieldState createState() => _AddressTextFieldState();
}

class _AddressTextFieldState extends State<AddressTextField> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: widget.borderColor, width: 1),
        ),
      ),
      child: Row(
        children: [
          Image.asset(widget.prefixIcon),
          SizedBox(
            width: 2.w,
          ),
          Text(
            widget.title!,
            style: TextStyle(
              color: AppColors.color_C4C4C4,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: 14,
          ),
          Expanded(
            child: TextField(
              enabled: widget.enable,
              controller: widget.controller,
              obscureText: obscureText,
              onChanged: widget.onChanged,
              style: TextStyle(
                color: AppColors.color_FF333333,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: AppColors.color_C4C4C4,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          widget.leftChild ?? SizedBox()
        ],
      ),
    );
  }
}
