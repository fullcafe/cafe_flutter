import 'package:flutter/material.dart';

class MyVisitViewModel with ChangeNotifier {
  List? _visitCafeList;
  List? get visitCafeList => _visitCafeList;


  MyVisitViewModel(){
    getMyVisits();
  }

  getMyVisits() async {
    await Future.delayed(Duration(milliseconds: 500));
    _visitCafeList = ['','','',''];
    notifyListeners();
  }
}