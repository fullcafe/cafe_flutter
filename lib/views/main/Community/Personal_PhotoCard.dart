import 'package:flutter/material.dart';

class PersonalCard extends StatelessWidget {
  final String? imagePath;
  final String? keyword1; // 첫 번째 키워드
  final String? keyword2;
  final String? text;
  final double width; // 가로 크기
  final double height; // 세로 크기

  const PersonalCard({
    Key? key,
    required this.imagePath,
    required this.text,
    this.keyword1,
    this.keyword2,
    this.width = 220, // 기본 너비 설정
    this.height = 280, // 기본 높이 설정
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width, // 전달받은 너비 사용
          height: height, // 전달받은 높이 사용
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath!),
              fit: BoxFit.cover, // 이미지가 설정된 영역에 맞게 조정되도록 설정
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end, // 하단에 배치
            crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽에 배치
            children: [
              if (keyword1 != null && keyword1!.isNotEmpty && keyword2 != null && keyword2!.isNotEmpty) // 키워드가 있을 때만 표시
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 8.0, bottom: 2.0), // 키워드 박스와 텍스트 사이의 간격을 줄임
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Row 크기를 키워드 텍스트에 맞춤
                    children: [
                      _buildKeywordBox(keyword1!),
                      const SizedBox(width: 8), // 두 키워드 사이의 간격을 줄임
                      _buildKeywordBox(keyword2!),
                    ],
                  ),
                ),
              Align(
                alignment: Alignment.bottomLeft, // 텍스트를 왼쪽 하단에 정렬
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, bottom: 8), // 키워드 박스와 텍스트 사이의 간격을 줄임
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Text(
                    text!,
                    style: const TextStyle(
                      fontSize: 21, // 텍스트 크기 조정
                      fontWeight: FontWeight.w500,
                      color: Colors.white, // 텍스트를 흰색으로 설정
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Icon(
            Icons.bookmark_border,
            color: Colors.white,
            size: 28, // 아이콘 크기 조정
          ),
        ),

        Positioned(
          top: 8,
          left: 8,
          child: Row(
            children: [
              _buildKeywordBox('서울'),
              const SizedBox(width: 8),
              const Text(
                '노원구 공릉',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildKeywordBox(String keyword) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1), // 박스 색상을 투명하게 설정
        border: Border.all(color: Colors.white, width: 1), // 하얀색 테두리 설정
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        keyword,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white, // 텍스트 색상도 하얗게 설정
        ),
      ),
    );
  }
}
