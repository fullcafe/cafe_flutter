import 'package:cafe_front/views/main/Curation/section_title.dart';
import 'package:flutter/material.dart';
import '../../../widgets/appbar/custom_appbar.dart';
import 'Cafe_with_Review.dart';
import 'Photo_Card.dart';
import 'Photo_With_Keyword_Card.dart';
import 'cafe_card.dart';

class MoreCurationPage extends StatelessWidget {
  const MoreCurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // 상단의 큰 이미지
                SizedBox(
                  height: 700, // 이미지의 높이 설정
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/Frame 434.png', // 배경 이미지 경로 설정
                    fit: BoxFit.cover, // 이미지가 영역을 덮도록 설정
                  ),
                ),
                // 기존의 BackButtonAppBar 유지
                Padding(
                  padding: const EdgeInsets.only(top: 40.0), // 위치를 아래로 조정
                  child: const BackButtonAppBar(isWhite:true),
                ),
                // 이미지 위에 텍스트와 선 배치
                Positioned(
                  bottom: 30,
                  left: 10,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: Text(
                          '장마철에 딱 맞는',
                          textAlign: TextAlign.start,
                          style: TextStyle(
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
                      const Text(
                        '당신의 취향 저격 카페 3선',
                        textAlign: TextAlign.start,
                        style: TextStyle(
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
                      const SizedBox(height: 8), // 텍스트와 선 사이의 간격
                      Container(
                        width: 400, // 선의 너비
                        height: 2, // 선의 높이
                        color: Colors.white, // 선의 색상
                      ),
                      const SizedBox(height: 8), // 선과 아래 텍스트 사이의 간격
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          '장마 끝, 더위 시작?\n더위를 피해 가볍게 분위기를 전환할 수 있는\n카페 3곳, 추천해드릴게요',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Pretendard-Bold',
                            fontWeight: FontWeight.w500,
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
                    ],
                  ),
                ),
              ],
            ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            buildVerticalListView(
              [
                CafeWithReviewPage(),
                const SizedBox(height:20),
                CafeWithReviewPage(),
              ],
            ),
        ]
      ),
    ),

          ],
        ),
      ),
    );
  }
  Widget buildVerticalListView(List<Widget> children) {
    return ListView.separated(
      scrollDirection: Axis.vertical, // 수직 스크롤로 설정
      shrinkWrap: true, // ListView가 필요한 높이에 맞춰 크기를 줄이도록 설정
      physics: const NeverScrollableScrollPhysics(), // 상위 스크롤 뷰와 충돌하지 않도록 설정
      itemCount: children.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12), // 카드 사이의 간격
      itemBuilder: (context, index) {
        final child = children[index];

        // 특정 위젯 (PhotoTextCard)일 경우 높이 조절
        if (child is CafeWithReviewPage) {
          return SizedBox(
            height: 700, // PhotoTextCard만의 높이 설정
            child: child,
          );
        } else {
          return child;
        }
      },
    );
  }


}
