import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/cafe.dart';
import '../../models/cafe_keyword.dart';
import '../../views/main/Curation/CustomPhotoCard.dart';
import '../../views/main/Curation/Photo_With_Keyword_Card.dart';

final Random _random = Random();

/// 랜덤 이미지 경로를 반환하는 함수
String _getRandomImagePath() {
  int randomIndex = _random.nextInt(21); // 0부터 20 사이의 랜덤 숫자 생성
  return 'assets/images/Frame $randomIndex.png';
}

/// 수평 스크롤 리스트뷰를 생성하는 위젯
Widget buildHorizontalListView(List<Cafe> cafes) {
  return SizedBox(
    height: 250,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: cafes.length,
      separatorBuilder: (context, index) => const SizedBox(width: 12),
      itemBuilder: (context, index) {
        final cafe = cafes[index];

        // 키워드를 빈도 순으로 정렬
        List<CafeKeyword> sortedKeywords = List.from(cafe.keywords);
        sortedKeywords.sort((a, b) => b.frequency.compareTo(a.frequency));

        return PhotoKeyCard(
          imagePath: _getRandomImagePath(),
          keyword1: sortedKeywords.isNotEmpty ? sortedKeywords[0].keyword : '디저트',
          keyword2: sortedKeywords.length > 1 ? sortedKeywords[1].keyword : '커피',
          text: cafe.name,
        );
      },
    ),
  );
}

/// 커스텀 카드 리스트뷰를 생성하는 위젯
Widget buildListViewWithCustomCards(List<Cafe> cafes) {
  return SizedBox(
    height: 300,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cafes.length,
      itemBuilder: (context, index) {
        final cafe = cafes[index];

        // 키워드를 빈도 순으로 정렬
        List<CafeKeyword> sortedKeywords = List.from(cafe.keywords);
        sortedKeywords.sort((a, b) => b.frequency.compareTo(a.frequency));

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: CustomPhotoCard(
            imagePath: _getRandomImagePath(),
            storeName: cafe.name,
            keyword1: sortedKeywords.isNotEmpty ? sortedKeywords[0].keyword : '디저트',
            keyword2: sortedKeywords.length > 1 ? sortedKeywords[1].keyword : '커피',
            comment: '빵이 너무 부드러워서 자꾸 생각나요,,',
            revisitCount: 8,
          ),
        );
      },
    ),
  );
}
