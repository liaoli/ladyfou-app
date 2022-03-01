import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/Color.dart';

class Circular extends StatelessWidget {
  final Color color;
  final double? width;

  final double? height;

  const Circular({
    Key? key,
    this.color = AppColors.color_FFF5F5F5,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: width ?? 14.w,
        height: width ?? 14.w,
        color: color,
      ),
    );
  }
}
