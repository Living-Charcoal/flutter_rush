import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rush/model/useful_site_entity.dart';
import 'package:flutter_rush/network/http_utils.dart';
import 'package:flutter_rush/utils/global_utils.dart';

class UsefulSiteWidget extends StatefulWidget {
  const UsefulSiteWidget({Key key}):super(key:key);
  @override
  _UsefulSiteWidgetState createState() => _UsefulSiteWidgetState();
}

class _UsefulSiteWidgetState extends State<UsefulSiteWidget> {
  List<UsefulSiteEntity> _usefulSite = List();

  @override
  void initState() {
    HttpUtils().requestArticleModel().then((value) {
      setState(() {
        _usefulSite.clear();
        _usefulSite = value;
      });
    });
    super.initState();
    print("UsefulSiteWidget initState");

  }

  @override
  Widget build(BuildContext context) {
    print("UsefulSiteWidget build");
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(GlobalUtils.calcWidgetHeightMultiple(0.015)),
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            "Useful Site",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
//          color: Colors.red,
          height: GlobalUtils.calcWidgetHeightMultiple(1),
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
//            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: _usefulSite.length,
              itemBuilder: (context, index) => _buildItem(index)
          ),
        ),
      ],
    ));
  }

  Widget _buildItem(int index) {
    return Card(
      child: Center(
        child: Text(_usefulSite[index].name),
      ),
    );
  }
}
