import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/core/utils/colorsUtil.dart';
import 'package:ladyfou/style/Color.dart';

class NextButton extends StatelessWidget {
  final Color color;
  final String text;
  final GestureTapCallback? cb;
  final double height;
  final bool isLoad;
  final double width;
  final FontWeight fontW;
  final double fontS;
  final double circular;

  NextButton({
    Key? key,
    this.color = Colors.black,
    this.text = "按钮",
    this.cb,
    this.height = 52,
    this.width = 315,
    this.isLoad = false,
    this.fontW = FontWeight.w500,
    this.fontS = 16,
    this.circular = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: InkWell(
        onTap: this.cb,
        child: Container(
          height: this.height,
          width: width.w,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(circular)),
          child: Center(
              child: Stack(
            alignment: Alignment(-0.22.w, 0),
            children: [
              Container(
                height: 20,
                width: 20,
                child: this.isLoad
                    ? new Image(
                        image: new AssetImage("assets/images/loading.gif"))
                    : Text(""),
              ),
              Center(
                child: Text(
                  "${text}",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: fontS.sp,
                      fontWeight: fontW,
                      fontFamily: "Seravek"),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
