import 'package:flutter/material.dart';
import '../../../models/cafe.dart';
import '../../../models/visit.dart';

class CustomPhotoCard extends StatelessWidget {
  final String imagePath; // 고정 이미지 경로
  final String storeName; // 가게 이름
  final String keyword1; // 첫 번째 키워드
  final String keyword2; // 두 번째 키워드
  final String comment; // 고정 코멘트
  final int revisitCount; // 고정 재방문 횟수
  final Visit? visit; // 방문 정보 (optional)

  const CustomPhotoCard({
    Key? key,
    required this.imagePath,
    required this.storeName,
    required this.keyword1,
    required this.keyword2,
    required this.comment,
    required this.revisitCount,
    this.visit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180, // 카드 너비
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
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              // 우측 상단 재방문 횟수 박스
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '재방문 $revisitCount회', // 고정된 재방문 횟수
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              // 우측 하단 키워드 박스 (revisitCount가 0 이상일 때만 표시)
              if (revisitCount > 0)
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
          const SizedBox(height: 4),
          ClipPath(
            clipper: InvertedSpeechBubbleClipper(),
            child: Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Text(
                comment,
                style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w700),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Text(
            storeName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis, // 가게 이름이 너무 길면 말줄임표 표시
          ),
          const SizedBox(height: 1),
          Text(
            _getLastVisitText(), // 마지막 방문 날짜 표시
            style: const TextStyle(
              fontSize: 10,
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
        color: Colors.white.withOpacity(0.1),
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        keyword,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  // 마지막 방문 날짜를 텍스트로 변환
  String _getLastVisitText() {
    if (visit == null || visit!.recent == null) {
      return "방문한 적이 없는 곳이에요!";
    } else {
      final now = DateTime.now();
      final lastVisit = visit!.recent!;
      final differenceInDays = now.difference(lastVisit).inDays;
      final weeks = (differenceInDays / 7).floor();

      if (weeks == 0) {
        return "마지막 방문 이번 주";
      } else {
        return "마지막 방문 $weeks주 전";
      }
    }
  }
}

class InvertedSpeechBubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 10);
    path.lineTo(size.width / 2 - 10, 10);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width / 2 + 10, 10);
    path.lineTo(size.width, 10);
    path.lineTo(size.width, size.height - 10);
    path.lineTo(0, size.height - 10);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
