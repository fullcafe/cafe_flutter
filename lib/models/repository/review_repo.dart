import 'dart:convert';
import 'package:cafe_front/models/dto/review_dto.dart';
import 'package:cafe_front/models/review.dart';
import 'package:cafe_front/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReviewRepository {
  final ApiService _apiService = ApiService();

  Future<void> createReview(ReviewDto review) async {
    var encodedData = jsonEncode(review.toJson());
    await _apiService.postRequest('/review', encodedData);
  }

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

}
