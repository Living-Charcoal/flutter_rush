import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rush/constant/net_constant.dart';
import 'package:flutter_rush/network/cache_interceptor.dart';

class HttpUtils {
  HttpUtils([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext context;
  Options _options;
  static Dio dio =new Dio(BaseOptions(baseUrl: NetConstant.DOMAINS));

  static void init(){
    dio.interceptors.add(NetCache());
  }
}
