import 'package:dio/dio.dart';
import '../cafe.dart';


class CafeRepo {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8080')); // 서버 URL 설정

  // 필터 조건에 맞는 카페 데이터를 받아오는 메서드
  Future<List<Cafe>> searchCafesByFilters({
    String? name,
    bool? wifi,
    bool? petFriendly,
    bool? takeout,
    bool? groupFriendly,
    bool? parking,
    bool? easyPayment,
    bool? delivery,
    List<String>? keywords,
  }) async {
    try {
      // API 요청에 필요한 파라미터 설정
      Map<String, dynamic> queryParams = {
        'name': name,
        'wifi': wifi,
        'petFriendly': petFriendly,
        'takeout': takeout,
        'groupFriendly': groupFriendly,
        'parking': parking,
        'easyPayment': easyPayment,
        'delivery': delivery,
        'keywords': keywords, // 수정: 그대로 List<String>으로 전달
      };

      // 필터 조건에 맞는 카페 데이터 요청
      final response = await _dio.get('/cafes/search', queryParameters: queryParams);

      // 받아온 데이터를 Cafe 객체 리스트로 변환
      List<dynamic> data = response.data;
      return data.map((json) => Cafe.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching cafes: $e');
      throw Exception('Failed to load cafes');
    }
  }

  // 모든 카페 데이터 가져오는 메서드
  Future<List<Cafe>> fetchAllCafes() async {
    try {
      final response = await _dio.get('/cafes');
      List<dynamic> data = response.data;
      return data.map((json) => Cafe.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching all cafes: $e');
      throw Exception('Failed to load cafes');
    }
  }
}
