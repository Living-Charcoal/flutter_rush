import 'package:flutter/material.dart';

class TopArticle extends StatefulWidget {
  static const String TITLE = "Article";

  @override
  _TopArticleState createState() => _TopArticleState();
}

class _TopArticleState extends State<TopArticle> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 100,
        itemBuilder: (context,index){
      return Container(
        height: 120,
        child: Card(color: Colors.red,),
      );
    });
  }
}
