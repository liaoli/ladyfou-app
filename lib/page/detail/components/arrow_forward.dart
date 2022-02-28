import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/Color.dart';

class ArrowForward extends StatefulWidget {
  final Color color;
  final double? size;
  final EdgeInsetsGeometry? padding;

  const ArrowForward(
      {Key? key,
      this.color = AppColors.color_FF030319,
      this.size,
      this.padding})
      : super(key: key);

  @override
  _ArrowForwardState createState() => _ArrowForwardState();
}

class _ArrowForwardState extends State<ArrowForward> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: widget.padding ??
            EdgeInsets.only(left: 12.w, top: 5.w,bottom: 5.w),
        child: Icon(
          Icons.arrow_forward_ios,
          size: widget.size ?? 20.w,
          color: widget.color,
        ),
      ),
      onTap: () {
        // Navigator.pop(context);
      },
    );
  }
}
