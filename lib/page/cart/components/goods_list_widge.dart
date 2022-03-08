import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ladyfou/components/base_image_load.dart';
import 'package:ladyfou/components/check_box_widget.dart';
import 'package:ladyfou/core/utils/utils.dart';
import 'package:ladyfou/page/cart/model/cart_model.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:ladyfou/style/text.dart';

import '../../../core/model/product_detail_model.dart';
import '../../detail/components/color_and_size_entry_view.dart';
import '../../detail/components/color_and_size_view.dart';

typedef SelectCallBack = void Function(Product product);
typedef SelectListCallBack = void Function(Product product);

class GoodsListWidget extends StatefulWidget {
  const GoodsListWidget(
      {Key? key,
      required this.selectListCallBack,
      this.productList = const [],
      this.selectProductList = const []})
      : super(key: key);

  final List<Product> productList;
  final List<Product> selectProductList;
  final SelectListCallBack selectListCallBack;

  @override
  State<GoodsListWidget> createState() => GoodsListWidgetState();
}

class GoodsListWidgetState extends State<GoodsListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final datas = ['1', '2', '3', '4'];
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          bool isSelect = false;
          Product product = widget.productList[index];

          widget.selectProductList.forEach((p) {
            if (product.productId == p.productId) {
              isSelect = true;
            }
          });
          return Container(
            child: Slidable(
              key: Key(datas[index].toString()),
              child: Container(
                child: GoodItemWidget(
                  producModel: product,
                  index: index,
                  allCount: widget.productList.length,
                  isSelect: isSelect,
                  selectCallBack: (p) {
                    widget.selectListCallBack(p);
                  },
                ),
              ),

              // 侧滑选项
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (_) {},
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (context) => Navigator.of(context).pop(true),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Save',
                  ),
                ],
              ),
            ),
          );
        },
        childCount: widget.productList.length,
      ),
    );
  }
}

class GoodItemWidget extends StatelessWidget {
  const GoodItemWidget(
      {Key? key,
      required this.producModel,
      required this.index,
      required this.allCount,
      required this.selectCallBack,
      this.isSelect = false})
      : super(key: key);

  final Product producModel;
  final int index;
  final int allCount;
  final SelectCallBack selectCallBack;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114,
      margin: EdgeInsets.only(
          top: index == 0 ? 0 : 5, bottom: index + 1 == allCount ? 0 : 5),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _leftItem(context),
          _rightDetail(context),
        ],
      ),
    );
  }

  Widget _leftItem(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              selectCallBack(producModel);
            },
            child: CheckBoxWidget(isSelect: isSelect),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(new Radius.circular(5)),
            child: BaseImageLoading(
              url: producModel.fThumb,
              width: 90,
              height: 90,
            ),
          ),
        ],
      ),
    );
  }

  Widget _rightDetail(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.fromLTRB(6, 12, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 商品名称
                  Text(
                    producModel.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: BaseText.style(
                        fontSize: 12,
                        color: AppColors.primaryBlackText51,
                        fontWeight: FontWeight.w400),
                  ),

                  // 选项
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        // backgroundColor: AppColors.transparent,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 428,
                            child: ClipRRect(
                              //剪裁为圆角矩形
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: double.infinity,
                                height: 428,
                                color: AppColors.white,
                                alignment: Alignment.centerLeft,
                                child: ColorAndSizeView(
                                  detailModel: ProductDetailModel(),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 6),
                      child: Container(
                        width: 77,
                        height: 22,
                        decoration: BoxDecoration(
                          color: AppColors.primaryBackground,
                          border: new Border.all(
                            color: AppColors.color_FFDCDCDC,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                getSize(producModel),
                                style: BaseText.style(
                                    fontSize: 10,
                                    color: AppColors.primaryBlackText51,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 9),
                              child: Image.asset(
                                'assets/images/cart/dropdown_arrow.png',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 原价
                  Container(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      Utils.formatStepCount(
                          double.parse(producModel.listPrice.toString())),
                      style: BaseText.style(
                        fontSize: 12,
                        color: AppColors.jp_color153,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.jp_color153,
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // 现价
                          Text(
                            Utils.formatStepCount(
                                double.parse(producModel.price)),
                            style: BaseText.style(
                              fontSize: 12,
                              color: AppColors.primaryBlackText51,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          // 加减商品
                          Container(
                              height: 20,
                              padding: EdgeInsets.only(left: 2, right: 2),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.primaryBackground,
                                border: new Border.all(
                                  color: AppColors.primaryBlackText51,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'x${producModel.qty}',
                                style: BaseText.style(
                                  fontSize: 10,
                                  color: AppColors.primaryBlackText51,
                                  fontWeight: FontWeight.w400,
                                ),
                              ))
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getSize(Product product) {
    List result = [];
    product.options.forEach((option) {
      option.value.forEach((element) {
        result.add(element.name2);
      });
    });
    if (result.length > 0) {
      result = result.reversed.toList();
    }
    return result.join(" ");
  }
}
