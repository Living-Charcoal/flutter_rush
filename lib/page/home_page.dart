import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              color: Colors.blue,
              width: _width,
              height: _heightOfThis,
              child: Container(
                margin: EdgeInsets.only(
                    left: _width * 0.05, top: _heightOfThis / 2),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Icon(Icons.favorite,size: 40,),
                    Text("asccccccccccc",)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}