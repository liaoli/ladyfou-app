import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';

class ChangePasswordTextField extends StatefulWidget {
  final String prefixIcon;
  final String? hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Function(String)? onChanged;
  final Widget? left;
  final String bottomText;

  const ChangePasswordTextField(
      {Key? key,
      this.prefixIcon = "assets/images/login/user.png",
      this.obscureText = false,
      this.hintText,
      this.onChanged,
      this.left,
      this.bottomText = "",
      required this.controller})
      : super(key: key);

  @override
  _ChangePasswordTextFieldState createState() =>
      _ChangePasswordTextFieldState();
}

class _ChangePasswordTextFieldState extends State<ChangePasswordTextField> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.color_EAEAEA, width: 1),
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 0,
              ),
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  obscureText: obscureText,
                  onChanged: widget.onChanged,
                  style: TextStyle(
                    color: AppColors.color_FF333333,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      color: AppColors.color_C4C4C4,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              widget.left ?? SizedBox()
            ],
          ),
        ),
        Text(
          widget.bottomText,
          style: TextStyle(
            color: AppColors.color_C4C4C4,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
