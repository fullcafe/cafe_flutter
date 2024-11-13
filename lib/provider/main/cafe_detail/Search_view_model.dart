import 'package:flutter/material.dart';
import 'package:cafe_front/models/cafe.dart';
import 'package:cafe_front/models/cafe_filter.dart';
import 'package:cafe_front/models/repository/cafe_repo.dart';

class SearchViewModel with ChangeNotifier {
  final CafeRepository _cafeRepository = CafeRepository();

  List<Cafe> _cafeResults = [];
  Cafe? _selectedCafe;
  bool _isLoading = false;

  List<Cafe> get cafeResults => _cafeResults;
  Cafe? get selectedCafe => _selectedCafe;
  bool get isLoading => _isLoading;

  /// 검색어를 통해 카페를 검색하는 메서드
  Future<void> searchCafes(String keyword) async {
    _isLoading = true;
    notifyListeners();

    try {
      // 카페 필터를 생성하여 검색 (이름과 키워드 둘 다 포함)
      CafeFilter filter = CafeFilter(
        name: keyword,
        keywords: keyword.isNotEmpty ? [keyword] : null,
      );
      _cafeResults = await _cafeRepository.searchCafeByFilters(filter);
    } catch (e) {
      print('Error searching cafes: $e');
      _cafeResults = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// 검색 결과 초기화
  void clearSearch() {
    _cafeResults.clear();
    _selectedCafe = null;
    notifyListeners();
  }


/// 카페 이름으로 상세 정보 가져오기
  Future<void> fetchCafeDetails(String cafeName) async {
    _isLoading = true;
    notifyListeners();

    try {
      _selectedCafe = await _cafeRepository.getCafeByName(cafeName);
    } catch (e) {
      print('Error fetching cafe details: $e');
      _selectedCafe = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}