import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/Color.dart';
import 'address_text_field.dart';

class CommonAddressSwitchView extends StatefulWidget {
  final ValueChanged<bool>? onChanged;

  final bool open;

  const CommonAddressSwitchView({Key? key, this.onChanged, this.open = false})
      : super(key: key);

  @override
  _CommonAddressSwitchViewState createState() =>
      _CommonAddressSwitchViewState();
}

class _CommonAddressSwitchViewState extends State<CommonAddressSwitchView> {
  late bool open;

  @override
  void initState() {
    open = widget.open;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
        height: 49.w,
        color: AppColors.white,
        child: Row(
          children: [
            SizedBox(
              width: 12.w,
            ),
            Text(
              "设为默认地址",
              style: TextStyle(
                color: AppColors.color_FF333333,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            Expanded(child: SizedBox()),
            Switch(
                value: open,
                onChanged: (bool flag) {
                  setState(() {
                    open = flag;
                  });
                })
          ],
        ),
      ),
    );
  }
}
