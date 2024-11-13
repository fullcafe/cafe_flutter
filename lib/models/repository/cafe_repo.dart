import 'package:cafe_front/models/cafe.dart';
import 'package:cafe_front/models/cafe_filter.dart';
import 'package:cafe_front/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CafeRepository {
  final ApiService _apiService = ApiService();

  Future<List<Cafe>> searchCafeByFilters(CafeFilter filter) async {
    Map<String, dynamic> queryParam = {
      'name': filter.name,
      'wifi': filter.wifi,
      'petFriendly': filter.petFriendly,
      'takeout': filter.takeout,
      'groupFriendly': filter.groupFriendly,
      'parking': filter.parking,
      'easyPayment': filter.easyPayment,
      'delivery': filter.delivery,
      // 쉼표로 구분된 문자열로 변환
      'keywords': filter.keywords?.join(','),
    };

    try {
      final response = await _apiService.getRequest('/cafes/search', queryParam: queryParam);
      List<dynamic> data = response.data;
      return data.map((json) => Cafe.fromJson(json)).toList();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error fetching cafes: $e');
      return [];
    }
  }

  Future<Cafe?> getCafeByName(String cafeName) async {
    try {
      final response = await _apiService.getRequest('/cafes/$cafeName');
      return Cafe.fromJson(response.data);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error fetching cafe: $e');
      return null;
    }
  }
}
