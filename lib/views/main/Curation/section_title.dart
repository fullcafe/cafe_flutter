import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24, // 중제목 크기로 조정
              fontWeight: FontWeight.w600, // 중간 두께 설정 (반볼드)
              fontFamily: 'Pretendard-SemiBold', // Pretendard 서체에서 SemiBold 사용
              color: Color(0xff261b08),
            ),
          ),

          TextButton(
            onPressed: () {},
            child: const Text(
              '더보기',
              style: TextStyle(
                fontSize: 16,
                color: Colors.brown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
