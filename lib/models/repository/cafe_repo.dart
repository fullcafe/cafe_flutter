import 'package:cafe_front/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../cafe.dart';


class CafeRepository {
  final ApiService _apiService = ApiService();

  Future<List<Cafe>> searchCafeByFilters(Cafe filter) async {
    Map<String, dynamic> queryParam = {
      'name': filter.name,
      'wifi': filter.wifi,
      'petFriendly': filter.petFriendly,
      'takeout': filter.takeout,
      'groupFriendly': filter.groupFriendly,
      'parking': filter.parking,
      'easyPayment': filter.easyPayment,
      'delivery': filter.delivery,
      'keywords': filter.keywords.map((e)=>e.keyword).toList(), // 수정: 그대로 List<String>으로 전달
    };
    try{
      var response = await _apiService.getRequestWithQueryParam('/cafes/search', queryParam);
      List<dynamic> data = response.data;
      return data.map((json) => Cafe.fromJson(json)).toList();
    } catch(e){
      Fluttertoast.showToast(msg: 'Error fetching cafes: $e');
      return List.empty();
    }

  }

  // fetch all data는 왜 필요?
}
/*
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
 */