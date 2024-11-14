import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:cafe_front/widgets/count_button.dart';
import 'package:flutter/material.dart';

class MenuDetail extends StatelessWidget {
  const MenuDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 18);
    const standardStyle = TextStyle(fontWeight: FontWeight.bold);
    const greyStyle = TextStyle(fontWeight: FontWeight.bold,color: CustomColors.deepGrey);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const BackButtonAppBar(text: '카페라떼',icons: SizedBox(),),
            Expanded(child: ListView(
              children: [
                // 사진
                Image.asset('assets/data/latte.png'),
                // 제목
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 90,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                        child: Row(
                          children: [
                            Expanded(child: Text('카페라떼',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                            CustomButtonLayout(
                              borderColor: CustomColors.deepGrey,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('판매 2위',style: TextStyle(color: CustomColors.deepGrey),),
                              ),
                            ),
                            SizedBox(width: 5,),
                            CustomButtonLayout(
                              borderColor: CustomColors.deepGrey,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('내 취향 맞춤',style: TextStyle(color: CustomColors.deepGrey),),
                              ),
                            )

                          ],
                        ),
                      ),
                      Text('3,000원',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                      Expanded(child: Row(
                        children: [
                          VerticalDivider(color: Colors.black,thickness: 2,),
                          Expanded(
                            child: Text('고운 거품이 올라간 따듯한 라떼와 얼음이 녹아도 맛있는 아이스 라떼',
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: CustomColors.deepGrey),),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                const SizedBox(height: 40,),
                // 핫 아이스
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 100,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hot/Ice',style: titleStyle,),
                      SizedBox(height: 10,),
                      Expanded(child: Row(
                        children: [
                          CustomButtonLayout(
                            borderColor: CustomColors.orange,
                            backgroundColor: CustomColors.orange,
                            width: 80,
                            height: double.infinity,
                            child: Center(child: Text('Hot',style: standardStyle,)),
                          ),
                          SizedBox(width: 10,),
                          CustomButtonLayout(
                            borderColor: CustomColors.lightGrey,
                            width: 80,
                            height: double.infinity,
                            child: Center(child: Text('Ice',style: standardStyle,)),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                const SizedBox(height: 40,),
                // 원두 선택
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 150,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('원두 선택',style: titleStyle,),
                      SizedBox(height: 10,),
                      Expanded(child: Row(
                        children: [
                          CustomButtonLayout(
                            borderColor: CustomColors.orange,
                            backgroundColor: CustomColors.orange,
                            width: 100,
                            height: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('목시',style: standardStyle,),
                                Text('고소한 단 맛과 진한\n   커피 맛의 밸런스',style: TextStyle(fontSize: 10),),
                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          CustomButtonLayout(
                            borderColor: CustomColors.lightGrey,
                            width: 100,
                            height: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('스칼렛',style: greyStyle),
                                Text('부드럽고 은은한\n      과일 산미',style: TextStyle(fontSize: 10,color: CustomColors.deepGrey),),
                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          CustomButtonLayout(
                            borderColor: CustomColors.lightGrey,
                            width: 100,
                            height: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('나잇캡',style: greyStyle),
                                Text('부드럽고 고소한\n      디카페인',style: TextStyle(fontSize: 10,color: CustomColors.deepGrey),),
                                Text('+500원 추가',style: TextStyle(fontSize: 10,color: CustomColors.deepGrey),),
                              ],
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                const SizedBox(height: 40,),
                // 추가 선택
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 100,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('추가 선택',style: titleStyle,),
                      SizedBox(height: 10,),
                      Expanded(child: Row(
                        children: [
                          CustomButtonLayout(
                            borderColor: CustomColors.lightGrey,
                            width: 80,
                            height: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('샷 추가',style: standardStyle,),
                                Text('+500원 추가',style: TextStyle(fontSize: 10),),
                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          CustomButtonLayout(
                            borderColor: CustomColors.lightGrey,
                            width: 80,
                            height: double.infinity,
                            child: Center(child: Text('연하게',style: standardStyle,)),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                const Divider(color: Colors.black,),
                // 가격란
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: const Row(
                    children: [
                      CountButton(width: 100,height: 40,minusSize: 20,plusSize: 25,numberSize: 20,),
                      Expanded(child: SizedBox()),
                      Text('3,000원',style: titleStyle,)
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                // 버튼
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: const CustomButtonLayout(
                          width: 150,
                          height: double.infinity,
                          borderColor: CustomColors.deepGrey,
                          child: Center(child: Text('장바구니',style: TextStyle(color: CustomColors.deepGrey))),
                        ),
                      ),
                      const CustomButtonLayout(
                        width: 150,
                        height: double.infinity,
                        backgroundColor: Colors.black,
                        child: Center(child: Text('바로 주문하기',style: TextStyle(color: Colors.white))),
                      ),
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
