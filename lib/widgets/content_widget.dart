import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rush/model/banner_model.dart';
import 'package:flutter_rush/network/http_utils.dart';
import 'package:flutter_rush/widgets/hotkeys_widget.dart';
import 'package:flutter_rush/widgets/usefulsite_widget.dart';
import 'package:flutter_rush/widgets/swiper_widget.dart';

class MainContentWidget extends StatefulWidget {
  @override
  _MainContentWidgetState createState() => _MainContentWidgetState();
}

class _MainContentWidgetState extends State<MainContentWidget> {
  List<BannerModel> _bannerList = List();

  @override
  void initState() {
    super.initState();
  }

  Future<Null> _handleRefresh() async {
    await HttpUtils().requestBanner().then((t) {
      setState(() {
        _bannerList.clear();
        _bannerList = t;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("MainContentWidget build");
    return RefreshIndicator(
      color: Colors.red,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SwiperWidget(),
            const HotKeyWidget(),
            const UsefulSiteWidget()
          ],
        ),
      ),
      onRefresh: _handleRefresh,
    );
  }
}
