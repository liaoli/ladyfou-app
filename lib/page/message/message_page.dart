import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ladyfou/components/base_scaffold.dart';
import 'package:ladyfou/page/detail/components/arrow_forward.dart';
import 'package:ladyfou/page/message/sell_info_page.dart';

import '../../core/constant/base_enum.dart';
import '../../style/Color.dart';
import '../mine/order/page/mine_order_page.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<MessageItem> dataS = [];

  @override
  void initState() {
    dataS.add(MessageItem("assets/images/message/cs.png", "客服中心",1));
    dataS.add(MessageItem("assets/images/message/sell_info.png", "优惠信息情报",2));
    dataS.add(MessageItem("assets/images/message/coupon.png", "优惠券信息",3));
    dataS.add(MessageItem("assets/images/message/order.png", "订单页面",4));
    dataS.add(MessageItem("assets/images/message/sign.png", "签到推送",5));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      leadType: AppBarBackType.Back,
      title: "消息中心",
      body: Column(
        children: [Expanded(child: refresh())],
      ),
    );
  }

  Widget refresh() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.w,
      ),
      child: EasyRefresh(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {
            setState(() {});
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 1), () {
            setState(() {});
          });
        },
        child: commentList(),
      ),
    );
  }

  Widget commentList() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.w,
        ),
        itemBuilder: (context, index) {
          return MessageItemView(
            item: dataS[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 12.w,
          );
        },
        itemCount: dataS.length);
  }
}

class MessageItemView extends StatelessWidget {
  final MessageItem item;

  const MessageItemView({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        switch(item.type){
          case 2:
          case 3:
            Get.to(()=>SellInfoPage());
            break;
          case 4:
            Get.to(() => MineOrderPage());
        }
      },
      child:ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
        padding: EdgeInsets.only(left:12.w,top: 12.w,bottom: 12.w),
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(item.icon),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  item.title,
                  style: TextStyle(
                    color: AppColors.color_FF333333,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: SizedBox()),
                ArrowForward(),
              ],
            ),

          ],
        ),
      ),
    ) ,);
  }
}

class MessageItem {
  String icon;
  String title;
  int type;

  MessageItem(this.icon, this.title,this.type);
}
