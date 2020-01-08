import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rush/model/banner_model.dart';
import 'package:flutter_rush/network/http_utils.dart';

class MainContentWidget extends StatefulWidget {
  @override
  _MainContentWidgetState createState() => _MainContentWidgetState();
}

class _MainContentWidgetState extends State<MainContentWidget> {
  List<BannerModel> _bannerList = List() ;

  @override
  void initState() {
    super.initState();
    HttpUtils().requestBanner().then((list) => _bannerList = list);
  }


  Future<Null> _handleRefresh() async {
    print('refresh');
    await HttpUtils().requestBanner().then((t){
      setState(() {
        _bannerList.clear();
        _bannerList=t;
        return;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("_MainContentWidgetState");
    return RefreshIndicator(
      color: Colors.pink,
      child: SingleChildScrollView(
        child: Column(
            children: Iterable.generate(50).map((v)=>Image.network(_bannerList[Random().nextInt(_bannerList.length-1)].imagePath)).toList()),
      ),
      onRefresh: _handleRefresh,
    );
  }
}
