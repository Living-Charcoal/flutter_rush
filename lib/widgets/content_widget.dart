import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rush/provide/main_article_provider.dart';
import 'package:flutter_rush/provide/swiper_data.dart';
import 'package:flutter_rush/provide/top_article.dart';
import 'package:flutter_rush/widgets/article_widget.dart';

import 'package:flutter_rush/widgets/skeleton_wait.dart';
import 'package:flutter_rush/widgets/top_article.dart';
import 'package:flutter_rush/widgets/swiper_widget.dart';
import 'package:provider/provider.dart';

import 'defult_title.dart';

class MainContentWidget extends StatefulWidget {
  @override
  _MainContentWidgetState createState() => _MainContentWidgetState();
}

class _MainContentWidgetState extends State<MainContentWidget> {
  SwiperData _swiperData= SwiperData();
  void _getData() {
    Provider.of<SwiperData>(context, listen: false).changeData();
    Provider.of<TopArticleProvider>(context,listen: false).getTopArticle();
  }

  @override
  void dispose() {
    if(_swiperData!=null){
      _swiperData= null;
    }
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500)).then((value) {
      _getData();
//      _swiperData.changeData();
    });
  }

  Future<void> _handleRefresh() async {
    _swiperData.changeData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.red,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Consumer<SwiperData>(
              builder: (BuildContext context, SwiperData value, Widget child) {
                if (value.bannerModel != null) {
                  return SwiperWidget(
                    initData: value.bannerModel,
                  );
                } else {
                  return SkeletonBanner();
                }
              },
            ),
//              child: ChangeNotifierProvider(
//            create: (context) => _swiperData,
//
//          )
          ),
          SliverToBoxAdapter(
            child: DefaultTitle(
              title: TopArticle.TITLE,
            ),
          ),
          Consumer2<TopArticleProvider, MainArticleProvider>(
            builder: (BuildContext context, TopArticleProvider value,
                MainArticleProvider value2, Widget child) {
//              print(value.articleModel);
              if(value.articleModel!=null){
                return ArticleWidget(initData: value.articleModel,top: true,);
              }else{
                return SliverToBoxAdapter(
                  child: Text("hahahhahaha"),
                );
              }

            },
          )
//          SliverToBoxAdapter(
//              child: Consumer2<TopArticleProvider, MainArticleProvider>(
//            builder: (BuildContext context, TopArticleProvider value,
//                MainArticleProvider value2, Widget child) {
//              return ArticleWidget();
//
//            },
//          )),

//            FutureBuilder<List<UsefulSiteEntity>>(
//              future: _futureSite,
//              builder: (context, snap) {
//                if (snap.connectionState == ConnectionState.done &&
//                    !snap.hasError) {
//                  return UsefulSiteWidget(
//                    initData: snap.data,
//                  );
//                } else {
//                  return SkeletonSite();
//                }
//              },
//            ),
//            DefaultTitle(
//              title: TopArticle.TITLE,
//            ),
//            Container(
//              child:TopArticle(),
//              height: GlobalUtils.calcWidgetHeightMultiple(10),
//            )
        ],

//        ),
      ),
      onRefresh: _handleRefresh,
    );
  }
}
