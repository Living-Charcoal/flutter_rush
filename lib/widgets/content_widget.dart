import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rush/model/banner_model.dart';
import 'package:flutter_rush/network/http_utils.dart';
import 'package:flutter_rush/page/browser_page.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MainContentWidget extends StatefulWidget {
  @override
  _MainContentWidgetState createState() => _MainContentWidgetState();
}

class _MainContentWidgetState extends State<MainContentWidget> {
  List<BannerModel> _bannerList = List();

  @override
  void initState() {
    super.initState();
    HttpUtils().requestBanner().then((list){
      _bannerList=list;
    });

  }

  Future<Null> _handleRefresh() async {
    await HttpUtils().requestBanner().then((t) {
      setState(() {
        _bannerList.clear();
        _bannerList = t;
        return;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.red,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              child: Swiper(
                duration: 500,
                autoplay: true,
                pagination: new SwiperPagination(builder: DotSwiperPaginationBuilder(color: Colors.grey,activeColor: Colors.white)),
                itemCount: _bannerList.length,
                itemBuilder: (context,index)=>_buildBanner(index),
                viewportFraction: 0.8,
                scale: 0.9,
                onTap: _tapBanner,
              ),
                constraints:new BoxConstraints.loose(new Size(450.0, 190.0))

            )


          ],
        ),
      ),
      onRefresh: _handleRefresh,
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

  void _tapBanner(int index) async{
    await Navigator.of(this.context).push(MaterialPageRoute(builder: (_){
      return  Browser(title: _bannerList[index].title,url: _bannerList[index].url,);
    }));

  }
}
