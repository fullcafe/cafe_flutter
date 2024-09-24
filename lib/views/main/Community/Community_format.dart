import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';

import 'Personal_Page.dart';

class CommunityFormat extends StatelessWidget {
  const CommunityFormat({
    Key? key,
    this.summary = true,
  }) : super(key: key);

  final bool summary;

  @override
  Widget build(BuildContext context) {
    var commonTextStyle = const TextStyle(color: CustomColors.deepGrey, fontSize: 12);
    const textStyle = TextStyle(color: CustomColors.deepGrey);
    const smallStyle = TextStyle(color: CustomColors.deepGrey, fontSize: 12);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 이름 부분
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15), // 패딩 추가
          child: SizedBox(
            height: 50, // 높이를 적절히 조정
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                GestureDetector(
                  onTap: () {
                    // PersonalPage로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PersonalPage()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.transparent, // 배경색 투명 설정 (옵션)
                    backgroundImage: AssetImage('assets/images/Community/Ellipse 52.png'),
                  ),
                ),

                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // GestureDetector로 텍스트 감싸기
                    GestureDetector(
                      onTap: () {
                        // PersonalPage로 이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PersonalPage()),
                        );
                      },
                      child: const Text(
                        '디저트 조아',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 3), // 텍스트 간의 간격 조정
                    const Text(
                      '취향 매칭률: 94%',
                      style: TextStyle(color: CustomColors.deepGrey, fontWeight: FontWeight.bold,fontSize: 14),
                    ),
                  ],
                ),
                const Spacer(),
                CustomButtonLayout(
                  borderColor: CustomColors.deepGrey,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: const Text('팔로우', style: textStyle),
                  ),
                ),
                const SizedBox(width:10),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10),
        // 사진 부분 (패딩 제외)
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          height: 400,
          width: double.infinity,
          child: Image.asset(
            'assets/images/Community/Rectangle 33_1.png',
            fit: BoxFit.cover,
          ),
        ),
        // 추가된 내용 시작 (기존의 코드와 합침)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15), // 패딩 추가
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 좌측에 사진 추가
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('assets/images/Community/Rectangle 33_2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // 기존 컨텐츠
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 제목
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          Text(
                            'Honor',
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          const SizedBox(width: 15),
                          CustomButtonLayout(
                            borderColor: CustomColors.deepGrey,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('드롭커피', style: commonTextStyle),
                            ),
                          ),
                          const SizedBox(width: 7),
                          CustomButtonLayout(
                            borderColor: CustomColors.deepGrey,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('커피', style: commonTextStyle),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 주소 및 기타 정보
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Row(
                        children: [
                          Text(
                            '영업중',
                            style: TextStyle(
                              color: Color(0xFF716D6A),
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Pretendard',
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text('서울 노원구 동일로 186길', style: commonTextStyle),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          Text(
                            '예상평점',
                            style: TextStyle(
                              color: Color(0xFF716D6A),
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Pretendard',
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 25),
                          Text('도보 15분', style: commonTextStyle),
                          const SizedBox(width: 25),
                          Text('리뷰 999+', style: commonTextStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // 오른쪽 아이콘 및 텍스트
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height:30),
                  SizedBox(width: 20,height:30, child: Image.asset('assets/icons/bookmark_grey.png')),
                  Text('1.3k', style: commonTextStyle),
                ],
              ),
            ],
          ),
        ),
        // 키워드
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15), // 패딩 추가
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '부모님과 | 대화하기 좋은 | 커피맛집 | 디저트 맛집 |',
                  style: smallStyle,
                ),
              ),
              Icon(Icons.star, color: CustomColors.deepGrey),
              Text('4.7', style: smallStyle),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // 리뷰 내용
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15), // 패딩 추가
          child: Text(
            'ㅓㅣ히나러니아런아러ㅣㄴ알ㄴㅇㄹ니알닝란이ㅏㄹ'
                'ㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴ어론이라니아러니아ㅓ린아ㅓ리나어리나'
                'ㄴㅇ러ㅣㄴ아러ㅣㄴ아러ㅣ낭러ㅣㅏㅇ너리ㅏㄴㅇ',
            style: textStyle,
            maxLines: summary ? 2 : null,
            overflow: summary ? TextOverflow.ellipsis : null,
          ),
        ),
        const SizedBox(height: 25),
        // 메뉴
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10), // 패딩 추가
          child: Row(
            children: [
              const CustomButtonLayout(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                borderColor: CustomColors.deepGrey,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('아메리카노', style: smallStyle),
                ),
              ),
              const SizedBox(width: 5),
              const Expanded(child: Text('깔끔한 맛이에요 무난함', style: textStyle)),
              SizedBox(width: 20, child: Image.asset('assets/icons/good.png')),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10), // 패딩 추가
          child: Row(
            children: [
              const CustomButtonLayout(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                borderColor: CustomColors.deepGrey,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('아이스크림 라뗴', style: smallStyle),
                ),
              ),
              const SizedBox(width: 5),
              const Expanded(child: Text('깔끔한 맛이에요 무난함', style: textStyle)),
              SizedBox(width: 20, child: Image.asset('assets/icons/good.png')),

            ],
          ),

        ),
        const SizedBox(height:30),
        // 기존 코드 생략...

// 아이콘과 텍스트 추가 부분
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20), // 패딩 추가
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 하트 아이콘과 텍스트
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12), // 첫 번째 아이콘의 오른쪽에만 패딩 추가
                    child: Icon(Icons.favorite_border, color: CustomColors.deepGrey),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10), // 두 번째 아이콘의 오른쪽에만 패딩 추가
                    child: Icon(Icons.bookmark_border, color: CustomColors.deepGrey),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 200), // 세 번째 아이콘의 오른쪽에만 패딩 추가
                    child: Icon(Icons.share, color: CustomColors.deepGrey),
                  ),
                  Text('1시간 전', style: smallStyle),
                ],
              ),


            ],
          ),
        ),
        const SizedBox(height:80),


      ],
    );
  }
}
