
import 'package:cafe_front/provider/main/my/my_review_store.dart';
import 'package:flutter/material.dart';
import 'package:cafe_front/constants/characters.dart';
import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/provider/main/my/my_review_store.dart';
import 'package:cafe_front/services/user_service.dart';
import 'package:cafe_front/views/main/my/review_filter.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const OnlyBackButtonAppBar(text: "저장한 카페"),
            const SizedBox(height: 0),


            Expanded(child: ListView(
              children: List.generate(100,
                      (idx) => VisitCafe(idx: idx,)
              ),
            )),
          ],
        ),
      ),

    );
  }
}
class VisitCafe extends StatelessWidget {
  const VisitCafe({
    Key? key,
    required this.idx,
  }) : super(key: key);
  final int idx;
  @override
  Widget build(BuildContext context) {
    var commonTextStyle = const TextStyle(color: CustomColors.deepGrey,fontSize: 12);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      // margin: const EdgeInsets.all(10),
      height: 370,
      child: Column(
        children: [
          // 상반
          Expanded(
            flex: 2,
            child: PageView.builder(
              pageSnapping: false,
              controller: PageController(
                initialPage: 0,
                viewportFraction: 0.6, // 변경 가능
              ),
              itemCount: 5, // 표시할 이미지 수
              itemBuilder: (context, idx) {
                return Container(
                  margin: EdgeInsets.only(left: idx == 0 ? 0 : 3, right: 3), // 첫 번째 페이지는 왼쪽 마진 제거
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage('assets/images/Frame 1.png'), // 각 이미지를 구분하여 경로 설정
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),


          // 중반
          Expanded(child: Stack(
              children: [
                Row(
                  children: [
                    Container(margin: EdgeInsets.only(right: 10)),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 제목
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),

                          child: Row(
                            children: [
                              Text('Honor',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                              const SizedBox(width: 15,),
                              CustomButtonLayout(
                                borderColor: CustomColors.deepGrey,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text('드롭커피',style: commonTextStyle,),
                                ),
                              ),
                              const SizedBox(width: 5,),
                              CustomButtonLayout(
                                borderColor: CustomColors.deepGrey,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text('커피',style: commonTextStyle,),
                                ),
                              ),
                            ],
                          ),),

                        // 주소

                        // 짤짤이
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2.0), // 상하 간격 최소화
                              child: Row(
                                children: [
                                  Text('영업중', style: TextStyle(color: Color(0xFF716D6A),fontWeight: FontWeight.w600,fontFamily: 'Pretendard',fontSize: 14,),),
                                  const SizedBox(width: 10),
                                  Text('서울 노원구 동일로 186길', style: commonTextStyle),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0), // 상하 간격 최소화
                              child: Row(
                                children: [

                                  Text('예상평점', style: TextStyle(color: Color(0xFF716D6A),fontWeight: FontWeight.w600,fontFamily: 'Pretendard',fontSize: 12,),),
                                  const SizedBox(width: 25),
                                  Text('도보 15분', style: commonTextStyle),
                                  const SizedBox(width: 25),
                                  Text('리뷰 999+', style: commonTextStyle),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ),

                    Align(
                      alignment: Alignment(1.0,-1.0),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: 30,
                        height: 50,
                        child: Column(
                          children: [
                            SizedBox(width: 20,height:33,child: Image.asset('assets/icons/bookmark_grey.png')),
                            Text('1.3k',style: commonTextStyle,)
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ]),
          ),
          // 하단

        ],
      ),
    );
  }
}


