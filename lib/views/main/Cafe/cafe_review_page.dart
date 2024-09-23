import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:cafe_front/widgets/review_format.dart';
import 'package:flutter/material.dart';

class CafeReviewPage extends StatelessWidget {
  const CafeReviewPage({Key? key}) : super(key: key);

  static const filter1 = [
    '커피', '라떼', '소금빵','마들렌','플랫화이트','휘낭시에'
  ];
  static const filter2 = [
    '분위기', '서비스', '뷰','좌석/테이블','편의시설',
  ];

  @override
  Widget build(BuildContext context) {
    const keywordStyle = TextStyle(color: CustomColors.deepGrey,fontSize: 15);
    const sortBlack = TextStyle(fontWeight: FontWeight.bold,fontSize: 15);
    const sortGrey = TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey);
    return Scaffold(
      floatingActionButton: CircleAvatar(
        radius: 30,
        child: Image.asset('assets/icons/review_button.png'),
      ),
      body: SafeArea(child: Column(
        children: [
          const BackButtonAppBar(icons: SizedBox(),text: '리뷰',),
          // 필터
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 80,
            child: Column(
              children: [
                Expanded(child: Row(
                  children: [
                    const Text('메뉴',style: keywordStyle,),
                    const SizedBox(width: 10,),
                    Expanded(child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(6, (idx)=>CustomButtonLayout(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        borderColor: CustomColors.deepGrey,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(filter1[idx],style: keywordStyle,),
                        ),
                      ),),
                    )),
                  ],
                )),
                const SizedBox(height: 10,),
                Expanded(child: Row(
                  children: [
                    const Text('특징',style: keywordStyle,),
                    const SizedBox(width: 10,),
                    Expanded(child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(5, (idx)=>CustomButtonLayout(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        borderColor: CustomColors.deepGrey,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(filter2[idx],style: keywordStyle,),
                        ),
                      ),),
                    )),
                  ],
                )),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          // 정렬 순
          Container(
            margin: const EdgeInsets.all(10),
            height: 40,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('추천순',style: sortBlack,),
                      SizedBox(
                        width: 40,
                          child: Divider(color: Colors.black,))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('최신순',style: sortGrey,),
                      SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 리뷰
          Expanded(child: ListView(
            children: List.generate(10, (idx)=>Container(
                margin: const EdgeInsets.all(10),
                child: ReviewFormat(summary: false,)
            )),
          ))
        ],
      )),
    );
  }
}
