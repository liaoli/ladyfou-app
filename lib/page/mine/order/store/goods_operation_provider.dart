/*
 * @Descripttion: TODO
 * @FileName: goods_operation_provider
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/23/22 11:15 AM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ladyfou/core/http/request.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/http/response.dart';
import '../../../../core/model/category_info_model.dart';
import '../../../../core/model/good_info_model.dart';

class GoodsOperationProvider with ChangeNotifier {
  bool isRequestError = false;
  int currentPage = CURRENT_PAGE;
  EasyRefreshController refreshController = EasyRefreshController();
  bool isEditCollection = false;

  List<GoodsInfoModel> goodCollectionList = [];
  List<GoodsInfoModel> selectCollectionGoodList = [];
  List<CategoryInfoModel> categoryInfoModels = [];


  List<CategoryInfoModel> selectCategoryInfoModels = [];

  /// 获取二级分类商品列表
  Future getCollectionLists(
      {int promotion = 0,
      int cid = 0,
      bool isFirst = false,
      bool isRefresh = true,
      int page = CURRENT_PAGE,
      int size = PAGE_SIZE}) async {
    if (isFirst || isRefresh) page = CURRENT_PAGE;

    List data = [{"id":7931,"name":"product_7931","status":"instock","list_price":2376,"price":2200,"amount":5000,"max_qty":0,"saled":22,"rating":5,"created_at":"2019-05-28 07:38:37","src_price":"2200","promotion_price":"2200","discount":"","url":"/skatap-sleeve-casual-blouse-p-7931.html","point":"1008","tags":[],"f_thumb":"http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png","is_restricted_blessing_bag":0,"feature_image":[],"cids":[2,21],"options":[],"wishlist_total":"","reviews_total":"","is_lucky_bag":0},{"id":2811,"name":"product_2811","status":"instock","list_price":44,"price":22,"amount":1911016,"max_qty":0,"saled":424,"rating":5,"created_at":"2019-04-28 06:52:05","src_price":"22","promotion_price":"22","discount":"","url":"/long-sleeve-casual-dress-p-2811.html","point":"0","tags":[],"f_thumb":"http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png","is_restricted_blessing_bag":0,"feature_image":[],"cids":[25,18],"options":[],"wishlist_total":"","reviews_total":"","is_lucky_bag":0},{"id":7937,"name":"product_7937","status":"instock","list_price":5346,"price":4455,"amount":599983,"max_qty":0,"saled":1,"rating":5,"created_at":"2019-05-28 08:59:05","src_price":"4455","promotion_price":"4455","discount":"","url":"/vneck-commute-dress-p-7937.html","point":"44","tags":[],"f_thumb":"http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg","is_restricted_blessing_bag":0,"feature_image":["http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg","http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg"],"cids":[25,29],"options":[],"wishlist_total":"","reviews_total":"","is_lucky_bag":0}];
    goodCollectionList = GoodsInfoModel.fromList(data);
    notifyListeners();

    /*
    Map<String, dynamic> params = {
      "promotion": promotion,
      "cid": cid,
      "page": page,
      "size": size,
    };
    try {
      MyResponse<List<GoodsInfoModel>> response =
          await getCollectionInfos(params: params);
      if (response.common.statusCode == 1000) {
        List<GoodsInfoModel> modelList = response.response!.data!;

        /// 第一次请求
        if (isFirst) {
          goodCollectionList = modelList;
          currentPage = response.common.pageEnabled.currentPage;
        } else {
          if (isRefresh) {
            goodCollectionList.clear();
            goodCollectionList = modelList;
            refreshController.finishRefresh();
            refreshController.finishLoad();
          } else {
            if (goodCollectionList.length <
                response.common.pageEnabled.totalPage) {
              refreshController.finishLoad();
            } else {
              refreshController.finishLoad(noMore: true);
            }
            goodCollectionList.addAll(modelList);
          }
        }
        notifyListeners();
      } else {
        isRequestError = true;
        goodCollectionList.clear();
        goodCollectionList = [];
        refreshController.finishRefresh();
        refreshController.finishLoad();
        notifyListeners();
      }
    } catch (s, e) {
      print('请求报错:$e');
    }
     */
  }

  /// 获取一级二级分类的分类数据
  Future getCategoryChildDatas(int id) async {
    List data = [{"id":25,"parent_id":1,"nest_left":1,"nest_right":30,"nest_depth":1,"name":"ワンピース","name2":"连衣裙","slug":"dress","page_title":"ワンピースレディースファッション豊富な通販∣COCO7S","meta_keywords":"エレガントワンピース,カジュアルワンピース,セクシーワンピース,ＯＬ通勤ワンピース,レトロワンピース,ロリワンピース,花柄ワンピース,レースワンピース,デニムワンピース,ニットワンピース,ビーチワンピース,ロングワンピース,デートワンピース,ボーダー,春,夏,秋,冬,清楚可愛い ワンピース,ワンピース コーデ,ワンピース 長袖 きれいめ,通販,注目トレンド,大きいサイズ,上品,20代　30代　40代　50代,着てほしい,ファッションアイテム,モテ服,ウケ抜群,あす楽,ドキッ,プチプラゆったりスリットおしゃ","meta_description":"エレガントワンピース,カジュアルワンピース,セクシーワンピース,ＯＬ通勤ワンピース,レトロワンピース,ロリワンピース,花柄ワンピース,レースワンピース,デニムワンピース,ニットワンピース,ビーチワンピース,ロングワンピース,デートワンピース,ボーダー,春,夏,秋,冬,清楚可愛い ワンピース,ワンピース コーデ,ワンピース 長袖 きれいめ,通販,注目トレンド,大きいサイズ,上品,20代　30代　40代　50代,着てほしい,ファッションアイテム,モテ服,ウケ抜群,あす楽,ドキッ,プチプラゆったりスリットおしゃ","position":0,"description":"ワンピース｜レディースファッションアイテムワンピースをお探しならコチラ。オシャレなトレンドアイテムいっぱいの、COCO7Sの通販サイトへようこそ。ポイントサービスでお買物のたびにさらにお得。豊富な品揃えからご希望条件でカンタン検索。話題の最新トレンドをリアルタイムに チェック。エレガントワンピ｜カジュアルワンピ｜セクシーワンピ｜ＯＬ通勤ワンピ｜レトロワンピ｜ロリワンピ｜花柄ワンピ｜レースワンピ｜デニムワンピ｜ニットワンピ｜ビーチワンピ｜ロングワンピ｜デートワンピなどトレンドファッションアイテムが目白押し！","options":[],"created_at":"2019-04-28 03:50:34","updated_at":"2022-02-18 17:39:33","is_enabled":1,"precautions":[["反倒是房顶上","说的分手的"],["上的发生地方","斯蒂芬森"],["水电费","发多少是"]],"sites":[],"url":"http://192.168.1.174/dress-c-25.html","thumb":{"id":79844,"disk_name":"609123253838b551805523.gif","file_name":"5db8f78d81fa1261459839.gif","file_size":6890,"content_type":"image/gif","title":null,"description":null,"field":"thumb","sort_order":79844,"created_at":"2021-05-04 19:34:13","updated_at":"2021-05-04 19:34:15","scene_id":0,"path":"//imgs.veralady.com/uploads/public/609/123/253/609123253838b551805523.gif","extension":"gif"},"icon":null},{"id":2,"parent_id":1,"nest_left":31,"nest_right":48,"nest_depth":1,"name":"トップス","name2":"上衣","slug":"tops","page_title":"トップスレディースファッション豊富な通販∣COCO7S","meta_keywords":"20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,シフォン,コント,無地,長袖,半袖,スリム,タイト,リボン, 生地,シンプル,デザイン,飾り,カザリ,通勤,OL,オフィス,休み,GW,セール,女子力,可愛い,注目,形態安定,限定,トップス,レディース,きれいめ,春夏,夏,レース,安い,ランキング","meta_description":"20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,シフォン,コント,無地,長袖,半袖,スリム,タイト,リボン,\r\n生地,シンプル,デザイン,飾り,カザリ,通勤,OL,オフィス,休み,GW,セール,女子力,可愛い,注目,形態安定,限定,トップス,レディース,きれいめ,春夏,夏,レース,安い,ランキング","position":0,"description":"トップス｜20代・30代・40代の女性におすすめな大人レディースカジュアルフェミニンファッション通販サイト！お得な各種SALEも開催中！ニット/Tシャツ/ ブラウス/カットソー/タンクトップ/セーター/スウェット·パーカー/チュニックなどトレンドファッションアイテムが目白押し！","options":[],"created_at":"2019-04-03 09:39:54","updated_at":"2020-07-03 18:04:15","is_enabled":1,"precautions":[],"sites":null,"url":"http://192.168.1.174/tops-c-2.html","thumb":{"id":48545,"disk_name":"5cc82a3f17604291486756.png","file_name":"上装.png","file_size":185380,"content_type":"image/png","title":null,"description":null,"field":"thumb","sort_order":48545,"created_at":"2019-04-30 11:58:07","updated_at":"2019-04-30 11:58:11","scene_id":0,"path":"//imgs.veralady.com/uploads/public/5cc/82a/3f1/5cc82a3f17604291486756.png","extension":"png"},"icon":null},{"id":12,"parent_id":1,"nest_left":69,"nest_right":88,"nest_depth":1,"name":"ボトムス","name2":"下装","slug":"bottoms","page_title":"ボトムスレディースファッション豊富な通販∣COCO7S","meta_keywords":"20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,キュート,ファッション,レトロ,セクシー,タイト,OL,通勤,個性派,知的,リッチ,エレガント,安くてかわいい,上質,アバンギャルド,ストリート,簡潔,上品,クラシック,シフォン,スカート,20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,OL,通勤,ビーチ,クラブ,スウィート,エレガント,個性派,知的,リッチ,エレガント,清新,すがすがしい,カッコイイ,海外トレンド,安カワ,スキニージーン","meta_description":"20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,キュート,ファッション,レトロ,セクシー,タイト,OL,通勤,個性派,知的,リッチ,エレガント,安くてかわいい,上質,アバンギャルド,ストリート,簡潔,上品,クラシック,シフォン,スカート,20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,OL,通勤,ビーチ,クラブ,スウィート,エレガント,個性派,知的,リッチ,エレガント,清新,すがすがしい,カッコイイ,海外トレンド,安カワ,スキニージーン","position":0,"description":"ボトムス｜20代・30代・40代の女性におすすめな大人レディースカジュアルフェミニンファッション通販サイト！スカート/スキニージーンズ/ガウチョパンツ/サルエルパンツ/ショートパンツ/オーバーオール/オールインワン/レギンスなどお得な各種SALEも開催中！トレンドファッションアイテムが目白押し！","options":[],"created_at":"2019-04-03 09:57:36","updated_at":"2019-05-29 08:51:23","is_enabled":1,"precautions":[],"sites":null,"url":"http://192.168.1.174/bottoms-c-12.html","thumb":{"id":48543,"disk_name":"5cc82a24468e7813065884.png","file_name":"裤子.png","file_size":13398,"content_type":"image/png","title":null,"description":null,"field":"thumb","sort_order":48543,"created_at":"2019-04-30 11:57:40","updated_at":"2019-04-30 11:57:44","scene_id":0,"path":"//imgs.veralady.com/uploads/public/5cc/82a/244/5cc82a24468e7813065884.png","extension":"png"},"icon":null},{"id":32,"parent_id":1,"nest_left":89,"nest_right":102,"nest_depth":1,"name":"シューズ","name2":"女鞋","slug":"shoes","page_title":"シューズレディースファッション豊富な通販∣COCO7S","meta_keywords":"20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,キュート,ファッション,レトロ,セクシー,タイト,OL,通勤,ビーチ,クラシック,パンプス,痛くない,bath,歩きやすい,ストラップ,ローヒール,黒,ウェッジソールパンプス,オープントゥパン,サンダル,ウェッジソールサンダル,アンクルストラップサンダル,バックストラップサンダル,サボサンダル,レースアップサンダル,コンフォートサンダル,ミュール,トングサンダル,ビーチサンダル,スポーツサンダル,シャワーサンダル,ヒー","meta_description":"20代,30代,40代,フェミニン,大人,エレガント,カジュアル,ファション,オシャレ,キュート,ファッション,レトロ,セクシー,タイト,OL,通勤,ビーチ,クラシック,パンプス,痛くない,bath,歩きやすい,ストラップ,ローヒール,黒,ウェッジソールパンプス,オープントゥパン,サンダル,ウェッジソールサンダル,アンクルストラップサンダル,バックストラップサンダル,サボサンダル,レースアップサンダル,コンフォートサンダル,ミュール,トングサンダル,ビーチサンダル,スポーツサンダル,シャワーサンダル,ヒー","position":0,"description":"シューズ｜20代・30代・40代の女性におすすめな大人レディースカジュアルフェミニンファッション通販サイト！パンプス/サンダル/スニーカー/フラットシューズ/スリッパ/ブーツなどお得な各種SALEも開催中！トレンドファッションアイテムが目白押し！","options":[],"created_at":"2019-04-28 03:56:39","updated_at":"2019-05-29 08:53:29","is_enabled":1,"precautions":[],"sites":null,"url":"http://192.168.1.174/shoes-c-32.html","thumb":{"id":48542,"disk_name":"5cc82a1417bdb880358816.png","file_name":"鞋.png","file_size":25009,"content_type":"image/png","title":null,"description":null,"field":"thumb","sort_order":48542,"created_at":"2019-04-30 11:57:24","updated_at":"2019-04-30 11:57:28","scene_id":0,"path":"//imgs.veralady.com/uploads/public/5cc/82a/141/5cc82a1417bdb880358816.png","extension":"png"},"icon":null},{"id":36,"parent_id":1,"nest_left":103,"nest_right":110,"nest_depth":1,"name":"セットアップ","name2":"套装","slug":"setup","page_title":"セットアップレディースファッション豊富な通販∣COCO7S","meta_keywords":"セットアップ レディース スカート,セットアップ レディース スウェット,フォーマル,ジャケット,ジャージ,スーツ, 結婚式,ボーダー，春,夏,秋,冬,マタニティ,スキニー膝丈,くびれ,レース,お嬢様,フレアワンピ,半袖,タイト,高級,大人,清楚,お呼ばれ,レディース通販,綺麗目,激安,タイト，フェミニン，大人可愛い,コーデ,ファッションアイテム,モテ服,ウケ抜群,あす楽,ドキッ,プチプラゆったり,スリット,おしゃれ,通販,注目トレンド,大きいサイズ,上品,20代　30代　40代　50代,長袖 きれいめ","meta_description":"セットアップ レディース スカート,セットアップ レディース スウェット,フォーマル,ジャケット,ジャージ,スーツ, 結婚式,ボーダー，春,夏,秋,冬,マタニティ,スキニー膝丈,くびれ,レース,お嬢様,フレアワンピ,半袖,タイト,高級,大人,清楚,お呼ばれ,レディース通販,綺麗目,激安,タイト，フェミニン，大人可愛い,コーデ,ファッションアイテム,モテ服,ウケ抜群,あす楽,ドキッ,プチプラゆったり,スリット,おしゃれ,通販,注目トレンド,大きいサイズ,上品,20代　30代　40代　50代,長袖 きれいめ","position":0,"description":"セットアップ｜セットアップ すべての商品 「セットアップ」 の商品一覧ページです。COCO7Sのオンラインショップ。プチプライス・お買得バーゲン商品、セットアップコーデ、上下セット、人気レディースセットアップも豊富に取り揃えています!新作アイテムが続々入荷中！お得なセールやイベント毎日開催！最新アイテムを安くまとめ買いしよう。","options":[],"created_at":"2019-04-28 03:59:40","updated_at":"2019-05-29 08:54:32","is_enabled":1,"precautions":[],"sites":null,"url":"http://192.168.1.174/setup-c-36.html","thumb":{"id":48541,"disk_name":"5cc82a094759a859992810.png","file_name":"套装.png","file_size":10950,"content_type":"image/png","title":null,"description":null,"field":"thumb","sort_order":48541,"created_at":"2019-04-30 11:57:13","updated_at":"2019-04-30 11:57:16","scene_id":0,"path":"//imgs.veralady.com/uploads/public/5cc/82a/094/5cc82a094759a859992810.png","extension":"png"},"icon":null},{"id":71,"parent_id":1,"nest_left":123,"nest_right":136,"nest_depth":1,"name":"小物","name2":"小物","slug":"accessory","page_title":"小物レディースファッション豊富な通販∣COCO7S","meta_keywords":"人気,春,夏,秋,冬,フェミニン，大人可愛い,コーデ,20代　30代　40代　50代,高級,清楚,綺麗目,激安,ファッションアイテム,フェミニン，ウケ抜群,通販,注目トレンド,お嬢様,おしゃれ,バッグ,ハット,腕時計,マフラー/ストール/スカーフ,ベルト,アクセサリー,","meta_description":"人気,春,夏,秋,冬,フェミニン，大人可愛い,コーデ,20代　30代　40代　50代,高級,清楚,綺麗目,激安,ファッションアイテム,フェミニン，ウケ抜群,通販,注目トレンド,お嬢様,おしゃれ,バッグ,ハット,腕時計,マフラー/ストール/スカーフ,ベルト,アクセサリー,","position":0,"description":"COCO7Sは人気の小物など豊富に取り揃えるファッション通販サイトです。トートバッグやバックパック、リュックピアスやネックレス、リングなど、定番アイテムから最新トレンドアイテムまでオンラインでご購入いただけます。新着アイテムが毎日入荷中！お得なセールやイベント毎日開催！最新アイテムを安くまとめ買いしよう。","options":[],"created_at":"2019-04-28 07:08:52","updated_at":"2021-05-04 19:35:14","is_enabled":1,"precautions":[],"sites":null,"url":"http://192.168.1.174/accessory-c-71.html","thumb":{"id":79845,"disk_name":"6091235d4d398517850800.jpg","file_name":"5fd6d5ae7b629308738674.jpg","file_size":177216,"content_type":"image/jpeg","title":null,"description":null,"field":"thumb","sort_order":79845,"created_at":"2021-05-04 19:35:09","updated_at":"2021-05-04 19:35:15","scene_id":0,"path":"//imgs.veralady.com/uploads/public/609/123/5d4/6091235d4d398517850800.jpg","extension":"jpg"},"icon":null}];
    categoryInfoModels = CategoryInfoModel.fromList(data);
    notifyListeners();
    /*
    try {
      MyResponse<List<CategoryInfoModel>> response = await getCategoryChilds(id: id);
      if (response.common.statusCode == 1000) {
        categoryInfoModels = response.response!.data!;
        notifyListeners();
      }else {
        categoryInfoModels = [];
        notifyListeners();
      }
    } catch (s,e) {
      print('请求报错:$e');
    }

     */
  }

  /// 点击编辑还是完成
  Future checkEditCollection() async {
    isEditCollection = !isEditCollection;
    notifyListeners();
  }

  /// 选中或者取消选中
  Future checkSelectCollection(GoodsInfoModel model) async {
    if (selectCollectionGoodList.length == 0) {
      selectCollectionGoodList.add(model);
    }else {
      bool isExit = false;
      selectCollectionGoodList.forEach((e) {
        if (model.id == e.id) {
          isExit = true;
        }
      });
      if (isExit) {
        selectCollectionGoodList.removeWhere((element) => element.id == model.id);
      }else {
        selectCollectionGoodList.add(model);
      }
    }
    notifyListeners();
  }
}
