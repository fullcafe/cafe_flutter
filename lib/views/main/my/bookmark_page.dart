import 'dart:math';

import 'package:cafe_front/provider/main/my/my_bookmark_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyBookmarkViewModel>();

    if(viewModel.bookmarkCafeList == null){
      return const Scaffold(
        body: SafeArea(child: Center(child: CircularProgressIndicator())),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const BackButtonAppBar(text: "저장한 카페"),
            const SizedBox(height: 0),


            Expanded(child: ListView(
              children: List.generate(viewModel.bookmarkCafeList!.length,
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
   VisitCafe({
    Key? key,
    required this.idx,
  }) : super(key: key);

  final int idx;

  final List<String> imagePaths = List.generate(
    10,
        (index) => 'assets/images/Frame ${index + 1}.png', // 이미지 경로 리스트
  );

  final Random _random = Random();

  String getRandomImage() {
    int randomIndex = _random.nextInt(imagePaths.length);
    return imagePaths[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    var commonTextStyle = const TextStyle(color: CustomColors.deepGrey, fontSize: 12);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
              itemCount: 10, // 표시할 이미지 수
              itemBuilder: (context, idx) {
                return Container(
                  margin: EdgeInsets.only(left: idx == 0 ? 0 : 3, right: 3),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage(getRandomImage()), // 랜덤 이미지 경로
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


