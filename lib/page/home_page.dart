import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rush/utils/global_utils.dart';
import 'package:flutter_rush/widgets/content_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
//              color: Colors.blue,
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
            child: MainContentWidget(),
          )
        ],
      ),
    );
  }
}
