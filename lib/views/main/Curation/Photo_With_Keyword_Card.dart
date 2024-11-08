import 'package:flutter/material.dart';
import '../../../models/cafe.dart';

class PhotoKeyCard extends StatelessWidget {
  final String imagePath;
  final String keyword1;
  final String keyword2;
  final String text;

  const PhotoKeyCard({
    Key? key,
    required this.imagePath,
    required this.keyword1,
    required this.keyword2,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220, // 카드 너비
      height: 280, // 카드 높이
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath), // `cafe` 객체가 아닌 imagePath 직접 사용
          fit: BoxFit.cover, // 이미지가 설정된 영역에 맞게 조정
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end, // 하단 정렬
        crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 8.0, bottom: 2.0), // 키워드 박스와 텍스트 간격
            child: Row(
              mainAxisSize: MainAxisSize.min, // Row 크기를 키워드 텍스트에 맞춤
              children: [
                _buildKeywordBox(keyword1),
                const SizedBox(width: 8), // 두 키워드 간격
                _buildKeywordBox(keyword2),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft, // 텍스트 왼쪽 하단 정렬
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis, // 필요 시 ... 으로 표시
                maxLines: 1, // 한 줄로 표시, 필요 시 softWrap으로 변경 가능
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
        color: Colors.white.withOpacity(0.1), // 투명한 흰색 박스
        border: Border.all(color: Colors.white, width: 1), // 흰색 테두리
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        keyword,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white, // 흰색 텍스트
        ),
      ),
    );
  }
}
