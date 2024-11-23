import 'package:cafe_front/common/user_store.dart';
import 'package:cafe_front/models/complex_visit.dart';
import 'package:cafe_front/models/repository/visit_repo.dart';
import 'package:cafe_front/provider/stack_handler.dart';
import 'package:flutter/material.dart';
import 'package:cafe_front/models/cafe.dart';
import 'package:cafe_front/models/cafe_filter.dart';
import 'package:cafe_front/models/repository/cafe_repo.dart';
import 'package:provider/provider.dart';

class SearchViewModel with ChangeNotifier {
  final CafeRepository _cafeRepository = CafeRepository();
  final VisitRepository _visitRepository = VisitRepository();
  final StackHandler _handler = StackHandler();
  // search view는 하나의 controller를 공유
  final TextEditingController searchController = TextEditingController();
  
  SearchViewModel(){
    fetchPreviousCafe();
  }

  List<ComplexVisit>? _previousCafe;
  List<Cafe> _cafeResults = [];
  bool _isLoading = false;

  List<ComplexVisit>? get previousCafe => _previousCafe;
  List<Cafe> get cafeResults => _cafeResults;
  bool get isLoading => _isLoading;

  fetchPreviousCafe() async {
    _previousCafe = await _visitRepository.findWriteReviewVisitByUser(UserStore.getInstance().user!.uid);
    notifyListeners();
  }

  /// 검색어를 통해 카페를 검색하는 메서드
  Future<void> searchCafes(String keyword) async {
    _isLoading = true;
    notifyListeners();

    CafeFilter filter = CafeFilter(
      keywords: keyword.isNotEmpty ? [keyword] : null,
    );
    _cafeResults = await _cafeRepository.searchCafeByFilters(filter);
    _isLoading = false;
    notifyListeners();
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

    final filter = CafeFilter(
      keywords: keywords.isEmpty ? null : keywords,
      petFriendly: petFriendly,
      wifi: wifi,
      parking: parking,
      delivery: delivery,
    );

    _cafeResults = await _cafeRepository.searchCafeByFilters(filter);
    _isLoading = false;
    notifyListeners();
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