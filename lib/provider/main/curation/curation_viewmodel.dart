import 'package:cafe_front/models/cafe.dart';
import 'package:cafe_front/models/cafe_filter.dart';
import 'package:cafe_front/models/repository/cafe_repo.dart';
import 'package:flutter/material.dart';
import '../../../common/char_keyword.dart';
import '../../../common/user_store.dart';

class CurationViewModel with ChangeNotifier {
  final CafeRepository _cafeRepository = CafeRepository();

  // 고정 카페 목록과 선호 카페 목록
  List<Cafe>? _cafes;
  List<Cafe>? _preferredCafes;

  List<Cafe>? get preferredCafes => _preferredCafes;
  List<Cafe>? get cafes => _cafes;



  Future<void> fetchData() async {
    // 필터 생성
    final user = UserStore.getInstance().user;
    List<String> userPreferredKeywords = charKeywords[user?.characterIdx ?? 0];
    var filter = CafeFilter(keywords: userPreferredKeywords);

    // 카페 데이터 가져오기
    _cafes = await _cafeRepository.searchCafeByFilters(filter);
    _preferredCafes = await _cafeRepository.searchCafeByFilters(filter);
    notifyListeners();
  }
}
