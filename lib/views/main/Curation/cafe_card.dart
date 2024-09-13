import 'package:flutter/material.dart';

class CafeCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String percentage;
  final double rating;
  final String keyword1; // 첫 번째 키워드
  final String keyword2; // 두 번째 키워드

  const CafeCard({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.percentage,
    required this.rating,
    required this.keyword1,
    required this.keyword2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 160,
          height: 190,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // 북마크 아이콘을 오른쪽 상단에 배치
              Positioned(
                top: 8,
                right: 8,
                child: Image.asset(
                  'assets/icons/bookmark_white.png',
                  width: 20,
                  height: 20,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end, // 하단에 배치
                crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽에 배치
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0), // 박스의 간격 조정
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Row 크기를 키워드 텍스트에 맞춤
                      children: [
                        _buildKeywordBox(keyword1),
                        const SizedBox(width: 6), // 두 키워드 사이의 간격
                        _buildKeywordBox(keyword2),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8), // 이미지와 텍스트 사이의 간격
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Pretendard-SemiBold',
            color: Color(0xff261b08),
          ),
        ),
        const SizedBox(height: 4), // 이름과 별점 사이의 간격
        Row(
          children: [
            const Icon(Icons.favorite, size: 12, color: Color(0xff271B09)),
            const SizedBox(width: 4),
            Text(
              percentage,
              style: const TextStyle(
                fontSize: 10,
                fontFamily: 'Pretendard-Regular',
                color: Color(0xff716d6a),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 키워드 박스를 생성하는 메서드
  Widget _buildKeywordBox(String keyword) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5), // 박스 색상을 투명하게 설정
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        keyword,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Color(0xff261b08),
        ),
      ),
    );
  }
}
