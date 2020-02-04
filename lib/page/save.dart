import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 布局包
import 'package:flutter_rush/utils/global_utils.dart';
import 'package:flutter_rush/widgets/save/save_header.dart';

class SaveWidget extends StatefulWidget {
  @override
  _SaveWidgetState createState() => _SaveWidgetState();
}

class _SaveWidgetState extends State<SaveWidget> {
  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
            //生成Tab菜单
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil.getInstance().setWidth(40)),
        child: Column(
          children: <Widget>[SaveHeaderWidget()],
        ),
      ),
    );
  }
}
