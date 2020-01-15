
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rush/constant/net_constant.dart';
import 'package:flutter_rush/model/banner_model.dart';
import 'package:flutter_rush/model/base_response.dart';
import 'package:flutter_rush/model/hot_keys.dart';
import 'package:flutter_rush/model/useful_site_entity.dart';
import 'package:flutter_rush/network/cache_interceptor.dart';

class HttpUtils {


  HttpUtils([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext context;
  Options _options;
  static Dio dio = Dio(BaseOptions(baseUrl: NetConstant.DOMAINS));



  static void init() {
    dio.interceptors.add(NetCache());
  }

  Future<List<BannerModel>> requestBanner() async {
    var res = await dio.get(NetConstant.BANNER_JSON,
        options: _options.merge(extra: {"noCache": false}));
    List<BannerModel> list = BaseResponse<List<dynamic>>.fromJson(res.data)
        .data
        .map((j) => BannerModel.fromJson(j))
        .toList();
    return list;
  }

  Future<List<HotKeys>> requestHotKeys() async {
    var p = await dio.get(NetConstant.HOT_KEYS,
        options: _options.merge(extra: {"noCache": false}));
    List<HotKeys> ret = BaseResponse<List<dynamic>>.fromJson(p.data)
        .data
        .map((f) => HotKeys.fromJson(f))
        .toList();
    return ret;
  }

  Future<List<UsefulSiteEntity>> requestArticleModel() async{
    var res  = await dio.get(NetConstant.USEFUL_SITE,options: _options.merge(extra: {"noCache": false}));
    List<UsefulSiteEntity> ret = BaseResponse<List<dynamic>>.fromJson(res.data).data.map((f)=>UsefulSiteEntity.fromJson(f)).toList();
    return ret;
  }

}
