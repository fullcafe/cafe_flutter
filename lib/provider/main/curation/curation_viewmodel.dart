import 'package:cafe_front/models/cafe.dart';
import 'package:cafe_front/models/cafe_filter.dart';
import 'package:cafe_front/models/repository/cafe_repo.dart';
import 'package:flutter/material.dart';
import '../../../common/user_store.dart';

class CurationViewModel with ChangeNotifier {
  final CafeRepository _cafeRepository = CafeRepository();

  // 고정 카페 목록과 선호 카페 목록
  List<Cafe>? _cafes;
  List<Cafe>? _preferredCafes;

  List<Cafe>? get preferredCafes => _preferredCafes;
  List<Cafe>? get cafes => _cafes;

  // 캐릭터 인덱스별 선호 키워드 리스트
  static const charKeywords = [
    ['아메리카노','라떼','커피','디저트','마들렌'],
    ['조용한', '아메리카노', '분위기','산책','대화'],
    ['아메리카노', '원두', '요거트','소금빵','휘낭시에'],
    ['아메리카노', '크림', '분위기','마들렌','과일'],
    ['아메리카노', '요거트', '차', '디카페인'],
    ['아메리카노', '라떼', '그린티','케이크','분위기'],
  ];

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
