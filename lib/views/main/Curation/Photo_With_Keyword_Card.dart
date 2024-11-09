import 'package:flutter/material.dart';
import '../../../models/cafe.dart';

class PhotoKeyCard extends StatefulWidget {
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
  State<PhotoKeyCard> createState() => _PhotoKeyCardState();
}

class _PhotoKeyCardState extends State<PhotoKeyCard> {
  bool isBookmarked = false;

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 280,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          // 북마크 버튼 추가
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: toggleBookmark,
              child: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                color: isBookmarked ? Colors.orange : Colors.white,
                size: 28,
              ),
            ),
          ),
          // 키워드 및 텍스트 정보
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 8.0, bottom: 2.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildKeywordBox(widget.keyword1),
                    const SizedBox(width: 8),
                    _buildKeywordBox(widget.keyword2),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Text(
                    widget.text,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

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
}
