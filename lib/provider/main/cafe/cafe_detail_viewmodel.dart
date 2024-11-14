import 'package:flutter/cupertino.dart';
import '../../../models/cafe.dart';


class CafeDetailViewModel with ChangeNotifier{
  final Cafe? cafe;

  CafeDetailViewModel(this.cafe);

  /// 특정 카페의 리뷰를 가져오는 메서드
  // Future<void> fetchReviewsByCafe(String cafeName) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   try {
  //     _reviews = await _reviewRepository.getReviewsByCafeName(cafeName);
  //   } catch (e) {
  //     print('Error fetching reviews: $e');
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }

}
/*
 가볼만한 곳 그냥 고정 값
 카페 메뉴
 */