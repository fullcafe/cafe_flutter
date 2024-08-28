import 'package:cafe_front/constants/characters.dart';
import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/provider/main/my/my_review_store.dart';
import 'package:cafe_front/services/user_service.dart';
import 'package:cafe_front/views/main/my/my_review_page.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalSize = MediaQuery.of(context).size;

    return Column(
      children: [
        const LogoAppBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: totalSize.height * 1.2,
              child: Column(
                children: [
                  // 상단
                  SizedBox(
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
                            Container(
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
                            Container(
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
                  SizedBox(
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('최근 방문한 카페들의 리뷰를 작성해주세요!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        const SizedBox(height: 10,),
                        Expanded(
                          child: SizedBox(
                            height: 10,
                            child: PageView(
                              controller: PageController(viewportFraction: 0.9),
                              children: [
                                // 알갱이들 하드하게 코딩
                                Stack(
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
                                          print('리뷰쓰기');
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
                                ),
                                Stack(
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
                                          print('리뷰쓰기');
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
                                ),
                                Stack(
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
                                          print('리뷰쓰기');
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
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  // 하단
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${UserStore.user?.name}님의 커피 취향 분석',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Expanded(child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: CustomColors.orange,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [
                            Expanded(flex: 4,child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Image.asset(characterCards[UserStore.user?.characterIdx ?? 0]),
                            )),
                            // 캐릭터 따라 문구 변경
                            Expanded(child: Text('아기자기한 카페를 좋아하고\n카페 공부를 좋아하는 대학생',
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                            Expanded(child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CharacterKeyWordBox(text: '#카공'),
                                  CharacterKeyWordBox(text: '#테라스'),
                                  CharacterKeyWordBox(text: '#넓은 공간'),
                                  CharacterKeyWordBox(text: '#맛있는디저트'),
                                ],
                              ),
                            )),
                            const Divider(color: Colors.black,thickness: 1.5,),
                            Expanded(child: GestureDetector(
                              onTap: (){
                                print('자세한 내취향 어쩌구');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.all(10),
                                      child: const Text('자세한 내 취향 분석 보기',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                                  ),
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
            ),
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
