import 'dart:math';
import 'package:cafe_front/views/main/Curation/More_Curation_Page.dart';
import 'package:cafe_front/views/main/Curation/Photo_With_Keyword_Card.dart';
import 'package:cafe_front/views/main/Curation/section_title.dart';
import 'package:flutter/material.dart';
import '../../../models/cafe.dart';
import '../../../models/repository/cafe_repo.dart';
import 'CustomPhotoCard.dart';

class CurationPage extends StatelessWidget {
  final List<String> userPreferredKeywords = ['아메리카노', '디저트', '커피', '라떼', '케이크', '녹차라떼'];
  final CafeRepo cafeRepo = CafeRepo();
  final Random _random = Random();

  CurationPage({Key? key}) : super(key: key);

  Future<List<Cafe>> fetchAllCafeData() async {
    try {
      return await cafeRepo.fetchAllCafes();
    } catch (e) {
      print('Error fetching all cafes: $e');
      return [];
    }
  }

  Future<List<Cafe>> fetchPreferredCafeData() async {
    try {
      return await cafeRepo.searchCafesByFilters(keywords: userPreferredKeywords);
    } catch (e) {
      print('Error fetching preferred cafes: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cafe>>(
      future: fetchAllCafeData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          final cafes = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 500,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Frame 6.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 20,
                      right: 20,
                      child: Text(
                        '장마철에 딱 맞는\n당신의 취향 저격 카페 3선',
                        style: const TextStyle(
                          fontSize: 28,
                          fontFamily: 'Pretendard-Bold',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 1),
                              blurRadius: 5.0,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 28,
                      left: 360,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MoreCurationPage(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/image_511371.png',
                          width: 48,
                          height: 48,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      const SectionTitle(title: '집 주변 카페 정복하기'),
                      buildHorizontalListView(cafes.sublist(0, 3)),
                      const SizedBox(height: 60),
                      const SectionTitle(title: '서진님의 취향저격 카페'),
                      buildPreferredCafeListView(),
                      const SizedBox(height: 30),
                      const SectionTitle(title: '이 카페 한 번 더?'),
                      buildListViewWithCustomCards(cafes),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  String _getRandomImagePath() {
    int randomIndex = _random.nextInt(21); // 0부터 20까지의 랜덤 숫자
    return 'assets/images/Frame $randomIndex.png';
  }

  Widget buildHorizontalListView(List<Cafe> cafes) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: cafes.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final cafe = cafes[index];
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

  Widget buildPreferredCafeListView() {
    return FutureBuilder<List<Cafe>>(
      future: fetchPreferredCafeData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No preferred cafes found'));
        } else {
          final cafes = snapshot.data!;
          return buildHorizontalListView(cafes);
        }
      },
    );
  }

  Widget buildListViewWithCustomCards(List<Cafe> cafes) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cafes.length,
        itemBuilder: (context, index) {
          final cafe = cafes[index];
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
}