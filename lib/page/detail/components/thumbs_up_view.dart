import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/Color.dart';

class ThumbsUpView extends StatefulWidget {
  final int count;

  const ThumbsUpView({Key? key, this.count = 2}) : super(key: key);

  @override
  _ThumbsUpViewState createState() => _ThumbsUpViewState();
}

class _ThumbsUpViewState extends State<ThumbsUpView> {
  late int count;
  bool clicked = false;

  @override
  void initState() {
    count = widget.count;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        clicked = !clicked;

        if (clicked) {
          count += 1;
        } else {
          count -= 1;
        }
        setState(() {});
      },
      child: Row(
        children: [
          Image.asset(clicked
              ? "assets/images/detail/thumbs_up_red.png"
              : "assets/images/detail/thumbs_up_grey.png"),
          Text(
            "$count",
            style: TextStyle(
              color: AppColors.Color_E34D59,
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
