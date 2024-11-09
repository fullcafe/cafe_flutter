import 'package:flutter/material.dart';
import '../../../models/cafe.dart';
import '../../../models/visit.dart';

class CustomPhotoCard extends StatefulWidget {
  final String imagePath;
  final String storeName;
  final String keyword1;
  final String keyword2;
  final String comment;
  final int revisitCount;
  final Visit? visit;

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
  State<CustomPhotoCard> createState() => _CustomPhotoCardState();
}

class _CustomPhotoCardState extends State<CustomPhotoCard> {
  bool isBookmarked = false;

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // 이미지 배경
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  widget.imagePath,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              // 북마크 버튼
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: toggleBookmark,
                  child: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                    color: isBookmarked ? Colors.orange : Colors.grey,
                    size: 28,
                  ),
                ),
              ),
              // 재방문 횟수 박스
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '재방문 ${widget.revisitCount}회',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              // 키워드 박스 (재방문 횟수가 있을 때만 표시)
              if (widget.revisitCount > 0)
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Row(
                    children: [
                      _buildKeywordBox(widget.keyword1),
                      const SizedBox(width: 4),
                      _buildKeywordBox(widget.keyword2),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          ClipPath(
            clipper: InvertedSpeechBubbleClipper(),
            child: Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Text(
                widget.comment,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.storeName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            _getLastVisitText(),
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
    if (widget.visit == null || widget.visit!.recent == null) {
      return "방문한 적이 없는 곳이에요!";
    } else {
      final now = DateTime.now();
      final lastVisit = widget.visit!.recent!;
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
