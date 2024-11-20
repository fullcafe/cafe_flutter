import 'package:cafe_front/provider/stack_handler.dart';
import 'package:flutter/material.dart';
import 'package:cafe_front/models/cafe.dart';
import 'package:cafe_front/models/cafe_filter.dart';
import 'package:cafe_front/models/repository/cafe_repo.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SearchViewModel with ChangeNotifier {
  final CafeRepository _cafeRepository = CafeRepository();
  final StackHandler _handler = StackHandler();
  // search view는 하나의 controller를 공유
  final TextEditingController searchController = TextEditingController();

  List<Cafe> _cafeResults = [];
  bool _isLoading = false;

  List<Cafe> get cafeResults => _cafeResults;
  bool get isLoading => _isLoading;

  /// 검색어를 통해 카페를 검색하는 메서드
  Future<void> searchCafes(String keyword) async {
    _isLoading = true;
    notifyListeners();

    try {
      // 카페 필터를 생성하여 검색 (이름과 키워드 둘 다 포함)
      CafeFilter filter = CafeFilter(
        // name: keyword,
        keywords: keyword.isNotEmpty ? [keyword] : null,
      );
      _cafeResults = await _cafeRepository.searchCafeByFilters(filter);
      print('검색결과 : $_cafeResults');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error searching cafes: $e');//
      _cafeResults = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchCafesFilter({
    required List<String> keywords,
    bool? petFriendly,
    bool? wifi,
    bool? parking,
    bool? delivery,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final filter = CafeFilter(
        keywords: keywords.isEmpty ? null : keywords,
        petFriendly: petFriendly,
        wifi: wifi,
        parking: parking,
        delivery: delivery,
      );

      _cafeResults = await _cafeRepository.searchCafeByFilters(filter);
    } catch (e) {
      Fluttertoast.showToast(msg: '검색 오류: $e');
      _cafeResults = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// 검색 결과 초기화
  void clearSearch() {
    _cafeResults.clear();
    notifyListeners();
  }

  void navigator(BuildContext context, Widget child){
    _handler.navigator(context, ChangeNotifierProvider(
        create: (context) => this,
        child: child
    ));
  }

  @override
  void dispose() {
    _handler.disposeView(super.dispose);
  }

}

/*
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
 */