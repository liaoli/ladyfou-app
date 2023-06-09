/*
 * @Descripttion: TODO
 * @FileName: base_enum
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/15/22 5:42 PM
 * @LastEditors: tang
 */

/// 列表展示形态
enum DisplayType {
  grid_shape, //网格形态，每行2个
  list_form //列表形态，每行1个
}

/// appbar 返回按钮类型
enum AppBarBackType { Back, Close, None }

/// 订单状态
enum OrderStatus {
  all, //全部
  wait_pay, //待付款
  delivering, //待收货
  finished, //已完成
  discarded, // 已取消
}
