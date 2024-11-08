import 'package:dio/dio.dart';
import '../visit.dart';

class VisitRepository {
  final Dio _dio;

  VisitRepository(this._dio);

  // 방문 기록 생성 메서드
  Future<void> createVisit(Visit visit) async {
    try {
      await _dio.post('/visit', data: visit.toJson());
    } catch (e) {
      print('Error creating visit: $e');
      throw Exception('Failed to create visit');
    }
  }

  // 특정 사용자 ID로 모든 방문 기록을 가져오는 메서드
  Future<List<Visit>> findAllVisitByUser(String uid) async {
    try {
      final response = await _dio.get('/visits/all/$uid');
      List data = response.data as List;
      return data.map((json) => Visit.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching all visits by user: $e');
      throw Exception('Failed to load visits');
    }
  }

  // 리뷰 작성 가능한 방문 기록을 가져오는 메서드
  Future<List<Visit>> findWriteReviewVisitByUser(String uid) async {
    try {
      final response = await _dio.get('/visits/write_review/$uid');
      List data = response.data as List;
      return data.map((json) => Visit.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching write-review visits by user: $e');
      throw Exception('Failed to load visits');
    }
  }

  // 방문 횟수가 가장 많은 기록을 가져오는 메서드
  Future<List<Visit>> findMostCountVisitByUser(String uid) async {
    try {
      final response = await _dio.get('/visits/most_visit/$uid');
      List data = response.data as List;
      return data.map((json) => Visit.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching most-count visits by user: $e');
      throw Exception('Failed to load visits');
    }
  }
}
