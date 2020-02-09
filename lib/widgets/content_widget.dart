import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rush/provide/main_article_provider.dart';
import 'package:flutter_rush/provide/swiper_data.dart';
import 'package:flutter_rush/provide/top_article.dart';

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
  void _getData() {
    Provider.of<SwiperData>(context, listen: false).changeData();
    Provider.of<TopArticleProvider>(context, listen: false).getTopArticle();
    Provider.of<MainArticleProvider>(context, listen: false)
        .getMainArticle("0");
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500)).then((value) {
      _getData();
    });
  }

  Future<void> _handleRefresh() async {
    _getData();
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
          ),
          SliverToBoxAdapter(
            child: DefaultTitle(
              title: TopArticle.TITLE,
            ),
          ),
          Consumer<TopArticleProvider>(
            builder:
                (BuildContext context, TopArticleProvider value, Widget child) {
              if(value.articleModel!=null){
                return TopArticle(
                  articleModel: value.articleModel,
                );
              }else{
                return SliverToBoxAdapter(
                  child: SizedBox(),
                );
              }

            },
          ),
          Consumer<MainArticleProvider>(
            builder: (BuildContext context, MainArticleProvider value,
                Widget child) {
              return MainNormalArticle(value.model,value);
            },
          )
        ],
      ),
      onRefresh: _handleRefresh,
    );
  }
}
