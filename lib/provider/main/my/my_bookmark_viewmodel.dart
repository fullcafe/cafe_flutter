import 'package:flutter/material.dart';

class MyBookmarkViewModel with ChangeNotifier {
  List? _bookmarkCafeList;
  List? get bookmarkCafeList => _bookmarkCafeList;
  MyBookmarkViewModel(){
    getTestData();
  }
  getTestData() async{
    await Future.delayed(Duration(milliseconds: 500));
    _bookmarkCafeList = ['','','',''];
    notifyListeners();
  }
}