import 'package:flutter/material.dart';

class PhotoKeyCard extends StatelessWidget {
  final String imagePath;
  final String keyword1; // 첫 번째 키워드
  final String keyword2;
  final String text;

  const PhotoKeyCard({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.keyword1,
    required this.keyword2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220, // 원하는 너비로 설정
      height: 280, // 원하는 높이로 설정
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover, // 이미지가 설정된 영역에 맞게 조정되도록 설정
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end, // 하단에 배치
        crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽에 배치
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 8.0, bottom: 2.0), // 키워드 박스와 텍스트 사이의 간격을 줄임
            child: Row(
              mainAxisSize: MainAxisSize.min, // Row 크기를 키워드 텍스트에 맞춤
              children: [
                _buildKeywordBox(keyword1),
                const SizedBox(width: 8), // 두 키워드 사이의 간격을 줄임
                _buildKeywordBox(keyword2),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft, // 텍스트를 왼쪽 하단에 정렬
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 8), // 키워드 박스와 텍스트 사이의 간격을 줄임
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20, // 텍스트 크기 조정
                  // fontWeight: FontWeight.bold,
                  color: Colors.white, // 텍스트를 흰색으로 설정
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeywordBox(String keyword) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
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
