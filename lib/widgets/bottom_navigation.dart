import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rush/page/home_page.dart';
import 'package:flutter_rush/utils/global_utils.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigationWidget> {
  var _currentIndex = 0;
  List<Widget> _list = <Widget>[];

  @override
  void initState() {
    _list..add(MyHomePage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalUtils.init(context);

    // TODO: implement build
    return Scaffold(
      body: MyHomePage(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35.0,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text(
                'HOME',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
              ),
              title: Text(
                'EMAIL',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
              ),
              title: Text(
                'PAGES',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.adjust,
              ),
              title: Text(
                'mine',
              )),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
