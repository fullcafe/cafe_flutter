import 'package:cafe_front/views/main/Curation/More_Curation_Page.dart';
import 'package:cafe_front/views/main/Curation/Photo_With_Keyword_Card.dart';
import 'package:cafe_front/views/main/Curation/recommend_cafe_card.dart';
import 'package:cafe_front/views/main/Curation/section_title.dart';
import 'package:flutter/material.dart';
import 'CustomPhotoCard.dart';
import 'Photo_Card.dart';
import 'cafe_card.dart';

class CurationPage extends StatelessWidget {
  const CurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Expanded 제거하고 SingleChildScrollView 사용
      child: Column(
        children: [
          Stack(
            children: [
              // 배경 이미지
              Container(
                height: 500,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Frame 6.png'),
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
                    'assets/images/image_511371.png', // 이미지 경로
                    width: 48, // 이미지 너비
                    height: 48, // 이미지 높이
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
                buildHorizontalListView(
                  [
                    PhotoTextCard(
                      imagePath: 'assets/images/Frame 4.png',
                      text: '당신이 찾고 있던 집 앞 디저트 카페',
                    ),
                    PhotoKeyCard(
                      imagePath: 'assets/images/Frame 5.png',
                      keyword1: "디저트",
                      keyword2: "드립커피",
                      text: '오누이',
                    ),
                    PhotoKeyCard(
                      imagePath: 'assets/images/Rectangle 34.png',
                      keyword1: "디저트",
                      keyword2: "드립커피",
                      text: '오누이',
                    ),
                    PhotoKeyCard(
                      imagePath: 'assets/images/Rectangle 34.png',
                      keyword1: "디저트",
                      keyword2: "드립커피",
                      text: '오누이',
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                const SectionTitle(title: '서진님의 취향저격 카페'),
                buildHorizontalListView(
                  [
                    CafeCard(
                      imagePath: 'assets/images/Frame 1.png',
                      name: '호이폴로이커피로스터스',
                      percentage: '91%',
                      rating: 12,
                      keyword1: "디저트",
                      keyword2: "드립커피",
                    ),
                    CafeCard(
                      imagePath: 'assets/images/Frame 2.png',
                      name: '죠니월드',
                      percentage: '96%',
                      rating: 16,
                      keyword1: "디저트",
                      keyword2: "드립커피",
                    ),
                    CafeCard(
                      imagePath: 'assets/images/Frame 3.png',
                      name: 'haengbokmango',
                      percentage: '93%',
                      rating: 8,
                      keyword1: "디저트",
                      keyword2: "드립커피",
                    ),
                  ],
                ),

                const SizedBox(height: 30),
                // 새로운 섹션 추가
                const SectionTitle(title: '이 카페 한 번 더?'),
                buildGridViewWithCustomCards(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHorizontalListView(List<Widget> children) {
    return SizedBox(
      height: 250, // 기본 높이
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: children.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final child = children[index];
          if (child is PhotoTextCard) {
            return SizedBox(
              height: 320,
              child: child,
            );
          } else {
            return child;
          }
        },
      ),
    );
  }

  // 새로운 그리드 뷰 섹션 추가
  Widget buildGridViewWithCustomCards() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 24,
        childAspectRatio: 0.7, // 카드의 비율을 조정하여 더 높은 카드를 수용
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return CustomPhotoCard(
          imagePath: 'assets/images/Frame 6.png',
          storeName: '무이로',
          rating: 4.7,
          keyword1: '디저트',
          keyword2: '커피',
          comment: '"커피가 진짜 다시 오고싶은 맛,,,"',
          revisitCount: 8,
        );
      },
    );
  }

}

