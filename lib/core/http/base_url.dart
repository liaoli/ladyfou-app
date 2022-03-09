/// 生产环境域名
// const String baseUrl = "http://aashop.neverdown.cc";

/// 测试环境域名
// const String baseUrl = "https://release.ladyfou.com";

/// 开发环境域名
// const String baseUrl = "http://192.168.1.174";

const String baseUrl = "https://release.ladyfou.com";

String getBaseUrl() {
  if (baseUrl == "https://release.ladyfou.com") {
    return baseUrl + "/ladyfou";
  } else {
    return baseUrl + "/otonastyle";
  }
}

///注册
const String REGISTER_URI = "/account/register";

///登录
const String LOGIN_URI = "/account/login";

///发送邮箱验证码
const String RESET_PASSWORD_START_URI = "/account/reset_password_start";

///修改密码
const String RRESET_PASSWORD_END_URI = "/account/reset_password_end";

/// home 每日新品
const String DAILY_NEW_PRODUCT_URI = "/product/newProduct";

/// home 限时折扣
const String DISCOUNT_PRODUCT_URI = "/product/discountProduct";

/// 猜你喜欢
const String YOU_LIKE_PRODUCT_URI = "/product/youLikeProduct";

/// 猜你喜欢
const String PRODUCT_DETAIL_URI = "/catalog/product";

///获取分类
const String CATEGORY_URI = "/catalog/category";

/// 获取二级分类
const String CATEGORY_PRODUCT_URI = "/catalog/category_product";

/// 获取一级二级分类数据
const String CATE_CHILD_URI = "/catalog/cate_child";

///获取订单列表
const String ORDER_LIST_URI = "/account/order";

/// 获取收藏列表
const String WISH_LIST_URI = "/account/wish_list";

/// 收藏
const String WISH_PRODUCT_URI = "/account/wish_product";

/// 取消收藏
const String DELETE_WISH_BATCH_URI = "/account/delete_wish_batch";

/// 加入购物车
const String ADD_TO_CART_URI = "/checkout/add_to_cart";

/// 获取分类产品尺码规格
const String GET_OPTION_SIZE_URI = "/catalog/getOptionSize";

/// 购物车列表
const String SHOPPING_CART_LIST_URI = "/checkout/shopping_cart_list";

/// 购物车获取促销策略
const String SHOPING_CART_TEXT = "/product/getShoppingCartText";

/// 获取优惠券
const String COUPON_CODE = "/checkout/getCouponCode";

/// 获取国家 省
const String COUNTRY_LIST_URI = "/common/country";

/// 获取市
const String CITY_LIST_URI = "/common/city";

/// 获取区
const String TOWN_LIST_URI = "/common/town";

/// 获取我的地址列表
const String ADDRESS_LIST_URI = "/account/address";

/// 新增更新地址
const String UPDATE_ADDRESS_URI = "/account/update_address";

/// 删除地址
const String DELETE_ADDRESS_URI = "/account/delete_address";

/// 通过邮编获取地址
const String ADDRESS_BY_ZIP_URI = "/common/addressByZip";

/// 通过地址获取邮编
const String ZIP_BY_ADDRESS_URI = "/common/zipCode";
