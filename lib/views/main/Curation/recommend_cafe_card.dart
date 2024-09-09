import 'package:flutter/material.dart';

class RecommendedCafeCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String lastVisit;
  final double visits;

  const RecommendedCafeCard({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.lastVisit,
    required this.visits,
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
            const SizedBox(height: 100), // 이미지 높이 확보를 위해 추가
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Pretendard-Medium',
                color: Color(0xff261b08),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              lastVisit,
              style: const TextStyle(
                fontSize: 10,
                fontFamily: 'Pretendard-Regular',
                color: Color(0xff716d6a),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '재방문 ${visits.toStringAsFixed(0)}회',
              style: const TextStyle(
                fontSize: 10,
                fontFamily: 'Pretendard-SemiBold',
                color: Color(0xff716d6a),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
