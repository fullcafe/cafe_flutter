import 'package:cafe_front/views/main/Community/Personal_PhotoCard.dart';
import 'package:cafe_front/views/main/Curation/Photo_With_Keyword_Card.dart';
import 'package:flutter/material.dart';


class PersonalRecommendPage extends StatelessWidget {
  const PersonalRecommendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 샘플 데이터를 리스트로 생성
    final List<Map<String, String>> photoData = [
      {'imagePath': 'assets/images/Frame 1.png', 'text': '카페1', 'keyword1': '키워드1', 'keyword2': '키워드2'},
      {'imagePath': 'assets/images/Frame 2.png', 'text': '카페2', 'keyword1': '키워드1', 'keyword2': '키워드2'},
      {'imagePath': 'assets/images/Frame 3.png', 'text': '카페3', 'keyword1': '키워드1', 'keyword2': '키워드2'},
      {'imagePath': 'assets/images/Frame 4.png', 'text': '카페4', 'keyword1': '키워드1', 'keyword2': '키워드2'},
      {'imagePath': 'assets/images/Frame 1.png', 'text': '카페1', 'keyword1': '키워드1', 'keyword2': '키워드2'},
      {'imagePath': 'assets/images/Frame 2.png', 'text': '카페2', 'keyword1': '키워드1', 'keyword2': '키워드2'},
      {'imagePath': 'assets/images/Frame 3.png', 'text': '카페3', 'keyword1': '키워드1', 'keyword2': '키워드2'},
      {'imagePath': 'assets/images/Frame 4.png', 'text': '카페4', 'keyword1': '키워드1', 'keyword2': '키워드2'},

    ];

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),

        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 한 줄에 2개의 카드 배치
            mainAxisSpacing: 8, // 세로 간격
            crossAxisSpacing: 8, // 가로 간격
            childAspectRatio: 0.6, // 카드의 가로와 세로 비율 조정
          ),
          itemCount: photoData.length,
          itemBuilder: (context, index) {
            final photo = photoData[index];
            return PersonalCard(
              imagePath: photo['imagePath']!,
              text: photo['text']!,
              keyword1: '',
              keyword2: '',
              width:220,
              height:350,
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: PersonalRecommendPage(),
  ));
}
