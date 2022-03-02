import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ladyfou/components/base_image_load.dart';
import 'package:ladyfou/components/check_box_widget.dart';
import 'package:ladyfou/page/cart/model/cart_model.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:ladyfou/style/text.dart';

class GoodsListWidget extends StatelessWidget {
  const GoodsListWidget({Key? key, this.productList = const []})
      : super(key: key);
  final List<Product> productList;
  @override
  Widget build(BuildContext context) {
    final datas = ['1', '2', '3', '4'];
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            child: Slidable(
              key: Key(datas[index].toString()),
              child: Container(
                height: 114,
                width: double.infinity,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: GoodItemWidget(producModel: productList[index]),
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
        childCount: productList.length,
      ),
    );
  }
}

class GoodItemWidget extends StatelessWidget {
  const GoodItemWidget({Key? key, required this.producModel}) : super(key: key);
  final Product producModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _leftItem(context),
        _rightDetail(context),
      ],
    );
  }

  Widget _leftItem(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4),
      child: Row(
        children: [
          CheckBoxWidget(isSelect: true),
          ClipRRect(
            borderRadius: BorderRadius.all(new Radius.circular(5)),
            child: BaseImageLoading(
                url: producModel.fThumb, width: 90, height: 90),
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
                  Container(
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
                              'S码 蓝色',
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
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 原价
                  Container(
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      '1000',
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
                      padding: EdgeInsets.only(top: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // 现价
                          Text(
                            '999',
                            style: BaseText.style(
                              fontSize: 12,
                              color: AppColors.primaryBlackText51,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          // 加减商品
                          Container(
                              width: 20,
                              height: 20,
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
                                'x1',
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
}
