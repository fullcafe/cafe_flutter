import 'package:flutter/material.dart';

class MyReviewStore with ChangeNotifier {

  // 화면 로딩용 테스트 값
  String? _testValue;
  String? get testValue => _testValue;

  MyReviewStore(){
    init();
  }

  init() async {
    await Future.delayed(Duration(milliseconds: 500));
    _testValue = '테스트';
    notifyListeners();
  }
}