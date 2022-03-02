/*
 * @Descripttion: TODO
 * @FileName: sort_provider
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/14/22 2:00 PM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ladyfou/core/constant/base_bloc.dart';
import 'package:ladyfou/core/constant/constant.dart';
import 'package:ladyfou/core/http/request.dart';
import 'package:ladyfou/core/http/response.dart';
import 'package:ladyfou/core/model/sort_model.dart';

import '../../../core/constant/base_enum.dart';
import '../../../core/constant/event_bus.dart';
import '../../../core/model/category_info_model.dart';
import '../../../core/model/good_info_model.dart';
import '../../../core/utils/event.dart';

class SortProvider with ChangeNotifier {
  List<SortModel> categoryList = [];
  List<GoodsInfoModel> goodsInfoList = [];
  List<CategoryInfoModel> categoryInfoModels = [];
  List<CategoryInfoModel> selectCategoryInfoModels = [];
  List<CategoryInfoModel> conditionInfoModels = [];
  List<CategoryInfoModel> selectConditionInfoModels = [];

  bool isRequestError = false;
  int currentPage = CURRENT_PAGE;
  EasyRefreshController refreshController = EasyRefreshController();

  /// 获取分类数据
  Future getSortAllDatas() async {
    /*
    List data = [
      {
        "id": 25,
        "parent_id": 1,
        "name": "ワンピース",
        "name2": "连衣裙",
        "is_enabled": 1,
        "thumb":
            "//imgs.veralady.com/uploads/public/609/123/253/609123253838b551805523.gif",
        "icon":
            "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png",
        "children": [
          {
            "id": 26,
            "parent_id": 25,
            "name": "デートワンピース",
            "name2": "约会连衣裙",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cd/001/ec9/5cd001ec94f5c137300848.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          },
          {
            "id": 27,
            "parent_id": 25,
            "name": "エレガントワンピース",
            "name2": "优雅连衣裙",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cd/001/87d/5cd00187da8bf167510553.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          },
          {
            "id": 18,
            "parent_id": 25,
            "name": "カジュアルワンピース",
            "name2": "休闲连衣裙",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/811/22d/5cc81122d7dd5566500399.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          },
          {
            "id": 28,
            "parent_id": 25,
            "name": "セクシーワンピース",
            "name2": "性感连衣裙",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/811/360/5cc811360f070275206762.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          },
          {
            "id": 29,
            "parent_id": 25,
            "name": "ＯＬ通勤ワンピース",
            "name2": "职业连衣裙",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/811/41b/5cc81141b1b1d114322923.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          },
          {
            "id": 30,
            "parent_id": 25,
            "name": "花柄ワンピース",
            "name2": "碎花连衣裙",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/811/51b/5cc81151bd20d742010133.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          },
          {
            "id": 31,
            "parent_id": 25,
            "name": "ロングワンピース",
            "name2": "长款连衣裙",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/811/62e/5cc81162e2e34750555635.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          },
          {
            "id": 40,
            "parent_id": 25,
            "name": "デニムワンピース",
            "name2": "牛仔连衣裙",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/811/d9e/5cc811d9ec3f2919879916.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          },
          {
            "id": 41,
            "parent_id": 25,
            "name": "ビーチワンピース",
            "name2": "沙滩度假连衣裙",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/811/f04/5cc811f04891e704157152.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          },
          {
            "id": 42,
            "parent_id": 25,
            "name": "ドレス",
            "name2": "礼服类连衣裙",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/811/fc7/5cc811fc7e80e165839775.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          }
        ]
      },
      {
        "id": 2,
        "parent_id": 1,
        "name": "トップス",
        "name2": "上衣",
        "is_enabled": 1,
        "thumb":
            "//imgs.veralady.com/uploads/public/5cc/82a/3f1/5cc82a3f17604291486756.png",
        "icon":
            "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png",
        "children": [
          {
            "id": 22,
            "parent_id": 2,
            "name": "シャツ",
            "name2": "衬衫",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/813/f16/5cc813f1611bd039602135.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          },
          {
            "id": 21,
            "parent_id": 2,
            "name": "ブラウス",
            "name2": "雪纺衫",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/814/042/5cc814042fb96085692897.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          },
          {
            "id": 4,
            "parent_id": 2,
            "name": "Tシャツ",
            "name2": "T恤",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/814/0c5/5cc8140c513a4202553931.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          }
        ]
      },
      {
        "id": 12,
        "parent_id": 1,
        "name": "ボトムス",
        "name2": "下装",
        "is_enabled": 1,
        "thumb":
            "//imgs.veralady.com/uploads/public/5cc/82a/244/5cc82a24468e7813065884.png",
        "icon":
            "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png",
        "children": [
          {
            "id": 23,
            "parent_id": 12,
            "name": "スカート",
            "name2": "半身裙",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/818/4c8/5cc8184c88acd845737105.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          },
          {
            "id": 24,
            "parent_id": 12,
            "name": "ガウチョパンツ",
            "name2": "阔腿裤",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/818/5d8/5cc8185d84083064979661.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          }
        ]
      },
      {
        "id": 32,
        "parent_id": 1,
        "name": "シューズ",
        "name2": "女鞋",
        "is_enabled": 1,
        "thumb":
            "//imgs.veralady.com/uploads/public/5cc/82a/141/5cc82a1417bdb880358816.png",
        "icon":
            "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png",
        "children": [
          {
            "id": 33,
            "parent_id": 32,
            "name": "パンプス",
            "name2": "单鞋/浅口鞋/高跟鞋",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/818/72f/5cc81872f1be0009273345.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          },
          {
            "id": 34,
            "parent_id": 32,
            "name": "サンダル",
            "name2": "凉鞋",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/818/6cc/5cc8186cc6f39863634805.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          },
          {
            "id": 35,
            "parent_id": 32,
            "name": "フラットシューズ",
            "name2": "平底鞋",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/818/665/5cc8186654cd6617738405.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          }
        ]
      },
      {
        "id": 36,
        "parent_id": 1,
        "name": "セットアップ",
        "name2": "套装",
        "is_enabled": 1,
        "thumb":
            "//imgs.veralady.com/uploads/public/5cc/82a/094/5cc82a094759a859992810.png",
        "icon":
            "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png",
        "children": [
          {
            "id": 62,
            "parent_id": 36,
            "name": "ワンピースセット",
            "name2": "套装裙（上衣+下装、外套+裙子）",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/817/fb7/5cc817fb7b2f3898427218.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          },
          {
            "id": 63,
            "parent_id": 36,
            "name": "パンツセット",
            "name2": "套装裤（上衣+裤子、外套+裤子）",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/5cc/818/026/5cc818026923c732424679.png",
            "icon":
                "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png"
          }
        ]
      },
      {
        "id": 71,
        "parent_id": 1,
        "name": "小物",
        "name2": "小物",
        "is_enabled": 1,
        "thumb":
            "//imgs.veralady.com/uploads/public/609/123/5d4/6091235d4d398517850800.jpg",
        "icon":
            "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png",
        "children": [
          {
            "id": 71,
            "parent_id": 1,
            "name": "小物",
            "name2": "小物",
            "is_enabled": 1,
            "thumb":
                "//imgs.veralady.com/uploads/public/609/123/5d4/6091235d4d398517850800.jpg",
            "icon":
                "//imgs.veralady.com/uploads/public/609/123/5d4/6091235d4d398517850800.jpg"
          }
        ]
      }
    ];
    categoryList = SortModel.fromList(data);

    await Future.delayed(Duration(milliseconds: 300));

    notifyListeners();
    */

    try {
      MyResponse<List<SortModel>> response = await getSortData();
      if (response.common.statusCode == 1000) {
        categoryList = response.response!.data!;
        notifyListeners();
      } else {
        isRequestError = true;
        categoryList = [];
        notifyListeners();
      }
    } catch (s, e) {
      print('请求报错:$e');
    }
  }

  /// 获取二级分类商品列表
  Future getCategoryProducts(List<int> ids,
      {bool isFirst = false,
      bool isRefresh = true,
      int page = CURRENT_PAGE,
      int size = PAGE_SIZE,
      String order_type = ""}) async {
    if (isFirst || isRefresh) page = CURRENT_PAGE;

    /*
    List data = [
      {
        "id": 3867,
        "name": "無地春夏ポリエステル半袖レトロスウィート一般ボタン一般ショート丈Vネックシングルブレストシャツ・ブラウス",
        "status": "instock",
        "list_price": "5130.00",
        "price": 3000,
        "amount": 23992,
        "saled": 7,
        "rating": 5,
        "created_at": "2019-05-04 19:07:42",
        "src_price": "3000.00",
        "promotion_price": "3000",
        "url":
            "http://192.168.1.174/solid-color-bowtie-camisole-dating-dress-p-3867.html",
        "f_thumb":
            "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png",
        "reviews_total": "0",
        "wishlist_total": 0,
        "discount": "41%",
        "cids": [25, 26],
        "options": [
          {
            "id": 6450,
            "name": "カラー",
            "name2": "颜色",
            "sort": 1,
            "type": "radio",
            "values": [
              {
                "id": 22595,
                "option_id": 6450,
                "name": "ピンク",
                "name2": "藕粉",
                "price_variate": "+",
                "variate_value": "0.00",
                "hex": ""
              }
            ]
          },
          {
            "id": 6451,
            "name": "サイズ",
            "name2": "尺码",
            "sort": 2,
            "type": "radio",
            "values": [
              {
                "id": 22596,
                "option_id": 6451,
                "name": "S",
                "name2": "S",
                "price_variate": "+",
                "variate_value": "0.00",
                "hex": ""
              },
              {
                "id": 22597,
                "option_id": 6451,
                "name": "M",
                "name2": "M",
                "price_variate": "+",
                "variate_value": "0.00",
                "hex": ""
              },
              {
                "id": 22598,
                "option_id": 6451,
                "name": "L",
                "name2": "L",
                "price_variate": "+",
                "variate_value": "0.00",
                "hex": ""
              }
            ]
          }
        ],
        "tags": [],
        "imgUrl": "/plugins/jason/ccshop/assets/images/default-thumb.png",
        "is_wished": 0,
        "point": 1,
        "presell": {"actual_num": 0, "presale": 0},
        "is_lucky_bag": 0,
        "feature_image": []
      },
      {
        "id": 3714,
        "name": "無地春夏ポリエステル半袖レトロスウィート一般ボタン一般ショート丈Vネックシングルブレストシャツ・ブラウス",
        "status": "instock",
        "list_price": "11448.00",
        "price": 7950,
        "amount": 492,
        "saled": 480,
        "rating": 5,
        "created_at": "2019-04-30 01:34:16",
        "src_price": "7950.00",
        "promotion_price": "7950",
        "url": "http://192.168.1.174/fashion-chiffon-date-dress-p-3714.html",
        "f_thumb":
            "http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png",
        "reviews_total": "5",
        "wishlist_total": 0,
        "discount": "30%",
        "cids": [25, 26, 27],
        "options": [
          {
            "id": 6119,
            "name": "カラー",
            "name2": "颜色",
            "sort": 1,
            "type": "radio",
            "values": [
              {
                "id": 21416,
                "option_id": 6119,
                "name": "ピンク",
                "name2": "藕粉",
                "price_variate": "+",
                "variate_value": "0.00",
                "hex": ""
              },
              {
                "id": 21425,
                "option_id": 6119,
                "name": "グリーン",
                "name2": "豆绿",
                "price_variate": "+",
                "variate_value": "0.00",
                "hex": ""
              },
              {
                "id": 21433,
                "option_id": 6119,
                "name": "アプリコット",
                "name2": "香橙色",
                "price_variate": "+",
                "variate_value": "0.00",
                "hex": ""
              },
              {
                "id": 21443,
                "option_id": 6119,
                "name": "レッド",
                "name2": "西瓜红",
                "price_variate": "+",
                "variate_value": "0.00",
                "hex": ""
              }
            ]
          },
          {
            "id": 6131,
            "name": "サイズ",
            "name2": "尺码",
            "sort": 2,
            "type": "radio",
            "values": [
              {
                "id": 21463,
                "option_id": 6131,
                "name": "S",
                "name2": "S",
                "price_variate": "+",
                "variate_value": "0.00",
                "hex": ""
              },
              {
                "id": 21464,
                "option_id": 6131,
                "name": "M",
                "name2": "M",
                "price_variate": "+",
                "variate_value": "0.00",
                "hex": ""
              },
              {
                "id": 21465,
                "option_id": 6131,
                "name": "L",
                "name2": "L",
                "price_variate": "+",
                "variate_value": "0.00",
                "hex": ""
              },
              {
                "id": 21466,
                "option_id": 6131,
                "name": "XL",
                "name2": "XL",
                "price_variate": "+",
                "variate_value": "0.00",
                "hex": ""
              },
              {
                "id": 21468,
                "option_id": 6131,
                "name": "XXL",
                "name2": "XXL",
                "price_variate": "+",
                "variate_value": "0.00",
                "hex": ""
              }
            ]
          }
        ],
        "tags": [],
        "imgUrl": "/plugins/jason/ccshop/assets/images/default-thumb.png",
        "is_wished": 0,
        "point": 0,
        "presell": {"actual_num": 0, "presale": 0},
        "is_lucky_bag": 0,
        "feature_image": []
      }
    ];
    goodsInfoList = GoodsInfoModel.fromList(data);
    notifyListeners();
     */

    try {
      Map<String, dynamic> params = {
        "id": ids.join(','),
        "page": page,
        "size": size,
        "order_type": order_type,
      };

      MyResponse<List<GoodsInfoModel>> response =
          await getCategoryProduct(params: params);
      if (response.common.statusCode == 1000) {
        List<GoodsInfoModel> modelList = response.response!.data!;

        /// 第一次请求
        if (isFirst) {
          goodsInfoList = modelList;
          currentPage = response.common.pageEnabled.currentPage;
        } else {
          if (isRefresh) {
            goodsInfoList.clear();
            goodsInfoList = modelList;
            refreshController.finishRefresh();
            refreshController.finishLoad();
          } else {
            if (goodsInfoList.length < response.common.pageEnabled.totalPage) {
              refreshController.finishLoad();
            } else {
              refreshController.finishLoad(noMore: true);
            }
            goodsInfoList.addAll(modelList);
          }
        }
        notifyListeners();
      } else {
        isRequestError = true;
        goodsInfoList.clear();
        goodsInfoList = [];
        refreshController.finishRefresh();
        refreshController.finishLoad();
        notifyListeners();
      }
    } catch (s, e) {
      print('请求报错:$e');
    }
  }

  /// 通过分类查询数据
  Future querySortCategoryProducts(List<int>  ids) async {
    if (selectCategoryInfoModels.length > 0) {
      List<int> list = [];
      selectCategoryInfoModels.forEach((element) {
        list.add(element.id);
      });
      if (list.length > 0) {
        getCategoryProducts(list, isRefresh: true, isFirst: true);
      }
    }else {
      if(ids.length >0 ) {
        getCategoryProducts(ids, isRefresh: true, isFirst: true);
      }
    }
  }

  /// 切换列表模式
  Future switchListType(DisplayType type) async {
    BaseBloc.instance.displayType = type;
    notifyListeners();
  }

  /// 获取一级二级分类的分类数据
  Future getCategoryChildDatas(int id) async {
    /*
    List data = [
      {
        "id": 25,
        "parent_id": 1,
        "nest_left": 1,
        "nest_right": 30,
        "nest_depth": 1,
        "name": "ワンピース",
        "name2": "连衣裙",
        "slug": "dress",
        "page_title": "ワンピースレディースファッション豊富な通販∣COCO7S",
        "meta_keywords":
            "エレガントワンピース,カジュアルワンピース,セクシーワンピース,ＯＬ通勤ワンピース,レトロワンピース,ロリワンピース,花柄ワンピース,レースワンピース,デニムワンピース,ニットワンピース,ビーチワンピース,ロングワンピース,デートワンピース,ボーダー,春,夏,秋,冬,清楚可愛い ワンピース,ワンピース コーデ,ワンピース 長袖 きれいめ,通販,注目トレンド,大きいサイズ,上品,20代　30代　40代　50代,着てほしい,ファッションアイテム,モテ服,ウケ抜群,あす楽,ドキッ,プチプラゆったりスリットおしゃ",
        "meta_description":
            "エレガントワンピース,カジュアルワンピース,セクシーワンピース,ＯＬ通勤ワンピース,レトロワンピース,ロリワンピース,花柄ワンピース,レースワンピース,デニムワンピース,ニットワンピース,ビーチワンピース,ロングワンピース,デートワンピース,ボーダー,春,夏,秋,冬,清楚可愛い ワンピース,ワンピース コーデ,ワンピース 長袖 きれいめ,通販,注目トレンド,大きいサイズ,上品,20代　30代　40代　50代,着てほしい,ファッションアイテム,モテ服,ウケ抜群,あす楽,ドキッ,プチプラゆったりスリットおしゃ",
        "position": 0,
        "description":
            "ワンピース｜レディースファッションアイテムワンピースをお探しならコチラ。オシャレなトレンドアイテムいっぱいの、COCO7Sの通販サイトへようこそ。ポイントサービスでお買物のたびにさらにお得。豊富な品揃えからご希望条件でカンタン検索。話題の最新トレンドをリアルタイムに チェック。エレガントワンピ｜カジュアルワンピ｜セクシーワンピ｜ＯＬ通勤ワンピ｜レトロワンピ｜ロリワンピ｜花柄ワンピ｜レースワンピ｜デニムワンピ｜ニットワンピ｜ビーチワンピ｜ロングワンピ｜デートワンピなどトレンドファッションアイテムが目白押し！",
        "options": [],
        "created_at": "2019-04-28 03:50:34",
        "updated_at": "2022-02-18 17:39:33",
        "is_enabled": 1,
        "precautions": [
          ["反倒是房顶上", "说的分手的"],
          ["上的发生地方", "斯蒂芬森"],
          ["水电费", "发多少是"]
        ],
        "sites": [],
        "url": "http://192.168.1.174/dress-c-25.html",
        "thumb": {
          "id": 79844,
          "disk_name": "609123253838b551805523.gif",
          "file_name": "5db8f78d81fa1261459839.gif",
          "file_size": 6890,
          "content_type": "image/gif",
          "title": null,
          "description": null,
          "field": "thumb",
          "sort_order": 79844,
          "created_at": "2021-05-04 19:34:13",
          "updated_at": "2021-05-04 19:34:15",
          "scene_id": 0,
          "path":
              "//imgs.veralady.com/uploads/public/609/123/253/609123253838b551805523.gif",
          "extension": "gif"
        },
        "icon": null
      },
      {
        "id": 2,
        "parent_id": 1,
        "nest_left": 31,
        "nest_right": 48,
        "nest_depth": 1,
        "name": "トップス",
        "name2": "上衣",
        "slug": "tops",
        "page_title": "トップスレディースファッション豊富な通販∣COCO7S",
        "meta_keywords":
            "20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,シフォン,コント,無地,長袖,半袖,スリム,タイト,リボン, 生地,シンプル,デザイン,飾り,カザリ,通勤,OL,オフィス,休み,GW,セール,女子力,可愛い,注目,形態安定,限定,トップス,レディース,きれいめ,春夏,夏,レース,安い,ランキング",
        "meta_description":
            "20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,シフォン,コント,無地,長袖,半袖,スリム,タイト,リボン,\r\n生地,シンプル,デザイン,飾り,カザリ,通勤,OL,オフィス,休み,GW,セール,女子力,可愛い,注目,形態安定,限定,トップス,レディース,きれいめ,春夏,夏,レース,安い,ランキング",
        "position": 0,
        "description":
            "トップス｜20代・30代・40代の女性におすすめな大人レディースカジュアルフェミニンファッション通販サイト！お得な各種SALEも開催中！ニット/Tシャツ/ ブラウス/カットソー/タンクトップ/セーター/スウェット·パーカー/チュニックなどトレンドファッションアイテムが目白押し！",
        "options": [],
        "created_at": "2019-04-03 09:39:54",
        "updated_at": "2020-07-03 18:04:15",
        "is_enabled": 1,
        "precautions": [],
        "sites": null,
        "url": "http://192.168.1.174/tops-c-2.html",
        "thumb": {
          "id": 48545,
          "disk_name": "5cc82a3f17604291486756.png",
          "file_name": "上装.png",
          "file_size": 185380,
          "content_type": "image/png",
          "title": null,
          "description": null,
          "field": "thumb",
          "sort_order": 48545,
          "created_at": "2019-04-30 11:58:07",
          "updated_at": "2019-04-30 11:58:11",
          "scene_id": 0,
          "path":
              "//imgs.veralady.com/uploads/public/5cc/82a/3f1/5cc82a3f17604291486756.png",
          "extension": "png"
        },
        "icon": null
      },
      {
        "id": 12,
        "parent_id": 1,
        "nest_left": 69,
        "nest_right": 88,
        "nest_depth": 1,
        "name": "ボトムス",
        "name2": "下装",
        "slug": "bottoms",
        "page_title": "ボトムスレディースファッション豊富な通販∣COCO7S",
        "meta_keywords":
            "20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,キュート,ファッション,レトロ,セクシー,タイト,OL,通勤,個性派,知的,リッチ,エレガント,安くてかわいい,上質,アバンギャルド,ストリート,簡潔,上品,クラシック,シフォン,スカート,20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,OL,通勤,ビーチ,クラブ,スウィート,エレガント,個性派,知的,リッチ,エレガント,清新,すがすがしい,カッコイイ,海外トレンド,安カワ,スキニージーン",
        "meta_description":
            "20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,キュート,ファッション,レトロ,セクシー,タイト,OL,通勤,個性派,知的,リッチ,エレガント,安くてかわいい,上質,アバンギャルド,ストリート,簡潔,上品,クラシック,シフォン,スカート,20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,OL,通勤,ビーチ,クラブ,スウィート,エレガント,個性派,知的,リッチ,エレガント,清新,すがすがしい,カッコイイ,海外トレンド,安カワ,スキニージーン",
        "position": 0,
        "description":
            "ボトムス｜20代・30代・40代の女性におすすめな大人レディースカジュアルフェミニンファッション通販サイト！スカート/スキニージーンズ/ガウチョパンツ/サルエルパンツ/ショートパンツ/オーバーオール/オールインワン/レギンスなどお得な各種SALEも開催中！トレンドファッションアイテムが目白押し！",
        "options": [],
        "created_at": "2019-04-03 09:57:36",
        "updated_at": "2019-05-29 08:51:23",
        "is_enabled": 1,
        "precautions": [],
        "sites": null,
        "url": "http://192.168.1.174/bottoms-c-12.html",
        "thumb": {
          "id": 48543,
          "disk_name": "5cc82a24468e7813065884.png",
          "file_name": "裤子.png",
          "file_size": 13398,
          "content_type": "image/png",
          "title": null,
          "description": null,
          "field": "thumb",
          "sort_order": 48543,
          "created_at": "2019-04-30 11:57:40",
          "updated_at": "2019-04-30 11:57:44",
          "scene_id": 0,
          "path":
              "//imgs.veralady.com/uploads/public/5cc/82a/244/5cc82a24468e7813065884.png",
          "extension": "png"
        },
        "icon": null
      },
      {
        "id": 32,
        "parent_id": 1,
        "nest_left": 89,
        "nest_right": 102,
        "nest_depth": 1,
        "name": "シューズ",
        "name2": "女鞋",
        "slug": "shoes",
        "page_title": "シューズレディースファッション豊富な通販∣COCO7S",
        "meta_keywords":
            "20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,キュート,ファッション,レトロ,セクシー,タイト,OL,通勤,ビーチ,クラシック,パンプス,痛くない,bath,歩きやすい,ストラップ,ローヒール,黒,ウェッジソールパンプス,オープントゥパン,サンダル,ウェッジソールサンダル,アンクルストラップサンダル,バックストラップサンダル,サボサンダル,レースアップサンダル,コンフォートサンダル,ミュール,トングサンダル,ビーチサンダル,スポーツサンダル,シャワーサンダル,ヒー",
        "meta_description":
            "20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,キュート,ファッション,レトロ,セクシー,タイト,OL,通勤,ビーチ,クラシック,パンプス,痛くない,bath,歩きやすい,ストラップ,ローヒール,黒,ウェッジソールパンプス,オープントゥパン,サンダル,ウェッジソールサンダル,アンクルストラップサンダル,バックストラップサンダル,サボサンダル,レースアップサンダル,コンフォートサンダル,ミュール,トングサンダル,ビーチサンダル,スポーツサンダル,シャワーサンダル,ヒー",
        "position": 0,
        "description":
            "シューズ｜20代・30代・40代の女性におすすめな大人レディースカジュアルフェミニンファッション通販サイト！パンプス/サンダル/スニーカー/フラットシューズ/スリッパ/ブーツなどお得な各種SALEも開催中！トレンドファッションアイテムが目白押し！",
        "options": [],
        "created_at": "2019-04-28 03:56:39",
        "updated_at": "2019-05-29 08:53:29",
        "is_enabled": 1,
        "precautions": [],
        "sites": null,
        "url": "http://192.168.1.174/shoes-c-32.html",
        "thumb": {
          "id": 48542,
          "disk_name": "5cc82a1417bdb880358816.png",
          "file_name": "鞋.png",
          "file_size": 25009,
          "content_type": "image/png",
          "title": null,
          "description": null,
          "field": "thumb",
          "sort_order": 48542,
          "created_at": "2019-04-30 11:57:24",
          "updated_at": "2019-04-30 11:57:28",
          "scene_id": 0,
          "path":
              "//imgs.veralady.com/uploads/public/5cc/82a/141/5cc82a1417bdb880358816.png",
          "extension": "png"
        },
        "icon": null
      },
      {
        "id": 36,
        "parent_id": 1,
        "nest_left": 103,
        "nest_right": 110,
        "nest_depth": 1,
        "name": "セットアップ",
        "name2": "套装",
        "slug": "setup",
        "page_title": "セットアップレディースファッション豊富な通販∣COCO7S",
        "meta_keywords":
            "セットアップ レディース スカート,セットアップ レディース スウェット,フォーマル,ジャケット,ジャージ,スーツ, 結婚式,ボーダー，春,夏,秋,冬,マタニティ,スキニー膝丈,くびれ,レース,お嬢様,フレアワンピ,半袖,タイト,高級,大人,清楚,お呼ばれ,レディース通販,綺麗目,激安,タイト，フェミニン，大人可愛い,コーデ,ファッションアイテム,モテ服,ウケ抜群,あす楽,ドキッ,プチプラゆったり,スリット,おしゃれ,通販,注目トレンド,大きいサイズ,上品,20代　30代　40代　50代,長袖 きれいめ",
        "meta_description":
            "セットアップ レディース スカート,セットアップ レディース スウェット,フォーマル,ジャケット,ジャージ,スーツ, 結婚式,ボーダー，春,夏,秋,冬,マタニティ,スキニー膝丈,くびれ,レース,お嬢様,フレアワンピ,半袖,タイト,高級,大人,清楚,お呼ばれ,レディース通販,綺麗目,激安,タイト，フェミニン，大人可愛い,コーデ,ファッションアイテム,モテ服,ウケ抜群,あす楽,ドキッ,プチプラゆったり,スリット,おしゃれ,通販,注目トレンド,大きいサイズ,上品,20代　30代　40代　50代,長袖 きれいめ",
        "position": 0,
        "description":
            "セットアップ｜セットアップ すべての商品 「セットアップ」 の商品一覧ページです。COCO7Sのオンラインショップ。プチプライス・お買得バーゲン商品、セットアップコーデ、上下セット、人気レディースセットアップも豊富に取り揃えています!新作アイテムが続々入荷中！お得なセールやイベント毎日開催！最新アイテムを安くまとめ買いしよう。",
        "options": [],
        "created_at": "2019-04-28 03:59:40",
        "updated_at": "2019-05-29 08:54:32",
        "is_enabled": 1,
        "precautions": [],
        "sites": null,
        "url": "http://192.168.1.174/setup-c-36.html",
        "thumb": {
          "id": 48541,
          "disk_name": "5cc82a094759a859992810.png",
          "file_name": "套装.png",
          "file_size": 10950,
          "content_type": "image/png",
          "title": null,
          "description": null,
          "field": "thumb",
          "sort_order": 48541,
          "created_at": "2019-04-30 11:57:13",
          "updated_at": "2019-04-30 11:57:16",
          "scene_id": 0,
          "path":
              "//imgs.veralady.com/uploads/public/5cc/82a/094/5cc82a094759a859992810.png",
          "extension": "png"
        },
        "icon": null
      },
      {
        "id": 71,
        "parent_id": 1,
        "nest_left": 123,
        "nest_right": 136,
        "nest_depth": 1,
        "name": "小物",
        "name2": "小物",
        "slug": "accessory",
        "page_title": "小物レディースファッション豊富な通販∣COCO7S",
        "meta_keywords":
            "人気,春,夏,秋,冬,フェミニン，大人可愛い,コーデ,20代　30代　40代　50代,高級,清楚,綺麗目,激安,ファッションアイテム,フェミニン，ウケ抜群,通販,注目トレンド,お嬢様,おしゃれ,バッグ,ハット,腕時計,マフラー/ストール/スカーフ,ベルト,アクセサリー,",
        "meta_description":
            "人気,春,夏,秋,冬,フェミニン，大人可愛い,コーデ,20代　30代　40代　50代,高級,清楚,綺麗目,激安,ファッションアイテム,フェミニン，ウケ抜群,通販,注目トレンド,お嬢様,おしゃれ,バッグ,ハット,腕時計,マフラー/ストール/スカーフ,ベルト,アクセサリー,",
        "position": 0,
        "description":
            "COCO7Sは人気の小物など豊富に取り揃えるファッション通販サイトです。トートバッグやバックパック、リュックピアスやネックレス、リングなど、定番アイテムから最新トレンドアイテムまでオンラインでご購入いただけます。新着アイテムが毎日入荷中！お得なセールやイベント毎日開催！最新アイテムを安くまとめ買いしよう。",
        "options": [],
        "created_at": "2019-04-28 07:08:52",
        "updated_at": "2021-05-04 19:35:14",
        "is_enabled": 1,
        "precautions": [],
        "sites": null,
        "url": "http://192.168.1.174/accessory-c-71.html",
        "thumb": {
          "id": 79845,
          "disk_name": "6091235d4d398517850800.jpg",
          "file_name": "5fd6d5ae7b629308738674.jpg",
          "file_size": 177216,
          "content_type": "image/jpeg",
          "title": null,
          "description": null,
          "field": "thumb",
          "sort_order": 79845,
          "created_at": "2021-05-04 19:35:09",
          "updated_at": "2021-05-04 19:35:15",
          "scene_id": 0,
          "path":
              "//imgs.veralady.com/uploads/public/609/123/5d4/6091235d4d398517850800.jpg",
          "extension": "jpg"
        },
        "icon": null
      }
    ];
    categoryInfoModels = CategoryInfoModel.fromList(data);
    notifyListeners();
     */

    try {
      MyResponse<List<CategoryInfoModel>> response =
          await getCategoryChilds(id: id);
      if (response.common.statusCode == 1000) {
        categoryInfoModels = response.response!.data!;
        notifyListeners();
      } else {
        categoryInfoModels = [];
        notifyListeners();
      }
    } catch (s, e) {
      print('请求报错:$e');
    }
  }

  Future firstSelectModels(String name2) async {
    selectCategoryInfoModels = [];
    for(int index = 0; index < categoryInfoModels.length;index ++) {
      CategoryInfoModel model = categoryInfoModels[index];
      if(model.name2 == name2) {
        selectCategoryInfoModels.add(model);
        notifyListeners();
        break;
      }
    }
  }

  /// 获取一级二级分类的分类数据
  Future getConditionChildDatas(int id) async {
    /*
    List data = [
      {
        "id": 25,
        "parent_id": 1,
        "nest_left": 1,
        "nest_right": 30,
        "nest_depth": 1,
        "name": "ワンピース",
        "name2": "连衣裙",
        "slug": "dress",
        "page_title": "ワンピースレディースファッション豊富な通販∣COCO7S",
        "meta_keywords":
            "エレガントワンピース,カジュアルワンピース,セクシーワンピース,ＯＬ通勤ワンピース,レトロワンピース,ロリワンピース,花柄ワンピース,レースワンピース,デニムワンピース,ニットワンピース,ビーチワンピース,ロングワンピース,デートワンピース,ボーダー,春,夏,秋,冬,清楚可愛い ワンピース,ワンピース コーデ,ワンピース 長袖 きれいめ,通販,注目トレンド,大きいサイズ,上品,20代　30代　40代　50代,着てほしい,ファッションアイテム,モテ服,ウケ抜群,あす楽,ドキッ,プチプラゆったりスリットおしゃ",
        "meta_description":
            "エレガントワンピース,カジュアルワンピース,セクシーワンピース,ＯＬ通勤ワンピース,レトロワンピース,ロリワンピース,花柄ワンピース,レースワンピース,デニムワンピース,ニットワンピース,ビーチワンピース,ロングワンピース,デートワンピース,ボーダー,春,夏,秋,冬,清楚可愛い ワンピース,ワンピース コーデ,ワンピース 長袖 きれいめ,通販,注目トレンド,大きいサイズ,上品,20代　30代　40代　50代,着てほしい,ファッションアイテム,モテ服,ウケ抜群,あす楽,ドキッ,プチプラゆったりスリットおしゃ",
        "position": 0,
        "description":
            "ワンピース｜レディースファッションアイテムワンピースをお探しならコチラ。オシャレなトレンドアイテムいっぱいの、COCO7Sの通販サイトへようこそ。ポイントサービスでお買物のたびにさらにお得。豊富な品揃えからご希望条件でカンタン検索。話題の最新トレンドをリアルタイムに チェック。エレガントワンピ｜カジュアルワンピ｜セクシーワンピ｜ＯＬ通勤ワンピ｜レトロワンピ｜ロリワンピ｜花柄ワンピ｜レースワンピ｜デニムワンピ｜ニットワンピ｜ビーチワンピ｜ロングワンピ｜デートワンピなどトレンドファッションアイテムが目白押し！",
        "options": [],
        "created_at": "2019-04-28 03:50:34",
        "updated_at": "2022-02-18 17:39:33",
        "is_enabled": 1,
        "precautions": [
          ["反倒是房顶上", "说的分手的"],
          ["上的发生地方", "斯蒂芬森"],
          ["水电费", "发多少是"]
        ],
        "sites": [],
        "url": "http://192.168.1.174/dress-c-25.html",
        "thumb": {
          "id": 79844,
          "disk_name": "609123253838b551805523.gif",
          "file_name": "5db8f78d81fa1261459839.gif",
          "file_size": 6890,
          "content_type": "image/gif",
          "title": null,
          "description": null,
          "field": "thumb",
          "sort_order": 79844,
          "created_at": "2021-05-04 19:34:13",
          "updated_at": "2021-05-04 19:34:15",
          "scene_id": 0,
          "path":
              "//imgs.veralady.com/uploads/public/609/123/253/609123253838b551805523.gif",
          "extension": "gif"
        },
        "icon": null
      },
      {
        "id": 2,
        "parent_id": 1,
        "nest_left": 31,
        "nest_right": 48,
        "nest_depth": 1,
        "name": "トップス",
        "name2": "上衣",
        "slug": "tops",
        "page_title": "トップスレディースファッション豊富な通販∣COCO7S",
        "meta_keywords":
            "20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,シフォン,コント,無地,長袖,半袖,スリム,タイト,リボン, 生地,シンプル,デザイン,飾り,カザリ,通勤,OL,オフィス,休み,GW,セール,女子力,可愛い,注目,形態安定,限定,トップス,レディース,きれいめ,春夏,夏,レース,安い,ランキング",
        "meta_description":
            "20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,シフォン,コント,無地,長袖,半袖,スリム,タイト,リボン,\r\n生地,シンプル,デザイン,飾り,カザリ,通勤,OL,オフィス,休み,GW,セール,女子力,可愛い,注目,形態安定,限定,トップス,レディース,きれいめ,春夏,夏,レース,安い,ランキング",
        "position": 0,
        "description":
            "トップス｜20代・30代・40代の女性におすすめな大人レディースカジュアルフェミニンファッション通販サイト！お得な各種SALEも開催中！ニット/Tシャツ/ ブラウス/カットソー/タンクトップ/セーター/スウェット·パーカー/チュニックなどトレンドファッションアイテムが目白押し！",
        "options": [],
        "created_at": "2019-04-03 09:39:54",
        "updated_at": "2020-07-03 18:04:15",
        "is_enabled": 1,
        "precautions": [],
        "sites": null,
        "url": "http://192.168.1.174/tops-c-2.html",
        "thumb": {
          "id": 48545,
          "disk_name": "5cc82a3f17604291486756.png",
          "file_name": "上装.png",
          "file_size": 185380,
          "content_type": "image/png",
          "title": null,
          "description": null,
          "field": "thumb",
          "sort_order": 48545,
          "created_at": "2019-04-30 11:58:07",
          "updated_at": "2019-04-30 11:58:11",
          "scene_id": 0,
          "path":
              "//imgs.veralady.com/uploads/public/5cc/82a/3f1/5cc82a3f17604291486756.png",
          "extension": "png"
        },
        "icon": null
      },
      {
        "id": 12,
        "parent_id": 1,
        "nest_left": 69,
        "nest_right": 88,
        "nest_depth": 1,
        "name": "ボトムス",
        "name2": "下装",
        "slug": "bottoms",
        "page_title": "ボトムスレディースファッション豊富な通販∣COCO7S",
        "meta_keywords":
            "20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,キュート,ファッション,レトロ,セクシー,タイト,OL,通勤,個性派,知的,リッチ,エレガント,安くてかわいい,上質,アバンギャルド,ストリート,簡潔,上品,クラシック,シフォン,スカート,20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,OL,通勤,ビーチ,クラブ,スウィート,エレガント,個性派,知的,リッチ,エレガント,清新,すがすがしい,カッコイイ,海外トレンド,安カワ,スキニージーン",
        "meta_description":
            "20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,キュート,ファッション,レトロ,セクシー,タイト,OL,通勤,個性派,知的,リッチ,エレガント,安くてかわいい,上質,アバンギャルド,ストリート,簡潔,上品,クラシック,シフォン,スカート,20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,OL,通勤,ビーチ,クラブ,スウィート,エレガント,個性派,知的,リッチ,エレガント,清新,すがすがしい,カッコイイ,海外トレンド,安カワ,スキニージーン",
        "position": 0,
        "description":
            "ボトムス｜20代・30代・40代の女性におすすめな大人レディースカジュアルフェミニンファッション通販サイト！スカート/スキニージーンズ/ガウチョパンツ/サルエルパンツ/ショートパンツ/オーバーオール/オールインワン/レギンスなどお得な各種SALEも開催中！トレンドファッションアイテムが目白押し！",
        "options": [],
        "created_at": "2019-04-03 09:57:36",
        "updated_at": "2019-05-29 08:51:23",
        "is_enabled": 1,
        "precautions": [],
        "sites": null,
        "url": "http://192.168.1.174/bottoms-c-12.html",
        "thumb": {
          "id": 48543,
          "disk_name": "5cc82a24468e7813065884.png",
          "file_name": "裤子.png",
          "file_size": 13398,
          "content_type": "image/png",
          "title": null,
          "description": null,
          "field": "thumb",
          "sort_order": 48543,
          "created_at": "2019-04-30 11:57:40",
          "updated_at": "2019-04-30 11:57:44",
          "scene_id": 0,
          "path":
              "//imgs.veralady.com/uploads/public/5cc/82a/244/5cc82a24468e7813065884.png",
          "extension": "png"
        },
        "icon": null
      },
      {
        "id": 32,
        "parent_id": 1,
        "nest_left": 89,
        "nest_right": 102,
        "nest_depth": 1,
        "name": "シューズ",
        "name2": "女鞋",
        "slug": "shoes",
        "page_title": "シューズレディースファッション豊富な通販∣COCO7S",
        "meta_keywords":
            "20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,キュート,ファッション,レトロ,セクシー,タイト,OL,通勤,ビーチ,クラシック,パンプス,痛くない,bath,歩きやすい,ストラップ,ローヒール,黒,ウェッジソールパンプス,オープントゥパン,サンダル,ウェッジソールサンダル,アンクルストラップサンダル,バックストラップサンダル,サボサンダル,レースアップサンダル,コンフォートサンダル,ミュール,トングサンダル,ビーチサンダル,スポーツサンダル,シャワーサンダル,ヒー",
        "meta_description":
            "20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,キュート,ファッション,レトロ,セクシー,タイト,OL,通勤,ビーチ,クラシック,パンプス,痛くない,bath,歩きやすい,ストラップ,ローヒール,黒,ウェッジソールパンプス,オープントゥパン,サンダル,ウェッジソールサンダル,アンクルストラップサンダル,バックストラップサンダル,サボサンダル,レースアップサンダル,コンフォートサンダル,ミュール,トングサンダル,ビーチサンダル,スポーツサンダル,シャワーサンダル,ヒー",
        "position": 0,
        "description":
            "シューズ｜20代・30代・40代の女性におすすめな大人レディースカジュアルフェミニンファッション通販サイト！パンプス/サンダル/スニーカー/フラットシューズ/スリッパ/ブーツなどお得な各種SALEも開催中！トレンドファッションアイテムが目白押し！",
        "options": [],
        "created_at": "2019-04-28 03:56:39",
        "updated_at": "2019-05-29 08:53:29",
        "is_enabled": 1,
        "precautions": [],
        "sites": null,
        "url": "http://192.168.1.174/shoes-c-32.html",
        "thumb": {
          "id": 48542,
          "disk_name": "5cc82a1417bdb880358816.png",
          "file_name": "鞋.png",
          "file_size": 25009,
          "content_type": "image/png",
          "title": null,
          "description": null,
          "field": "thumb",
          "sort_order": 48542,
          "created_at": "2019-04-30 11:57:24",
          "updated_at": "2019-04-30 11:57:28",
          "scene_id": 0,
          "path":
              "//imgs.veralady.com/uploads/public/5cc/82a/141/5cc82a1417bdb880358816.png",
          "extension": "png"
        },
        "icon": null
      },
      {
        "id": 36,
        "parent_id": 1,
        "nest_left": 103,
        "nest_right": 110,
        "nest_depth": 1,
        "name": "セットアップ",
        "name2": "套装",
        "slug": "setup",
        "page_title": "セットアップレディースファッション豊富な通販∣COCO7S",
        "meta_keywords":
            "セットアップ レディース スカート,セットアップ レディース スウェット,フォーマル,ジャケット,ジャージ,スーツ, 結婚式,ボーダー，春,夏,秋,冬,マタニティ,スキニー膝丈,くびれ,レース,お嬢様,フレアワンピ,半袖,タイト,高級,大人,清楚,お呼ばれ,レディース通販,綺麗目,激安,タイト，フェミニン，大人可愛い,コーデ,ファッションアイテム,モテ服,ウケ抜群,あす楽,ドキッ,プチプラゆったり,スリット,おしゃれ,通販,注目トレンド,大きいサイズ,上品,20代　30代　40代　50代,長袖 きれいめ",
        "meta_description":
            "セットアップ レディース スカート,セットアップ レディース スウェット,フォーマル,ジャケット,ジャージ,スーツ, 結婚式,ボーダー，春,夏,秋,冬,マタニティ,スキニー膝丈,くびれ,レース,お嬢様,フレアワンピ,半袖,タイト,高級,大人,清楚,お呼ばれ,レディース通販,綺麗目,激安,タイト，フェミニン，大人可愛い,コーデ,ファッションアイテム,モテ服,ウケ抜群,あす楽,ドキッ,プチプラゆったり,スリット,おしゃれ,通販,注目トレンド,大きいサイズ,上品,20代　30代　40代　50代,長袖 きれいめ",
        "position": 0,
        "description":
            "セットアップ｜セットアップ すべての商品 「セットアップ」 の商品一覧ページです。COCO7Sのオンラインショップ。プチプライス・お買得バーゲン商品、セットアップコーデ、上下セット、人気レディースセットアップも豊富に取り揃えています!新作アイテムが続々入荷中！お得なセールやイベント毎日開催！最新アイテムを安くまとめ買いしよう。",
        "options": [],
        "created_at": "2019-04-28 03:59:40",
        "updated_at": "2019-05-29 08:54:32",
        "is_enabled": 1,
        "precautions": [],
        "sites": null,
        "url": "http://192.168.1.174/setup-c-36.html",
        "thumb": {
          "id": 48541,
          "disk_name": "5cc82a094759a859992810.png",
          "file_name": "套装.png",
          "file_size": 10950,
          "content_type": "image/png",
          "title": null,
          "description": null,
          "field": "thumb",
          "sort_order": 48541,
          "created_at": "2019-04-30 11:57:13",
          "updated_at": "2019-04-30 11:57:16",
          "scene_id": 0,
          "path":
              "//imgs.veralady.com/uploads/public/5cc/82a/094/5cc82a094759a859992810.png",
          "extension": "png"
        },
        "icon": null
      },
      {
        "id": 71,
        "parent_id": 1,
        "nest_left": 123,
        "nest_right": 136,
        "nest_depth": 1,
        "name": "小物",
        "name2": "小物",
        "slug": "accessory",
        "page_title": "小物レディースファッション豊富な通販∣COCO7S",
        "meta_keywords":
            "人気,春,夏,秋,冬,フェミニン，大人可愛い,コーデ,20代　30代　40代　50代,高級,清楚,綺麗目,激安,ファッションアイテム,フェミニン，ウケ抜群,通販,注目トレンド,お嬢様,おしゃれ,バッグ,ハット,腕時計,マフラー/ストール/スカーフ,ベルト,アクセサリー,",
        "meta_description":
            "人気,春,夏,秋,冬,フェミニン，大人可愛い,コーデ,20代　30代　40代　50代,高級,清楚,綺麗目,激安,ファッションアイテム,フェミニン，ウケ抜群,通販,注目トレンド,お嬢様,おしゃれ,バッグ,ハット,腕時計,マフラー/ストール/スカーフ,ベルト,アクセサリー,",
        "position": 0,
        "description":
            "COCO7Sは人気の小物など豊富に取り揃えるファッション通販サイトです。トートバッグやバックパック、リュックピアスやネックレス、リングなど、定番アイテムから最新トレンドアイテムまでオンラインでご購入いただけます。新着アイテムが毎日入荷中！お得なセールやイベント毎日開催！最新アイテムを安くまとめ買いしよう。",
        "options": [],
        "created_at": "2019-04-28 07:08:52",
        "updated_at": "2021-05-04 19:35:14",
        "is_enabled": 1,
        "precautions": [],
        "sites": null,
        "url": "http://192.168.1.174/accessory-c-71.html",
        "thumb": {
          "id": 79845,
          "disk_name": "6091235d4d398517850800.jpg",
          "file_name": "5fd6d5ae7b629308738674.jpg",
          "file_size": 177216,
          "content_type": "image/jpeg",
          "title": null,
          "description": null,
          "field": "thumb",
          "sort_order": 79845,
          "created_at": "2021-05-04 19:35:09",
          "updated_at": "2021-05-04 19:35:15",
          "scene_id": 0,
          "path":
              "//imgs.veralady.com/uploads/public/609/123/5d4/6091235d4d398517850800.jpg",
          "extension": "jpg"
        },
        "icon": null
      }
    ];
    conditionInfoModels = CategoryInfoModel.fromList(data);
    notifyListeners();
     */

    try {
      MyResponse<List<CategoryInfoModel>> response =
          await getCategoryChilds(id: id);
      if (response.common.statusCode == 1000) {
        categoryInfoModels = response.response!.data!;
        notifyListeners();
      } else {
        categoryInfoModels = [];
        notifyListeners();
      }
    } catch (s, e) {
      print('请求报错:$e');
    }
  }

  /// 收藏或者取消收藏
  Future collectionAction(int index) async {
    int product_id = 0;
    try {
      product_id = goodsInfoList[index].id;
      goodsInfoList[index].isWished = !goodsInfoList[index].isWished;

      /// 通知所有这个商品改变状态
      XEvent.post(
          EVENT_KEY_WISHED,
          WishedModelReq(
              id: product_id, isWished: goodsInfoList[index].isWished));

      Map<String, dynamic> params = {"product_id": product_id};

      /// 发送请求
      MyResponse response = await operationIsWished(params: params);
      if (response.common.statusCode == 1000) {
      } else {
        product_id = goodsInfoList[index].id;
        goodsInfoList[index].isWished = !goodsInfoList[index].isWished;

        /// 通知所有这个商品改变状态
        XEvent.post(
            EVENT_KEY_WISHED,
            WishedModelReq(
                id: product_id, isWished: goodsInfoList[index].isWished));
      }
    } catch (s, e) {
      print('请求报错:$e');
    }
  }
}
