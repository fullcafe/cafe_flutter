import 'package:cafe_front/models/cafe_filter.dart';
import 'package:cafe_front/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../cafe.dart';


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
      'keywords': filter.keywords, // 수정: 그대로 List<String>으로 전달
    };
    try{
      var response = await _apiService.getRequest('/cafes/search',queryParam: queryParam);
      List<dynamic> data = response.data;
      return data.map((json) => Cafe.fromJson(json)).toList();
    } catch(e){
      Fluttertoast.showToast(msg: 'Error fetching cafes: $e');
      return List.empty();
    }

  }
}