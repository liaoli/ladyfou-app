import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:ladyfou/style/text.dart';

class CustomNavBar extends StatelessWidget {
  final Function()? goBack;
  final String title;
  final Widget? leftItem;
  final Widget? rightItem;
  final TextAlign? titleAlign;
  final TextStyle? titleStyle;

  const CustomNavBar(
      {required this.title,
      this.goBack,
      this.leftItem,
      this.rightItem,
      this.titleAlign = TextAlign.center,
      this.titleStyle});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      height: 44.w + statusBarHeight,
      padding: EdgeInsets.only(top: statusBarHeight),
      width: double.infinity,
      child: Padding(
        child: Row(
          children: [
            this.renderLeftItem(),
            Expanded(
              flex: 1,
              child: Text(
                this.title,
                textAlign: this.titleAlign,
                style: this.titleStyle ??
                    myTextStyle(
                      color: AppColors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            this.renderRightItem()
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
      ),
    );
  }

  Widget renderLeftItem() {
    if (this.goBack != null) {
      return GestureDetector(
        child: Image.asset(
          "assets/images/icon_to_back.png",
          width: 24.w,
          height: 24.w,
        ),
        onTap: this.goBack,
      );
    }
    if (this.leftItem != null) {
      return this.leftItem!;
    }
    return Container();
  }

  Widget renderRightItem() {
    if (this.rightItem != null) {
      return this.rightItem!;
    }
    return SizedBox(
      width: 24.w,
    );
  }
}
