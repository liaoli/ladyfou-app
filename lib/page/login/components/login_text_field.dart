import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';

class LoginTextField extends StatefulWidget {
  final String prefixIcon;
  final String? suffixIcon_show;
  final String? suffixIcon_hide;
  final String? hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Function(String)? onChanged;

  const LoginTextField(
      {Key? key,
      this.prefixIcon = "assets/images/login/user.png",
      this.suffixIcon_hide,
      this.suffixIcon_show,
      this.obscureText = false,
      this.hintText,
      this.onChanged,
      required this.controller})
      : super(key: key);

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.color_EAEAEA, width: 1),
        ),
      ),
      child: Row(
        children: [
          Image.asset(widget.prefixIcon),
          SizedBox(
            width: 7,
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
          widget.suffixIcon_show == null
              ? SizedBox()
              : GestureDetector(
                  child: Image.asset(obscureText
                      ? widget.suffixIcon_show!
                      : widget.suffixIcon_hide!),
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
        ],
      ),
    );
  }
}
