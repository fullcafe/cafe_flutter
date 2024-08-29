import 'package:flutter/material.dart';

class MyFavorStore with ChangeNotifier {

  List _mostRevisitCafeList = [];
  List get mostRevisitCafeList => _mostRevisitCafeList;

  MyFavorStore(){
    getMostRevisitCafeList();
  }

  getMostRevisitCafeList() async {
    await Future.delayed(Duration(milliseconds: 500));
    _mostRevisitCafeList = [''];
    notifyListeners();
  }

}
