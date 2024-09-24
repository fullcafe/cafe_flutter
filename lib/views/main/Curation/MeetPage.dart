import 'package:cafe_front/views/main/Curation/More_Curation_Page.dart';
import 'package:cafe_front/views/main/Curation/Photo_With_Keyword_Card.dart';
import 'package:cafe_front/views/main/Curation/recommend_cafe_card.dart';
import 'package:cafe_front/views/main/Curation/section_title.dart';
import 'package:flutter/material.dart';
import 'CustomPhotoCard.dart';
import 'Photo_Card.dart';
import 'cafe_card.dart';

class MeetPage extends StatelessWidget {
  // 친구 목록 예시 데이터
  final List<Map<String, String>> friendList = [
    {'imagePath': 'assets/images/Ellipse 80.png', 'name': '최수빈'},
    {'imagePath': 'assets/images/Ellipse 244.png', 'name': '윤수민'},
    {'imagePath': 'assets/images/Ellipse 245.png', 'name': '신도윤'},
    {'imagePath': 'assets/images/Ellipse 245.png', 'name': '신도윤'},
    {'imagePath': 'assets/images/Ellipse 245.png', 'name': '신도윤'},
    // 추가 친구 데이터
  ];
  MeetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              // 배경 이미지
              Container(
                height: 500,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Frame 434.png'),
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
                  '카공족 맞춤 집중이 잘되는\n조용한 카페 3선',
                  style: const TextStyle(
                    fontSize: 28,
                    fontFamily: 'Pretendard-Bold',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
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
                const SectionTitle(title: '이 장소에서 만나는 건 어때요?'),
                buildHorizontalListView(
                  [
                    PhotoTextCard(
                      imagePath: 'assets/images/Frame 394.png',
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
                const SectionTitle(title: '우리들의 취향 집합 카페'),
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
                const SectionTitle(title: '이 카페 한 번 더?'),
                buildListViewWithCustomCards(),
                const SizedBox(height: 25),
                const SectionTitle(title: '모두가 저장해둔 카페에 방문해볼까요?'),
                buildHorizontalListView(
                  [
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
                const SizedBox(height: 30),
                const SectionTitle(title: '상반기 우리의 취향 공통점 키워드'),
                buildKeywordCloud(), // 새로 추가된 섹션
                const SizedBox(height: 30),
                buildFriendList(), // 친구 목록 섹션 추가
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHorizontalListView(List<Widget> children) {
    return SizedBox(
      height: 250,
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
  Widget buildListViewWithCustomCards() {
    return SizedBox(
      height: 300, // 리스트뷰의 전체 높이 설정
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // 수평 스크롤 설정
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // 아이템 간 간격 설정
            child: CustomPhotoCard(
              imagePath: 'assets/images/Frame 434_1.png',
              storeName: '브라이트 사이드',
              rating: 4.7,
              keyword1: '디저트',
              keyword2: '커피',
              comment: '빵이 너무 부드러워서 자꾸 생각나요,,',
              revisitCount: 8,
            ),
          );
        },
      ),
    );
  }




  Widget buildKeywordCloud() {
    return Container(
      width: double.infinity,
      height: 200, // 전체 높이 설정
      color: Colors.orange.withOpacity(0.1), // 배경색 설정
      child: Stack(
        children: [
          Positioned(
            left: 30,
            top: 10,
            child: _buildKeyword("샷이 필요해요", 1.0),
          ),
          Positioned(
            right: 30,
            top: 20,
            child: _buildKeyword("책상은 클수록 좋다", 0.6),
          ),
          Positioned(
            right: 60,
            top: 50,
            child: _buildKeyword("의자는 폭신해야해", 0.4),
          ),
          Positioned(
            left: 30,
            top: 65,
            child: _buildKeyword("카페인과 디저트만 있으면\n어디든 갈 수 있어", 1.0),
          ),
          Positioned(
            right: 20,
            bottom: 50,
            child: _buildKeyword("카페는 카공을 위해\n 존재한다", 0.9),
          ),
          Positioned(
            left: 80,
            bottom: 10,
            child: _buildKeyword("당 떨어지면 능률도 떨어진다", 0.4),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyword(String text, double opacity) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        color: Colors.orange.withOpacity(opacity),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildFriendList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            '또 다른 내 친구들의 취향이 궁금하다면?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: friendList.length,
            itemBuilder: (context, index) {
              final friend = friendList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          friend['imagePath']!,
                          fit: BoxFit.fill,
                        ),

                      ),


                    ),
                    const SizedBox(height: 4),
                    Text(
                      friend['name']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
