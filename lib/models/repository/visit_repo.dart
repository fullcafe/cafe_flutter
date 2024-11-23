import 'dart:convert';

import 'package:cafe_front/models/dto/complex_visit_dto.dart';
import 'package:cafe_front/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../visit.dart';

class VisitRepository {
  final ApiService _apiService = ApiService();

  // 방문 기록 생성 메서드
  Future<void> createVisit(Visit visit) async {
    var data = visit.toJson();
    var encodedData = jsonEncode(data);
    await _apiService.postRequest('/visit', encodedData);
  }

  // 특정 사용자 ID로 모든 방문 기록을 가져오는 메서드
  Future<List<ComplexVisitDto>> findAllVisitByUser(String uid) async {
    try {
      final response = await _apiService.getRequest('/visits/all/$uid');
      List data = response.data as List;
      return data.map((json) => ComplexVisitDto.fromJson(json)).toList();
    } catch (e) {
      Fluttertoast.showToast(msg: '데이터를 불러오는 데 실패했습니다.');
      return [];
    }
  }

  // 리뷰 작성 가능한 방문 기록을 가져오는 메서드
  Future<List<ComplexVisitDto>> findWriteReviewVisitByUser(String uid) async {
    try {
      final response = await _apiService.getRequest('/visits/write_review/$uid');
      List data = response.data as List;
      return data.map((json) => ComplexVisitDto.fromJson(json)).toList();
    } catch (e) {
      Fluttertoast.showToast(msg: '데이터를 불러오는 데 실패했습니다.');
      return [];
    }
  }

  // 방문 횟수가 가장 많은 기록을 가져오는 메서드
  Future<List<ComplexVisitDto>> findMostCountVisitByUser(String uid) async {
    try {
      final response = await _apiService.getRequest('/visits/most_visit/$uid');
      List data = response.data as List;
      return data.map((json) => ComplexVisitDto.fromJson(json)).toList();
    } catch (e) {
      Fluttertoast.showToast(msg: '데이터를 불러오는 데 실패했습니다.');
      return [];
    }
  }
}
