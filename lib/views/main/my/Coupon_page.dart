import 'package:flutter/material.dart';
import '../../../widgets/appbar/custom_appbar.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 상단 앱바
            const SizedBox(height: 20),
            const BackButtonAppBar(text: '카페 쿠폰'),
            const SizedBox(height: 20),
            // Frame511 위젯을 상단 앱바 바로 아래에 추가
            const Frame511(),
            const SizedBox(height: 20), // 간격 조정
            // 쿠폰 이미지
            Image.asset(
              'assets/images/Group 909.png',
              fit: BoxFit.contain,
              height: 450,
            ),
            //const SizedBox(height: 90), // 이미지와 등록 버튼 간의 간격
            // 하단의 등록 버튼
            _buildCouponRegistrationButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCouponRegistrationButton() {
    return Container(
      width: double.infinity,
      height: 65,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF261B08)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown, // 텍스트 크기 조정
        child: const Text(
          '새로운 카페 쿠폰 등록하기',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF716D6A),
            fontSize: 16,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.48,
          ),
        ),
      ),
    );
  }
}

class Frame511 extends StatelessWidget {
  const Frame511({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          padding: const EdgeInsets.only(top: 8, left: 16, bottom: 8),
          decoration: const BoxDecoration(color: Color(0xFFFAFAFA)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '지역',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF716D6A),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  height: 1.0,
                ),
              ),
              const SizedBox(width: 24),
              Row(
                children: [
                  _buildLocationTag('공릉역 주변'),
                  const SizedBox(width: 8),
                  _buildLocationTag('경춘선 주변'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLocationTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF716D6A)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF716D6A),
          fontSize: 14,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w500,
          height: 1.2,
          letterSpacing: -0.32,
        ),
      ),
    );
  }
}
/*
호랑 줄무늬 떠서 임의로 수정함
*/