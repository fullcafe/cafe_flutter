
import 'package:cafe_front/provider/main/cafe/cafe_detail_viewmodel.dart';
import 'package:cafe_front/provider/main/my/my_review_viewmodel.dart';
import 'package:cafe_front/provider/main/my/my_visit_viewmodel.dart';
import 'package:cafe_front/views/main/Cafe/cafe_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:cafe_front/constants/characters.dart';
import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/provider/main/my/my_review_viewmodel.dart';
import 'package:cafe_front/common/user_store.dart';
import 'package:cafe_front/views/main/my/review_filter.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VisitPage extends StatelessWidget {
  const VisitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyVisitViewModel>();

    if(viewModel.visitCafeList == null){
      return const Scaffold(
        body: SafeArea(child: Center(child: CircularProgressIndicator())),
      );
    }

    var visitSize = viewModel.visitCafeList!.length;
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const BackButtonAppBar(text: '방문한 카페',),
              const SizedBox(height: 20),

              Expanded(child: visitSize > 0 ? ListView(
                children: List.generate(visitSize,
                        (idx) => VisitCafe(idx: idx,)
                ),
              ) : const Center(child: Text('방문한 카페가 없습니다.'),)),
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
    final viewModel = context.read<MyVisitViewModel>();
    final visit = viewModel.visitCafeList![idx];
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
            create: (context) => CafeDetailViewModel(visit.cafe.name),
            child: const CafeDetailPage(),
        )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        // margin: const EdgeInsets.all(10),
        height: 280,
        child: Column(
          children: [
            // 상반
            Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // 수평 스크롤 설정
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0), // 아이템 간 간격 설정
                      child: Image.asset(
                        'assets/images/Frame 1.png', // 이미지 경로 설정
                        width: 150, // 각 이미지의 너비 설정
                        height: 250, // 각 이미지의 높이 설정
                        fit: BoxFit.cover, // 이미지를 꽉 채우도록 설정
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
                    Container(margin: const EdgeInsets.only(right: 10)),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 제목
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),

                          child: Row(
                          children: [
                            SizedBox(
                                width: 90,
                                child: Text(visit.cafe.name,overflow: TextOverflow.ellipsis,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)),
                            const SizedBox(width: 15,),
                            CustomButtonLayout(
                              borderColor: CustomColors.deepGrey,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(visit.cafe.keywords.first,style: commonTextStyle,),
                              ),
                            ),
                            const SizedBox(width: 5,),
                            CustomButtonLayout(
                              borderColor: CustomColors.deepGrey,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(visit.cafe.keywords.last,style: commonTextStyle,),
                              ),
                            ),
                            const SizedBox(width: 5,),
                            CustomButtonLayout(
                              borderColor: CustomColors.deepGrey,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text('재방문 ${visit.visit.count}회',style: commonTextStyle,),
                              ),
                            ),
                          ],
                        ),),

                        // 주소

                        // 짤짤이
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3.0), // 상하 간격 최소화
                              child: Row(
                                children: [
                                  const Text('영업중', style: TextStyle(color: Color(0xFF716D6A),fontWeight: FontWeight.w600,fontFamily: 'Pretendard',fontSize: 14,),),
                                  const SizedBox(width: 10),
                                  Text(visit.cafe.address, style: commonTextStyle),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0), // 상하 간격 최소화
                              child: Row(
                                children: [

                                  const Text('예상평점', style: TextStyle(color: Color(0xFF716D6A),fontWeight: FontWeight.w600,fontFamily: 'Pretendard',fontSize: 12,),),
                                  const SizedBox(width: 25),
                                  Text('도보 15분', style: commonTextStyle),
                                ],
                              ),
                            ),
                          ],
                        ),
                     ],
                    ),
                    ),

                  Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: 40,
                    height: 100,
                    child: Column(
                      children: [
                        SizedBox(width: 20,child: Image.asset('assets/icons/bookmark_grey.png')),
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
      ),
    );
  }
  }


