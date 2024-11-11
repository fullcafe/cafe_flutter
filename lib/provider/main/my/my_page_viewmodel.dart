import 'package:flutter/material.dart';

class MyPageViewModel with ChangeNotifier {

  List? _recentlyVisitCafeList;
  List? get recentlyVisitCafeList => _recentlyVisitCafeList;

  MyPageViewModel(){
    getRecentlyVisitCafeList();
  }

  getRecentlyVisitCafeList() async {
    await Future.delayed(Duration(milliseconds: 500));
    // 테스트용 static한 리스트 아무거나
    _recentlyVisitCafeList = ['','','',''];
    notifyListeners();
  }


}