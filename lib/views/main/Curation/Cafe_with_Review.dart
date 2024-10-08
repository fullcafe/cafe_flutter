import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../widgets/button/custom_button_layout.dart';

class CafeWithReviewPage extends StatelessWidget {
  const CafeWithReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: CustomColors.deepGrey,);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 상단 이미지 섹션
        Container(
        height: 300,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3, // 이미지 개수에 맞게 설정
          separatorBuilder: (context, index) => const SizedBox(width: 8.0), // 이미지 사이 간격 설정
          itemBuilder: (context, index) {
            return Image.asset('assets/images/Frame $index.png', width: 250, fit: BoxFit.cover);
          },
        ),
      ),


          const SizedBox(height: 5), // 이미지와 텍스트 사이의 간격
          // 카페 이름과 카테고리
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '브라이트 사이드',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                spacing: 6.0, // 칩들 사이의 수평 간격
                runSpacing: 4.0, // 칩들 사이의 수직 간격
                children: [
                  _buildCategoryChip('SNS'),
                  _buildCategoryChip('루프탑'),
                  _buildCategoryChip('디저트'),
                ],
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(0),
                  width: 30,
                  height: 50,
                  child: Column(
                    children: [
                      SizedBox(width: 20,child: Image.asset('assets/icons/bookmark_grey.png')),
                      Text('1.3k',style:TextStyle(),)
                    ],
                  ),
                ),
              ),
            ],
          ),


          // 카페 정보
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline, // 텍스트의 기준선으로 정렬
            textBaseline: TextBaseline.alphabetic, // 알파벳 기준선으로 정렬
            children: [
              Text('영업중', style: TextStyle(color: Colors.black54, fontFamily: 'Pretendard-SemiBold', fontSize: 14, fontWeight: FontWeight.w700,),),
              SizedBox(width: 14),
              Text('서울 종로구 보문로7길 3', style: TextStyle(color: Colors.black54, fontFamily: 'Pretendard-SemiBold', fontSize: 14, fontWeight: FontWeight.w600,),),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text('예상평점', style: TextStyle(color: Colors.black54, fontFamily: 'Pretendard-SemiBold', fontSize: 14, fontWeight: FontWeight.w600,),),
              SizedBox(width: 8),
              Icon(Icons.star, color: Colors.black54, size: 16),
              SizedBox(width: 8),
              Text('4.7', style: TextStyle(color: Colors.black54, fontFamily: 'Pretendard-SemiBold', fontSize: 14, fontWeight: FontWeight.w600,),),
              SizedBox(width: 24),
              Text('대중교통 30분', style: TextStyle(color: Colors.black54, fontFamily: 'Pretendard-SemiBold', fontSize: 14, fontWeight: FontWeight.w600,),),
              SizedBox(width: 24),
              Text('리뷰 999+', style: TextStyle(color: Colors.black54, fontFamily: 'Pretendard-SemiBold', fontSize: 14, fontWeight: FontWeight.w600,),),
            ],
          ),
          const SizedBox(height: 18),

          // 리뷰 리스트
          _buildReviewSection(),
          Container(
            width: 400, // 선의 너비
            height: 1, // 선의 높이
            color: Colors.grey, // 선의 색상
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.transparent, // 배경 투명
        border: Border.all(color: Colors.grey[500]!), // 테두리 회색
        borderRadius: BorderRadius.circular(8), // 모서리 둥글게
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey[500], // 글자 색상 회색
        ),
      ),
    );
  }


  Widget _buildTag(String name, String score, String time) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/Frame 394.png'),
            ),
            const SizedBox(width: 8),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 4),
        Text('평점 $score', style: TextStyle(color: Colors.grey)),
        Text(time, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildReviewSection() {
    return SizedBox(
      height: 240,
      // 수평 스크롤 뷰 전체 높이 설정
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // 수평 스크롤 설정
        itemCount: 3, // 아이템 개수 설정
        itemBuilder: (context, index) {
          return Container(
            width: 390, // 각 아이템의 너비 설정
            // margin: const EdgeInsets.symmetric(horizontal: 0), // 아이템 간의 수평 간격
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // 사진 섹션
                Container(
                  width:380,
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3, // 이미지 개수에 맞게 설정
                    separatorBuilder: (context, index) => const SizedBox(width: 8.0), // 이미지 사이 간격 설정
                    itemBuilder: (context, index) {
                      return Image.asset('assets/images/Frame 1.png', width: 120, fit: BoxFit.cover);
                    },

                  ),

                ),

                const SizedBox(height: 8), // 이미지와 텍스트 사이의 간격
                // 텍스트 섹션
                Row(
                  children: [
                    Text(
                      '친구와 | 대화하기 좋은 | 커피맛집 | 디저트 맛집',
                      style: TextStyle(color: Colors.grey, fontSize: 13,fontWeight:FontWeight.w600,), // 텍스트 스타일
                      maxLines: 1, // 텍스트가 한 줄을 넘지 않도록 설정
                      overflow: TextOverflow.ellipsis, // 텍스트가 넘칠 경우 생략표시(...)
                    ),
                    const SizedBox(width: 65),
                    Icon(Icons.star, color: Colors.grey, size: 25),
                    const SizedBox(width:4),
                    Text('4.7', style: TextStyle(color: Colors.grey,fontWeight:FontWeight.w800)),
                  ],
                ),

                const SizedBox(height: 4), // 텍스트 간의 간격
                Text(
                  '작은 한옥을 구석구석 잘 꾸며놓았네요. 처마 밑에 소반들이\n귀여워요. 날씨 좋으면 음료 마시기 좋겠어요.',
                  style: TextStyle(fontSize: 13,color:Colors.grey,fontWeight:FontWeight.w600),
                  maxLines: 2, // 텍스트가 두 줄을 넘지 않도록 설정
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4), // 텍스트와 별점 사이의 간격


              ],
            ),
          );
        },
      ),
    );
  }

}
