
import 'package:flutter/cupertino.dart';
import 'package:flutter_rush/model/main_article.dart';
import 'package:flutter_rush/network/http_utils.dart';

class MainArticleProvider with ChangeNotifier{
  MainArticle _mainArticle;

  List<Datas>  _datas;

  List<Datas> get datas => _datas;

  void getMainArticle(String page){
    HttpUtils().requestMainArticle(page).then((onValue){
//      datas.add(onValue.datas)
    _datas.addAll(onValue.datas);
    notifyListeners();
    });
  }

}