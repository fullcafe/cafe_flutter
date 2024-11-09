import 'package:cafe_front/models/cafe.dart';
import 'package:cafe_front/models/cafe_filter.dart';
import 'package:cafe_front/models/repository/cafe_repo.dart';
import 'package:flutter/material.dart';

class CurationViewModel with ChangeNotifier {
  final CafeRepository _cafeRepository = CafeRepository();

  List<Cafe>? _cafes;
  List<Cafe>? _preferredCafes;

  List<Cafe>? get preferredCafes => _preferredCafes;
  List<Cafe>? get cafes => _cafes;

  fetchData() async {
    final List<String> userPreferredKeywords = ['아메리카노', '디저트', '커피', '라떼', '케이크', '녹차라떼'];
    var filter = CafeFilter(); filter.keywords = userPreferredKeywords;
    var preferredFilter = CafeFilter(); preferredFilter.keywords = userPreferredKeywords;
    _cafes = await _cafeRepository.searchCafeByFilters(filter);
    _preferredCafes = await _cafeRepository.searchCafeByFilters(preferredFilter);
  }
}