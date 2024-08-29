import 'package:flutter/material.dart';

class MyReviewStore with ChangeNotifier {

  List _myReviews = [];
  List get myReviews => _myReviews;

  MyReviewStore(){
    getMyReviews();
  }

  getMyReviews() async {
    await Future.delayed(Duration(milliseconds: 500));
    _myReviews = ['','','',''];
    notifyListeners();
  }
}