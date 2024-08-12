import 'package:flutter/material.dart';

/*
  로그인 하고 난 후 나오는 5개 페이지의 공유 스토어
  5개의 상태 표시 점 때문에 현재 페이지 정보도 알고 있음
*/

class AfterLoginStore with ChangeNotifier {

  int _currentPage = 0;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  GlobalKey<FormState> get key => _key;

  int get currentPage => _currentPage;

  int get currentIdx => _currentPage * 2;

  updateCurrentPage(int value){
    _currentPage += value;
    switch (_currentPage) {
      case < 0:
        _currentPage = 0;
      case > 4:
        _currentPage =4;
    }
  }

}