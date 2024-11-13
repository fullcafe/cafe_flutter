import 'dart:convert';
import 'package:cafe_front/models/review.dart';
import 'package:cafe_front/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReviewRepository {
  final ApiService _apiService = ApiService();

  /// 특정 카페의 리뷰 목록을 가져오는 메서드
  Future<List<Review>> getReviewsByCafeName(String cafeName) async {
    try {
      var response = await _apiService.getRequest('/reviews/cafe/$cafeName');
      List<dynamic> data = response.data;
      return data.map((json) => Review.fromJson(json)).toList();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error fetching reviews by cafe: $e');
      return List.empty();
    }
  }

  /// 특정 사용자의 리뷰 목록을 가져오는 메서드
  Future<List<Review>> getReviewsByUser(String userId) async {
    try {
      var response = await _apiService.getRequest('/reviews/user/$userId');
      List<dynamic> data = response.data;
      return data.map((json) => Review.fromJson(json)).toList();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error fetching reviews by user: $e');
      return List.empty();
    }
  }

  /// 새로운 리뷰 추가
  Future<bool> addReview(Review review) async {
    try {
      String jsonData = jsonEncode(review.toJson());
      var response = await _apiService.postRequest(
        '/reviews/add',
        jsonData,
      );
      return response.statusCode == 200;
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error adding review: $e');
      return false;
    }
  }

  /// 특정 리뷰 삭제
  Future<bool> deleteReview(int reviewId) async {
    try {
      var response = await _apiService.deleteRequest('/reviews/$reviewId');
      return response.statusCode == 200;
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error deleting review: $e');
      return false;
    }
  }
}
