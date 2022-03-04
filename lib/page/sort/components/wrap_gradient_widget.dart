/*
 * @Descripttion: TODO
 * @FileName: wrap_gradient_widget
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/18/22 2:47 PM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/base_bloc.dart';
import '../../../core/model/category_info_model.dart';
import '../../../core/model/good_collection_model.dart';
import '../../../core/model/good_info_model.dart';
import '../../../style/Color.dart';
import '../../../style/text.dart';

class ItemButtonModel {
  ItemButtonModel({
    this.id = 0,
    this.name = '',
  });

  final int id;
  final String name;

  factory ItemButtonModel.fromModel(int id, String name) =>
      ItemButtonModel(id: id, name: name);

  static List<CategoryInfoModel> toFindModels(
      List<CategoryInfoModel> models, List<ItemButtonModel> list) {
    List<CategoryInfoModel> currentModels = [];
    list.forEach((element) {
      models.forEach((m) {
        if (element.id == m.id) {
          currentModels.add(m);
        }
      });
    });
    return currentModels;
  }

  static List<CategoryListItem> toFindCategoryListItemModels(
      List<CategoryListItem> models, List<ItemButtonModel> list) {
    List<CategoryListItem> currentModels = [];
    list.forEach((element) {
      models.forEach((m) {
        if (element.id == m.cid) {
          currentModels.add(m);
        }
      });
    });
    return currentModels;
  }

  static List<ItemButtonModel> fromItemModels(
      List<CategoryInfoModel> models) {
    List<ItemButtonModel> currentModels = [];
    models.forEach((m) {
      currentModels.add(ItemButtonModel(
          id: m.id, name: m.name2));
    });
    return currentModels;
  }

  static List<ItemButtonModel> fromCategoryListItemModels(
      List<CategoryListItem> models) {
    List<ItemButtonModel> currentModels = [];
    models.forEach((m) {
      currentModels.add(ItemButtonModel(
          id: m.cid, name: m.name2));
    });
    return currentModels;
  }

  static List<ItemButtonModel> fromOptionsSizeModels(
      List<OptionsSizeReq> models) {
    List<ItemButtonModel> currentModels = [];
    models.forEach((m) {
      currentModels.add(ItemButtonModel(
          id: m.id, name: m.sizeName));
    });
    return currentModels;
  }

  static List<OptionsSizeReq> toFindOptionsSizeReqModels(
      List<OptionsSizeReq> models, List<ItemButtonModel> list) {
    List<OptionsSizeReq> currentModels = [];
    list.forEach((element) {
      models.forEach((m) {
        if (element.id == m.id) {
          currentModels.add(m);
        }
      });
    });
    return currentModels;
  }

  static List<ItemButtonModel> fromToModels(
      List<Map<String,dynamic>> models,String idKey, String nameKey) {
    List<ItemButtonModel> currentModels = [];
    models.forEach((m) {
      currentModels.add(ItemButtonModel(
          id: m[idKey], name: m[nameKey]));
    });
    return currentModels;
  }

  static List<Map<String,dynamic>> findToModels(
      List<Map<String,dynamic>> models,String idKey, List<ItemButtonModel> list) {
    List<Map<String,dynamic>> currentModels = [];
    list.forEach((element) {
      models.forEach((m) {
        if (element.id == m[idKey]) {
          currentModels.add(m);
        }
      });
    });
    return currentModels;
  }
}

typedef CallBackWidget = void Function(List<ItemButtonModel> models);

class WrapGradientWidget extends StatefulWidget {
  WrapGradientWidget({
    Key? key,
    required this.itemList,
    required this.onClick,
    this.isAddBorder = false,
    this.borderColor = Colors.white,
    this.bgNormalColor = Colors.white,
    this.titleNormalColor = AppColors.primaryBlackText,
    this.titleSelectColor = Colors.white,
    this.bgSelectGradientColor = const [],
    this.titleSize = 10,
    this.padding = EdgeInsets.zero,
    this.height = 30.0,
    required this.currentSelects,
  });

  List<ItemButtonModel> currentSelects = [];
  final List<ItemButtonModel> itemList;
  final bool isAddBorder; // 是否添加边框
  final Color borderColor; // 边框颜色，要先设置isAddBorder = true
  final Color bgNormalColor; // 默认背景色
  final List<Color> bgSelectGradientColor; // 选中背景色
  final double height;

  final Color titleNormalColor; // 默认文字颜色
  final Color titleSelectColor; // 选中文字颜色
  final double titleSize; // 文字大小
  final EdgeInsetsGeometry padding; // 内边距，文字居上下左右的距离
  final CallBackWidget onClick;

  @override
  _WrapGradientWidgetState createState() => _WrapGradientWidgetState();
}

class _WrapGradientWidgetState extends State<WrapGradientWidget> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 30.w,
      children: widget.itemList.asMap().keys.map((index) {
        return _selectItemWidget(widget.itemList[index]);
      }).toList(),
    );
  }

  bool isExit(ItemButtonModel model) {
    bool isExit = false;
    widget.currentSelects.forEach((element) {
      if (element.id == model.id) {
        isExit = true;
      }
    });
    return isExit;
  }

  Widget _selectItemWidget(ItemButtonModel model) {
    return StreamBuilder<bool>(
        initialData: false,
        stream: BaseBloc.instance.addUpdateCollectionAlertStream,
        builder: (ctx, snopshot) {
          if (snopshot.data == true) {
            widget.currentSelects = [];
            BaseBloc.instance.addUpdateCollectionAlertShow(false);
          }
          return GestureDetector(
            onTap: () {
              // 如果选中"全部"，需要取消其他选中的，如果有其他选中的，那么删除"全部"
              if(model.id == 0) {
                widget.currentSelects.clear();
                widget.currentSelects.add(model);
              }else {
                widget.currentSelects
                    .removeWhere((element) => element.id == 0);
                if (isExit(model)) {
                  widget.currentSelects
                      .removeWhere((element) => element.id == model.id);
                } else {
                  widget.currentSelects.add(model);
                }
              }

              widget.onClick(widget.currentSelects);
              setState(() {});
            },
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.w),
                  padding: widget.padding,
                  height: widget.height,
                  decoration: BoxDecoration(
                    border: widget.isAddBorder
                        ? isExit(model)
                            ? Border.all(
                                width: 0.5.w,
                                color: widget.titleSelectColor,
                              )
                            : Border.all(
                                width: 0.5.w,
                                color: widget.bgNormalColor,
                              )
                        : null,
                    color: !isExit(model) ? widget.bgNormalColor : null,
                    borderRadius:
                        BorderRadius.all(Radius.circular(widget.height / 2.0)),
                  ),
                  child: Text(
                    '${model.name}',
                    style: BaseText.style(
                        fontSize: widget.titleSize,
                        color: isExit(model)
                            ? widget.titleSelectColor
                            : widget.titleNormalColor),
                    strutStyle: StrutStyle(height: 1.5, forceStrutHeight: true),
                  ),
                ),
                isExit(model)
                    ? Container(
                        padding: EdgeInsets.only(bottom: 5.w),
                        child: Image.asset(
                            "assets/images/sort/fi_check_delete.png"),
                      )
                    : SizedBox(),
              ],
            ),
          );
        });
  }
}
