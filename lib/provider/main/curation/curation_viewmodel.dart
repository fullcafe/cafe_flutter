import 'package:cafe_front/models/cafe.dart';
import 'package:cafe_front/models/cafe_filter.dart';
import 'package:cafe_front/models/repository/cafe_repo.dart';
import 'package:flutter/material.dart';

class CurationViewModel with ChangeNotifier {
  final CafeRepository _cafeRepository = CafeRepository();

  // 취향 기반 아닌 고정 카페
  List<Cafe>? _cafes;
  // 취향 기반 카페
  List<Cafe>? _preferredCafes;

  List<Cafe>? get preferredCafes => _preferredCafes;
  List<Cafe>? get cafes => _cafes;

  fetchData() async {
    // 일단 키워드를 여기다 박음 원래는 파라미터로 받아야 함
    final List<String> userPreferredKeywords = ['아메리카노', '디저트', '커피', '라떼', '케이크', '녹차라떼'];
    // 고정 필터 -> 임시로 선호 키워드 기반으로 했는데 다른 기준으로
    var filter = CafeFilter(); filter.keywords = userPreferredKeywords;
    // 취향 기반 필터
    var preferredFilter = CafeFilter(); preferredFilter.keywords = userPreferredKeywords;
    _cafes = await _cafeRepository.searchCafeByFilters(filter);
    _preferredCafes = await _cafeRepository.searchCafeByFilters(preferredFilter);
    notifyListeners();
  }
}