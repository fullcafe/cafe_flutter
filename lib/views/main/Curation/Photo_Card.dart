import 'package:flutter/material.dart';

class PhotoTextCard extends StatelessWidget {
  final String imagePath;
  final String text;

  const PhotoTextCard({
    Key? key,
    required this.imagePath,
    required this.text,
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
      child: Align(
        alignment: Alignment.bottomLeft, // 텍스트를 왼쪽 하단에 정렬
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          // color: Colors.black.withOpacity(0.6), // 반투명한 배경색 설정
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
    );
  }
}
