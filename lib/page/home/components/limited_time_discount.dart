import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ladyfou/style/Color.dart';

class LimitedTimeDiscount extends StatefulWidget {
  const LimitedTimeDiscount({Key? key}) : super(key: key);

  @override
  _LimitedTimeDiscountState createState() => _LimitedTimeDiscountState();
}

class _LimitedTimeDiscountState extends State<LimitedTimeDiscount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 198,
      width: double.infinity,
      child: Column(
        children: [
          head(),
          LimitDiscountList(),
        ],
      ),
    );
  }

  Container head() {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage('assets/images/home/limit_time_discount_head_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 12,
          ),
          Text(
            "限时折扣",
            style: TextStyle(color: AppColors.white, fontSize: 14),
          ),
          SizedBox(
            width: 12,
          ),
          DiscountCountdown(),
          Expanded(
              child: SizedBox(
            width: 1,
          )),
          Image.asset(
            "assets/images/home/limit_time_discount_arrow.png",
            width: 20,
            height: 20,
          ),
          SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}

class DiscountCountdown extends StatefulWidget {
  const DiscountCountdown({Key? key}) : super(key: key);

  @override
  _DiscountCountdownState createState() => _DiscountCountdownState();
}

class _DiscountCountdownState extends State<DiscountCountdown> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        countItem("00"),
        buildSizedBox(),
        textItem("天"),
        buildSizedBox(),
        countItem("00"),
        buildSizedBox(),
        textItem("时"),
        buildSizedBox(),
        countItem("00"),
        buildSizedBox(),
        textItem("分"),
      ],
    );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
      width: 4,
    );
  }

  Text textItem(String text) {
    return Text(
      text,
      style: TextStyle(color: AppColors.white, fontSize: 10),
    );
  }

  Widget countItem(String text) {
    return ClipRRect(
      borderRadius: new BorderRadius.all(new Radius.circular(5)),
      child: Container(
        color: AppColors.white,
        width: 20,
        height: 20,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.Color_E34D59,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

class LimitDiscountList extends StatelessWidget {
  const LimitDiscountList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 148,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 15, top: 12, bottom: 12),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: DiscountItemView(),
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 12,
          );
        },
        itemCount: 5,
      ),
    );
  }
}

class DiscountItemView extends StatelessWidget {
  const DiscountItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          //剪裁为圆角矩形
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            width: 86,
            height: 86,
            imageUrl:
                "http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg",
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: SpinKitFadingCircle(color: AppColors.Color_E34D59),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          "￥4475",
          style: TextStyle(
            color: AppColors.Color_E34D59,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "￥8687",
          style: TextStyle(
            color: AppColors.Color_E34D59,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
