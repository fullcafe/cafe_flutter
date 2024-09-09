
import 'package:cafe_front/views/main/Curation/recommend_cafe_card.dart';
import 'package:cafe_front/views/main/Curation/section_title.dart';
import 'package:flutter/material.dart';
import 'cafe_card.dart';


class CurationPage extends StatelessWidget {
  const CurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // 배경 이미지
            Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Rectangle 34.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // 중앙 텍스트
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
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 5.0,
                      color: Colors.black45,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle(title: '집 주변 카페 정복하기'),
                  buildHorizontalListView([
                    CafeCard(imagePath: 'assets/images/Rectangle 34.png', name: '호이폴로이커피로스터스', percentage: '91%', rating: 12),
                    CafeCard(imagePath: 'assets/images/Rectangle 34.png', name: '죠니월드', percentage: '96%', rating: 16),
                    CafeCard(imagePath: 'assets/images/Rectangle 34.png', name: 'haengbokmango', percentage: '93%', rating: 8),
                  ]),
                  const SectionTitle(title: '서진님의 취향저격 카페'),
                  buildHorizontalListView([
                    RecommendedCafeCard(imagePath: 'assets/images/Rectangle 34.png', name: '무이로', lastVisit: '방문: 2주 전', visits: 24),
                    RecommendedCafeCard(imagePath: 'assets/images/Rectangle 34.png', name: '메트로폴리스', lastVisit: '방문: 2주 전', visits: 11),
                    RecommendedCafeCard(imagePath: 'assets/images/Rectangle 34.png', name: '리브인오후', lastVisit: '방문: 2주 전', visits: 11),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildHorizontalListView(List<Widget> children) {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: children,
      ),
    );
  }
}
