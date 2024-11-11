import 'package:flutter/material.dart';

class MyReviewViewModel with ChangeNotifier {

  List? _myReviews;
  List? get myReviews => _myReviews;

  MyReviewViewModel(){
    getMyReviews();
  }

  getMyReviews() async {
    await Future.delayed(Duration(milliseconds: 500));
    _myReviews = ['','','',''];
    notifyListeners();
  }
}