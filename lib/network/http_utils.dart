import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rush/constant/net_constant.dart';
import 'package:flutter_rush/model/banner_model.dart';
import 'package:flutter_rush/model/base_response.dart';
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
    List<BannerModel> list = BaseResponse<List<dynamic>>.fromJson(res.data).data.map((j)=>BannerModel.fromJson(j)).toList();
    return list;
  }
}
