import 'dart:convert';
import 'package:cafe_front/models/dto/complex_review_dto.dart';
import 'package:cafe_front/models/dto/review_dto.dart';
import 'package:cafe_front/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReviewRepository {
  final ApiService _apiService = ApiService();

  Future<void> createReview(ReviewDto review) async {
    var encodedData = jsonEncode(review.toJson());
    await _apiService.postRequest('/review', encodedData);
  }

  Future<List<ComplexReviewDto>> getReviewsByUser(String uid) async {
    try {
      var response = await _apiService.getRequest('/reviews/user/$uid');
      List data = response.data;
      return data.map((json) => ComplexReviewDto.fromJson(json)).toList();
    } catch (e) {
      Fluttertoast.showToast(msg: '리뷰 데이터를 불러 오는데 실패하였습니다.');
      return [];
    }
  }

}
