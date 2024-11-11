import 'package:flutter/material.dart';

class MyFavorViewModel with ChangeNotifier {

  List? _mostRevisitCafeList;
  List? get mostRevisitCafeList => _mostRevisitCafeList;

  MyFavorViewModel(){
    getMostRevisitCafeList();
  }

  getMostRevisitCafeList() async {
    await Future.delayed(Duration(milliseconds: 500));
    _mostRevisitCafeList = [''];
    notifyListeners();
  }

}
