import 'package:cafe_front/constants/characters.dart';
import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/provider/main/my/my_favor_store.dart';
import 'package:cafe_front/provider/main/my/my_page_store.dart';
import 'package:cafe_front/provider/main/my/my_review_store.dart';
import 'package:cafe_front/common/user_store.dart';
import 'package:cafe_front/views/main/my/Coupon_page.dart';
import 'package:cafe_front/views/main/my/my_favor_page.dart';
import 'package:cafe_front/views/main/my/my_review_page.dart';
import 'package:cafe_front/views/main/my/write_review_page.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Visit_Page.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.watch<MyPageStore>();
    const margin = EdgeInsets.symmetric(horizontal: 10);
    const keywords = [
      ['#카공', '#편한의자', '#넓은공간','#맛있는디저트'],
      ['#낭만','#테라스','#분좋카','#맛있는디저트'],
      ['#빠른주문','#많은음료용량','#높은책상'],
      ['#맛있는디저트','#케이크','#테이블간격이넓은']
    ];

    return Column(
      children: [
        // 앱바
        LogoAppBar(
          logo: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 60,
              child: Image.asset('assets/logos/cafe_logo.png')
          ),
        ),
        // 내용
        Expanded(
          child: ListView(
            children: [
              // 상단
              Container(
                margin: margin,
                height: 180,
                child: Column(
                  children: [
                    Expanded(child: Row(
                      children: [
                        SizedBox(width: 60,child: Image.asset(characterIcons[UserStore.user?.characterIdx ?? 0])),
                        const SizedBox(width: 10,),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${UserStore.user?.name}님',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            const Text('리뷰 포인트 509p')
                          ],
                        ))
                      ],
                    )),
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const CouponPage(), // 상태 관리 없이 단순히 VisitPage로 이동
                            ),
                            );
                          },
                          child: SizedBox(
                            width: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 30,child: Image.asset('assets/icons/coupon.png')),
                                SizedBox(height: 10,),
                                Text('쿠폰',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                              ],
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const VisitPage(), // 상태 관리 없이 단순히 VisitPage로 이동
                            ),
                            );
                          },
                          child: SizedBox(
                            width: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 30,child: Image.asset('assets/icons/clock.png')),
                                SizedBox(height: 10,),
                                Text('방문한 카페',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangeNotifierProvider(
                              create: (context) => MyReviewStore(),
                              child: const MyReviewPage(),
                            )));
                          },
                          child: SizedBox(
                            width: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 30,child: Image.asset('assets/icons/pencil.png')),
                                const SizedBox(height: 10,),
                                Text('내 리뷰',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 30,child: Image.asset('assets/icons/star.png')),
                              SizedBox(height: 10,),
                              Text('단골카페',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                            ],
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              // 중단
              Container(
                margin: margin,
                height: 150,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('최근 방문한 카페들의 리뷰를 작성해주세요!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    const SizedBox(height: 10,),
                    Expanded(
                      child: SizedBox(
                        height: 10,
                        child: store.recentlyVisitCafeList.isEmpty?
                        const Text('최근 방문한 카페가 없습니다',style: TextStyle(fontSize: 15),) :
                        PageView(
                          controller: PageController(viewportFraction: 0.9),
                          children: List.generate(store.recentlyVisitCafeList.length,
                                  (idx)=> RecentVisitCafeLayout(idx: idx,)
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              // 하단
              Container(
                margin: margin,
                height: 500,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${UserStore.user?.name}님의 커피 취향 분석',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: CustomColors.orange,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Image.asset(characterCards[
                                  UserStore.user?.characterIdx ?? 0]),
                            )),
                        // 캐릭터 따라 문구 변경
                        Expanded(
                            child: Text(
                          characterFeat[UserStore.user?.characterIdx ?? 0]
                                  ['title']
                              .toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                        Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(keywords[UserStore.user?.characterIdx ?? 0].length,
                                      (idx)=> CharacterKeyWordBox(text: keywords[UserStore.user?.characterIdx ?? 0][idx])
                              ),
                            )),
                        const Divider(
                          color: Colors.black,
                          thickness: 1.5,
                        ),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChangeNotifierProvider(
                                            create: (context) => MyFavorStore(),
                                            child: const MyFavorPage())));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: const EdgeInsets.all(10),
                                  child: const Text(
                                    '자세한 내 취향 분석 보기',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_forward_ios),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ))
                ],
              )),
            ],
          ),
        )
      ],
    );
  }
}

class CharacterKeyWordBox extends StatelessWidget {
  const CharacterKeyWordBox({
    Key? key,
    required this.text
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return CustomButtonLayout(
      height: 40,
      child: Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text,style: const TextStyle(fontSize: 13,fontWeight: FontWeight.w600),),
      )),
    );
  }
}

class RecentVisitCafeLayout extends StatelessWidget {
  const RecentVisitCafeLayout({
    Key? key,
    required this.idx,
  }) : super(key: key);
  final int idx;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Container(width: 90,color: Colors.black,),
            const SizedBox(width: 10,),
            const Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('호이폴로이커피로스터스',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                SizedBox(height: 5,),
                Text('서울 노원구 동일로186길 64 상가',style: TextStyle(fontSize: 11,color: CustomColors.deepGrey),),
                SizedBox(height: 5,),
                Text('도보 15분    ★ 4.7',style: TextStyle(fontWeight: FontWeight.bold,color: CustomColors.deepGrey),),
              ],
            ))
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: (){
              print(idx);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const WriteReviewPage()));
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              width: 50,
              height: 70,
              child: Column(
                children: [
                  SizedBox(width: 40,child: Image.asset('assets/icons/review_button.png')),
                  const SizedBox(height: 5,),
                  const Text('리뷰 쓰기',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

