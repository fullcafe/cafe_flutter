import 'package:cafe_front/common/user_store.dart';
import 'package:cafe_front/models/repository/review_repo.dart';
import 'package:flutter/material.dart';

class MyReviewViewModel with ChangeNotifier {
  final ReviewRepository _reviewRepository = ReviewRepository();
  List? _myReviews;
  List? get myReviews => _myReviews;

  MyReviewViewModel(){
    getMyReviews();
  }

  getMyReviews() async {
    _myReviews = await _reviewRepository.getReviewsByUser(UserStore.getInstance().user!.uid);
    notifyListeners();
  }
}