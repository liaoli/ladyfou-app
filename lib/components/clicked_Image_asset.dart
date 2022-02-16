import 'package:flutter/material.dart';

class ClickedImageAsset extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final Function()? onTap;

  const ClickedImageAsset({
    Key? key,
    required this.image,
    required this.width,
    required this.height,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(
        image,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
      onTap: onTap,
    );
  }
}
