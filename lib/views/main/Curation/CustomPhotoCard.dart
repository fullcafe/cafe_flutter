import 'package:flutter/material.dart';

class CustomPhotoCard extends StatelessWidget {
  final String imagePath;
  final String storeName; // 가게 이름
  final double rating; // 평점
  final String keyword1; // 첫 번째 키워드
  final String keyword2; // 두 번째 키워드
  final String comment; // 코멘트
  final int revisitCount; // 재방문 횟수

  const CustomPhotoCard({
    Key? key,
    required this.imagePath,
    required this.storeName,
    required this.rating,
    required this.keyword1,
    required this.keyword2,
    required this.comment,
    required this.revisitCount, // 재방문 횟수
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180, //카드 너비를 고정
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // 이미지 배경
              ClipRRect(
                child: Image.asset(
                  imagePath,
                  width: 200,
                  height: 200, // 카드 높이 설정
                  fit: BoxFit.cover,
                ),
              ),
              // 좌측 하단 별점
              Positioned(
                bottom: 8,
                left: 8,
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.white, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(), // 평점
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // 우측 상단 재방문 횟수 박스
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(1), // 흰색 배경
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '재방문 $revisitCount회', // 재방문 횟수 표시
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              // 우측 하단 키워드 박스
              Positioned(
                bottom: 8,
                right: 8,
                child: Row(
                  children: [
                    _buildKeywordBox(keyword1),
                    const SizedBox(width: 4),
                    _buildKeywordBox(keyword2),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4), // 가게 이름과 말풍선 사이의 간격
          ClipPath(
            clipper: InvertedSpeechBubbleClipper(),
            child: Container(
              color: Colors.grey[200], // 말풍선 배경색
              // alignment: Alignment., // 텍스트를 중앙에 배치
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14), // 말풍선 내의 텍스트 패딩
              child: Text(
                comment,
                style: const TextStyle(color: Colors.grey, fontSize: 10,fontWeight:FontWeight.w700),
                // textAlign: TextAlign.end, // 텍스트 중앙 정렬
                maxLines: 2,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          // const SizedBox(height:1), // 이미지와 가게 이름 사이의 간격
          Text(
            storeName, // 가게 이름
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height:1), // 이미지와 가게 이름 사이의 간격
          Text(
            "마지막 방문 2주전", // 가게 이름
            style: const TextStyle(
              fontSize: 10,
              // fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

        ],
      ),
    );
  }

  // 키워드 박스를 생성하는 메서드
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

class InvertedSpeechBubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 10); // 시작점 (왼쪽 상단)
    path.lineTo(size.width / 2 - 10, 10); // 삼각형 왼쪽 점
    path.lineTo(size.width / 2, 0); // 삼각형 꼭대기
    path.lineTo(size.width / 2 + 10, 10); // 삼각형 오른쪽 점
    path.lineTo(size.width, 10); // 오른쪽 상단
    path.lineTo(size.width, size.height-10); // 오른쪽 하단
    path.lineTo(0, size.height-10); // 왼쪽 하단
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
