import 'package:flutter/material.dart';

class CafeCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String percentage;
  final double rating;

  const CafeCard({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.percentage,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 120), // 이미지 높이 확보를 위해 추가
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Pretendard-Medium',
                color: Color(0xff261b08),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, size: 12, color: Color(0xff716d6a)),
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
        ),
      ),
    );
  }
}
