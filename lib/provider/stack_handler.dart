import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 여러개의 view가 하나의 객체를 참조할 때 handler
class StackHandler {
  int _viewStack = 1;
  int get viewStack => _viewStack;

  void navigator(BuildContext context, Widget destination){
    // 뷰 스택을 여기서 관리하므로 이 메서드를 통해서만 새 페이지 생성
    _viewStack++;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => destination,
      ),
    );
  }
  disposeView(void Function() func){
    // 참조하는 뷰가 1개 이하 일때만 종료
    if(_viewStack <= 1){
      func();
    }
    _viewStack--;
  }
}