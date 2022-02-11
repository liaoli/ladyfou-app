import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  final String default_img;
  final String selected_img;
  final bool checked;
  final double width;
  final double height;
  final Function(bool) onCheck;

  const CheckBox({
    Key? key,
    this.default_img = "assets/images/live/check_box_default.png",
    this.selected_img = "assets/images/live/check_box_selected.png",
    this.checked = false,
    this.width = 20,
    this.height = 20,
    required this.onCheck,
  }) : super(key: key);

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  late bool checked;

  @override
  void initState() {
    checked = widget.checked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          child: Image.asset(
        getImg(),
        width: widget.height,
        height: widget.height,
      )),
      onTap: () {
        checked = !checked;
        setState(() {});

        widget.onCheck(checked);
      },
    );
  }

  String getImg() {
    return checked ? widget.selected_img : widget.default_img;
  }
}
