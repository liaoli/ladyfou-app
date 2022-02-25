import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/Color.dart';
import '../../../components/common_label.dart';

class LoginTabBar extends StatefulWidget {
  final List<CommentLabel> dataS;

  final ValueSetter<CommentLabel>? onTap;

  const LoginTabBar({
    Key? key,
    required this.dataS,
    required this.onTap,
  }) : super(key: key);

  @override
  _LoginTabBarState createState() => _LoginTabBarState();
}

class _LoginTabBarState extends State<LoginTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: tabS(),
      ),
    );
  }

  List<Widget> tabS() {

    List<Widget> tabs = widget.dataS.map((e) {
      return GestureDetector(
        child: CommonLabel(model: e),
        onTap: () {
          widget.dataS.forEach((element) {
            element.isSelected = false;
          });

          e.isSelected = true;

          setState(() {});

          widget.onTap!(e);
        },
      );
    }).toList();



    return tabs;
  }
}


