import 'package:flutter/material.dart';
import 'package:flutter_rush/utils/global_utils.dart';

class StickyPostWidget extends StatefulWidget {
  @override
  _StickyPostWidgetState createState() => _StickyPostWidgetState();
}

class _StickyPostWidgetState extends State<StickyPostWidget> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            margin: EdgeInsets.all(GlobalUtils.calcWidgetHeightMultiple(0.015)),
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Sticky Posts",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          )),
          Expanded(
            child: Container(
              child: ListView.builder(itemBuilder: null),
            ),
          ),
        ],
      ),
    );
  }
}
