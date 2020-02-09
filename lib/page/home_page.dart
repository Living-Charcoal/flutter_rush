import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rush/provide/main_article_provider.dart';
import 'package:flutter_rush/provide/swiper_data.dart';
import 'package:flutter_rush/provide/top_article.dart';
import 'package:flutter_rush/utils/global_utils.dart';
import 'package:flutter_rush/widgets/content_widget.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: new Icon(Icons.search),
      ),
      body: Column(
        children: <Widget>[
          Container(
              width: GlobalUtils.calcScreenWidth(),
              height: GlobalUtils.calcWidgetHeightMultiple(0.125),
              child: Container(
                margin: EdgeInsets.only(
                    left: GlobalUtils.calcWidgetWidthMultiple(0.05),
                    top: GlobalUtils.calcWidgetHeightMultiple(0.0625)),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Icon(
                      Icons.ac_unit,
                      size: 40,
                    ),
                    SizedBox(
                      width: GlobalUtils.calcWidgetWidthMultiple(0.02),
                    ),
                    Text(
                      "荒野大镖客",
                      style:
                          TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              )),
          Expanded(
              child: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create:(_)=> SwiperData(),
              ),
              ChangeNotifierProvider<TopArticleProvider>(create:(_)=>TopArticleProvider()),
              ChangeNotifierProvider<MainArticleProvider>(create:(_)=> MainArticleProvider())
            ],
            child: MainContentWidget(),
          ))
        ],
      ),
    );
  }
}
