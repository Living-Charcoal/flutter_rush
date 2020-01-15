import 'package:flutter/material.dart';
import 'package:flutter_rush/model/banner_model.dart';
import 'package:flutter_rush/network/http_utils.dart';
import 'package:flutter_rush/page/browser_page.dart';
import 'package:flutter_rush/utils/global_utils.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperWidget extends StatefulWidget {
  const SwiperWidget({Key key}):super(key:key);
  @override
  _SwiperWidgetState createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  List<BannerModel> _bannerList = List();
  @override
  void initState() {
    HttpUtils().requestBanner().then((v) {
      setState(() {
        _bannerList.clear();
        _bannerList = v;
      });

    });
    super.initState();
    print("SwiperWidget init");

  }
  @override
  Widget build(BuildContext context) {
    print("SwiperWidget build");
//    FutureBuilder(
//      future: ,
//      builder: (context,snap){
//
//      },
//    );
    return
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
            GlobalUtils.calcWidgetHeightMultiple(0.25)))
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
  @override
  void dispose() {
    _bannerList=null;
    super.dispose();
  }
}
