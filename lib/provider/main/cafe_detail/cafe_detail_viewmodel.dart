import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../models/cafe.dart';

import '../../../services/api_service.dart';

class CafeDetailViewModel {
  final ApiService _apiService = ApiService();
  Cafe? cafe;
  bool isLoading = false;

  Future<void> fetchCafeDetails(String cafeName) async {
    isLoading = true;
    try {
      var response = await _apiService.getRequest('/cafes/$cafeName');
      cafe = Cafe.fromJson(response.data);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error fetching cafe details: $e');
    } finally {
      isLoading = false;
    }
  }
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

  /// 가볼만한 곳 (예제 데이터)
  // void loadNearbyPlaces() {
  //   _nearbyPlaces = [
  //     {'name': '미라쥬양과점', 'distance': '186m', 'image': 'assets/images/near/sweat.jpg'},
  //     {'name': '웨일스', 'distance': '387m', 'image': 'assets/images/near/bar.jpg'},
  //     {'name': '싱싱제과 소품샵', 'distance': '530m', 'image': 'assets/images/near/cafe.jpg'},
  //   ];
  // }

  // /// 카페 메뉴 가져오기 (예제 데이터 사용)
  // List<String> getMenuItems() {
  //   if (_cafe != null) {
  //     return ['아메리카노', '카페라떼', '카푸치노', '에스프레소']; // 예제 메뉴 리스트
  //   }
  //   return [];
  // }
}
