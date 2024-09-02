
import 'package:flutter/material.dart';

import '../../../widgets/appbar/custom_appbar.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Stack 아래에 놓여야 할 내용 먼저 배치
            Positioned(
              top: 75, // Frame511 위젯을 CouponPage에 추가
              left: 0,
              right: 0,
              child: const Frame511(),
            ),
            Positioned(
              top: 155, // 첫 번째 컨테이너의 위치 조정
              left: 15,
              right: 15,
              child: const BlueMilesContainer(),
            ),
            Positioned(
              top: 215, // 두 번째 컨테이너가 첫 번째와 겹치도록 위치 조정
              left: 15, // 살짝 오른쪽으로 이동
              right: 15,
              child: const MuiroContainer(),
            ),
            Positioned(
              top: 275, // 세 번째 컨테이너가 다른 두 컨테이너와 겹치도록 위치 조정
              left: 15, // 더 오른쪽으로 이동
              right: 15,
              child: const ImageContainer(),
            ),
            // BackButtonAppBar를 Stack의 맨 위에 놓지 않도록 조정
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: BackButtonAppBar(text: '카페 쿠폰'),
            ),
            Positioned(
              top: 720, // Component2의 위치
              left: 0,
              right: 0,
              child: Center(
                child: _buildCouponRegistrationButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildCouponRegistrationButton() {
    return Container(
      width: 420,
      height: 65,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF261B08)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Center(
        child: Text(
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



class BlueMilesContainer extends StatelessWidget {
  const BlueMilesContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 213,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: ShapeDecoration(
        color: const Color(0xFF181075),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: [
          const BoxShadow(
            color: Color(0x19000000),
            blurRadius: 10,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'BLUE MILES',
            style: TextStyle(
              color: Color(0xFFE8E4DF),
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontFamily: 'PT Serif',
              fontWeight: FontWeight.w700,
              height: 1.5,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildCircle(Color(0xFF716D6A)),
              _buildCircle(Color(0xFFBAB3AE)),
              _buildCircle(Color(0xFFBAB3AE)),
              _buildCircle(Color(0xFF716D6A)),
              _buildCircle(Color(0xFFBAB3AE)),
            ],
          ),
          const SizedBox(height: 54),
          const Text(
            '도장 10개 아메리카노 무료 서비스',
            style: TextStyle(
              color: Color(0xFF261B08),
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircle(Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 17),
      width: 51,
      height: 51,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
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
          width: 420,
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

class MuiroContainer extends StatelessWidget {
  const MuiroContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 213,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: ShapeDecoration(
        color: const Color(0xFF716E6B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: [
          const BoxShadow(
            color: Color(0x19000000),
            blurRadius: 10,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MUIRO',
            style: TextStyle(
              color: Color(0xFF271B09),
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontFamily: 'PT Serif',
              fontWeight: FontWeight.w700,
              height: 1.5,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildCircle(Color(0xFF716D6A)),
              _buildCircle(Color(0xFFBAB3AE)),
              _buildCircle(Color(0xFFBAB3AE)),
              _buildCircle(Color(0xFF716D6A)),
              _buildCircle(Color(0xFFBAB3AE)),
            ],
          ),
          const SizedBox(height: 54),
          const Text(
            '도장 10개 아메리카노 무료 서비스',
            style: TextStyle(
              color: Color(0xFF261B08),
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircle(Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 17),
      width: 51,
      height: 51,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 381,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: ShapeDecoration(
        color: const Color(0xFFB3A385),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),

        shadows: [
          const BoxShadow(
            color: Color(0x19000000),
            blurRadius: 10,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 121,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 126,
                  height: 126,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Rectangle 38.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        'Honor',
                        style: TextStyle(
                          color: Color(0xFF261B08),
                          fontSize: 20,
                          fontFamily: 'Anonymous Pro',
                          fontWeight: FontWeight.w700,
                          height: 1.0,
                          letterSpacing: -0.32,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '서울 노원구 동일로190길 65 2층',
                        style: TextStyle(
                          color: Color(0xFF261B08),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          letterSpacing: -0.32,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(width: 1, color: Color(0xFF716D6A)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              '5일 전 방문',
                              style: TextStyle(
                                color: Color(0xFF261B08),
                                fontSize: 10,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.50,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Row(
                            children: [
                              const Text(
                                '내 평균 평점',
                                style: TextStyle(
                                  color: Color(0xFF261B08),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.32,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFB3A385), // 배경 색상 설정
                                  image: const DecorationImage(
                                    image: AssetImage('assets/images/Star 1.png'), // 이미지 설정
                                    fit: BoxFit.fill, // 이미지를 꽉 채우기
                                  ),
                              ),
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                '4.7',
                                style: TextStyle(
                                  color: Color(0xFF261B08),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.32,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),
          Wrap(
            spacing: 2, // 각 아이템 사이의 가로 간격
            runSpacing: 10,
            children: [
              Container(
                width: 61,
                height: 61,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF964B), // 배경 색상 설정
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Group 896.png'), // 이미지 설정
                    fit: BoxFit.cover, // 이미지를 꽉 채우기
                  ),
                  borderRadius: BorderRadius.circular(9), // 모서리 반경 설정
                ),
              ),

              const SizedBox(width: 12),
              Container(
                width: 61,
                height: 61,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF964B), // 배경 색상 설정
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Group 896.png'), // 이미지 설정
                    fit: BoxFit.cover, // 이미지를 꽉 채우기
                  ),
                  borderRadius: BorderRadius.circular(9), // 모서리 반경 설정
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 61,
                height: 61,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF964B), // 배경 색상 설정
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Group 896.png'), // 이미지 설정
                    fit: BoxFit.cover, // 이미지를 꽉 채우기
                  ),
                  borderRadius: BorderRadius.circular(9), // 모서리 반경 설정

                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 61,
                height: 61,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF716D6A)),
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),const SizedBox(width: 12),
              Container(
                width: 61,
                height: 61,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF716D6A)),
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),const SizedBox(width: 12),
              Container(
                width: 61,
                height: 61,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF716D6A)),
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),const SizedBox(width: 12),
              Container(
                width: 61,
                height: 61,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF716D6A)),
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),const SizedBox(width: 12),
              Container(
                width: 61,
                height: 61,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF716D6A)),
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),const SizedBox(width: 12),
              Container(
                width: 61,
                height: 61,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF716D6A)),
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),const SizedBox(width: 12),
              Container(
                width: 61,
                height: 61,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF716D6A)),
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
              const SizedBox(height: 74),
              const Text(
                '도장 10개 아메리카노 무료 서비스',
                style: TextStyle(
                  color: Color(0xFF261B08),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}


