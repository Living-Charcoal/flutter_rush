import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    final size = MediaQuery.of(context).size;
    final _width = size.width;
    final _heightOfThis = size.height / 8;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
//              color: Colors.blue,
              width: _width,
              height: _heightOfThis,
              child: Container(
                margin: EdgeInsets.only(
                    left: _width * 0.05, top: _heightOfThis / 2),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Icon(
                      Icons.ac_unit,
                      size: 40,
                    ),
                    SizedBox(
                      width: _width * 0.02,
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
