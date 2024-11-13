import 'package:flutter/material.dart';
import 'package:cafe_front/models/review.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../models/repository/review_repo.dart';

class ReviewViewModel extends ChangeNotifier {
  final ReviewRepository _reviewRepository = ReviewRepository();

  List<Review> _reviews = [];
  List<Review> get reviews => _reviews;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// 특정 카페의 리뷰 목록 가져오기
  Future<void> fetchReviewsByCafe(String cafeName) async {
    _isLoading = true;
    notifyListeners();

    try {
      _reviews = await _reviewRepository.getReviewsByCafeName(cafeName);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error fetching reviews: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// 특정 사용자의 리뷰 목록 가져오기
  Future<void> fetchReviewsByUser(String userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _reviews = await _reviewRepository.getReviewsByUser(userId);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error fetching user reviews: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// 리뷰 추가하기
  Future<void> addReview(Review review) async {
    _isLoading = true;
    notifyListeners();

    try {
      bool isSuccess = await _reviewRepository.addReview(review);
      if (isSuccess) {
        Fluttertoast.showToast(msg: 'Review added successfully');
        _reviews.add(review);
        notifyListeners();
      } else {
        Fluttertoast.showToast(msg: 'Failed to add review');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error adding review: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// 특정 리뷰 삭제하기
  Future<void> deleteReview(int reviewId) async {
    _isLoading = true;
    notifyListeners();

    try {
      bool isSuccess = await _reviewRepository.deleteReview(reviewId);
      if (isSuccess) {
        Fluttertoast.showToast(msg: 'Review deleted successfully');
        _reviews.removeWhere((review) => review.id == reviewId);
        notifyListeners();
      } else {
        Fluttertoast.showToast(msg: 'Failed to delete review');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error deleting review: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// 리뷰 목록 초기화
  void clearReviews() {
    _reviews.clear();
    notifyListeners();
  }
}
