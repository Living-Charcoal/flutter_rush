import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rush/model/banner_model.dart';
import 'package:flutter_rush/model/hot_keys.dart';
import 'package:flutter_rush/network/http_utils.dart';
import 'package:flutter_rush/page/browser_page.dart';
import 'package:flutter_rush/utils/global_utils.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MainContentWidget extends StatefulWidget {
  @override
  _MainContentWidgetState createState() => _MainContentWidgetState();
}

class _MainContentWidgetState extends State<MainContentWidget> {
  List<BannerModel> _bannerList = List();
  List<HotKeys> _hotKeys = List();

  @override
  void initState() {
    super.initState();
    HttpUtils().requestBanner().then((v) {
      setState(() {
        _bannerList.clear();
        _bannerList = v;
      });

    });
    HttpUtils().requestHotKeys().then((o) {
      setState(() {
        _hotKeys.clear();
        _hotKeys = o;
      });

    });
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
    return RefreshIndicator(
      color: Colors.red,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ConstrainedBox(
                child: Swiper(
                  duration: 500,
                  autoplay: true,
                  pagination: new SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.grey, activeColor: Colors.white)),
                  itemCount: _bannerList.length,
                  itemBuilder: (context, index) => _buildBanner(index),
                  viewportFraction: 0.8,
                  scale: 0.9,
                  onTap: _tapBanner,
                ),
                constraints: new BoxConstraints.loose(new Size(
                    GlobalUtils.calcScreenWidth(),
                    GlobalUtils.calcWidgetHeightMultiple(0.25)))),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Hot keys",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.all(
                        GlobalUtils.calcWidgetHeightMultiple(0.015)),
                  ),
                  Container(
                    width: GlobalUtils.calcScreenWidth(),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: _hotKeys.length,
                      itemBuilder: (context, index) => _buildItem(index),
                      scrollDirection: Axis.horizontal,
                    ),
                    height: GlobalUtils.calcWidgetHeightMultiple(0.1),
                  )
                ],
              ),
              constraints: new BoxConstraints.loose(new Size(
                  GlobalUtils.calcScreenWidth(),
                  GlobalUtils.calcWidgetHeightMultiple(0.2))),
            )
          ],
        ),
      ),
      onRefresh: _handleRefresh,
    );
  }

  Widget _buildItem(int index) {
    print("size    ${_hotKeys.length}");
    return Card(
      margin: EdgeInsets.all(9),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0))),
      clipBehavior: Clip.hardEdge,

      child: Container(
        child: Center(
          child: Text(_hotKeys[index].name.trim(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        ),
        width: GlobalUtils.calcWidgetWidthMultiple(0.25),
      ),
    );

  }

  Widget _buildBanner(int index) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0))),
      child: Image(
        image: NetworkImage(_bannerList[index].imagePath),
        fit: BoxFit.fill,
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 4.0,
    );
  }

  void _tapBanner(int index) async {
    await Navigator.of(this.context).push(MaterialPageRoute(builder: (_) {
      return Browser(
        title: _bannerList[index].title,
        url: _bannerList[index].url,
      );
    }));
  }
}
