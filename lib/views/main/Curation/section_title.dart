import 'package:cafe_front/views/main/Curation/Cafe_with_Review.dart';
import 'package:cafe_front/views/main/Curation/More_Curation_Page.dart';
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
              fontSize: 21, // 중제목 크기로 조정
              fontWeight: FontWeight.w600, // 중간 두께 설정 (반볼드)
              fontFamily: 'Pretendard-SemiBold', // Pretendard 서체에서 SemiBold 사용
              color: Color(0xff261b08),
            ),
          ),
          TextButton(
            onPressed: () {
              // '더보기' 버튼을 눌렀을 때 수행할 동작
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const MoreCurationPage()), // MorePage로 이동
              // );
            },
            child: const Text(
              '더보기',
              style: TextStyle(
                fontSize: 12,
                color: Colors.brown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



