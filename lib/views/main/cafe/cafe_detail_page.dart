import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';

class CafeDetailPage extends StatelessWidget {
  const CafeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const  toggleStyle = TextStyle(color: CustomColors.deepGrey,);
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          const BackButtonAppBar(text: '호이폴로이커피로스터스',),
          Expanded(
            child: ListView(
              children: [
                // 이미지
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, i){
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 180,
                          color: Colors.green,
                        );
                      }
                  ),
                ),
                // 소개
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 100,
                  child: Stack(
                    children: [
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 2,child: Container(
                          child: Row(
                            children: [
                              Text('호이폴로이커피로스터스',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              CustomButtonLayout(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                borderColor: CustomColors.orange,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text('소금빵',style: TextStyle(color: CustomColors.orange),),
                                ),
                              ),
                              CustomButtonLayout(
                                borderColor: CustomColors.orange,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text('데이트',style: TextStyle(color: CustomColors.orange),),
                                ),
                              )
                            ],
                          )
                        )),
                        const Expanded(child: Text('서울 노원구 동일로186길 64 상가',style: TextStyle(color: CustomColors.deepGrey),)),
                        const Expanded(child: Text('예상 선호도:90%   도보 15분    리뷰 999+',style: TextStyle(fontWeight: FontWeight.bold,color: CustomColors.deepGrey),)),
                      ],
                    ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 50,
                          width: 30,
                          child: Column(
                            children: [
                              Expanded(child: Image.asset('assets/icons/bookmark_grey.png')),
                              Text('1.3k',style: TextStyle(color: CustomColors.deepGrey,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // 버튼 3개
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: const Row(
                    children: [
                      Expanded(
                        child: CustomButtonLayout(
                          height: double.infinity,
                          borderColor: CustomColors.deepGrey,
                          child: Center(child: Text('길찾기',style: TextStyle(color: CustomColors.deepGrey,fontSize: 15),)),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: CustomButtonLayout(
                          height: double.infinity,
                          borderColor: CustomColors.deepGrey,
                          child: Center(child: Text('리뷰 작성하기',style: TextStyle(color: CustomColors.deepGrey,fontSize: 15),)),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: CustomButtonLayout(
                          height: double.infinity,
                          borderColor: CustomColors.deepGrey,
                          child: Center(child: Text('주문하기',style: TextStyle(color: CustomColors.deepGrey,fontSize: 15),)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                // 토글 3개
                CustomToggle(
                  image: 'assets/icons/work_clock.png',
                  title: '영업중',
                  content: '21:00에 영업 종료',
                  toggle: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('월요일',style: toggleStyle,),
                            Text('오후 12:00 ~ 9:00',style: toggleStyle,)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('화요일',style: toggleStyle,),
                            Text('오후 12:00 ~ 9:00',style: toggleStyle,)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('수요일',style: toggleStyle,),
                            Text('오후 12:00 ~ 9:00',style: toggleStyle,)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('목요일',style: toggleStyle,),
                            Text('오후 12:00 ~ 9:00',style: toggleStyle,)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('금요일',style: toggleStyle,),
                            Text('오후 12:00 ~ 9:00',style: toggleStyle,)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('토요일',style: toggleStyle,),
                            Text('오후 12:00 ~ 9:00',style: toggleStyle,)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('일요일',style: toggleStyle,),
                            Text('오후 12:00 ~ 9:00',style: toggleStyle,)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const CustomToggle(
                  image: 'assets/icons/phone.png',
                  title: '전화',
                  content: '21:00에 영업 종료',
                ),
                const CustomToggle(
                  image: 'assets/icons/ghost.png',
                  title: 'SNS',
                  content: '인스타그램',
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class CustomToggle extends StatefulWidget {
  const CustomToggle({
    Key? key,
    required this.image,
    required this.title,
    required this.content,
    this.toggle,
  }) : super(key: key);
  final String image;
  final String title;
  final String content;
  final Widget? toggle;

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: CustomColors.deepGrey,);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                _isSelected = !_isSelected;
              });
            },
            child: Row(
              children: [
                SizedBox(width: 15,child: Image.asset(widget.image)),
                const SizedBox(width: 5,),
                Text(widget.title,style: style),
                const SizedBox(width: 10,),
                Expanded(child: Text(widget.content,style: style,)),
                Icon(_isSelected? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,color: CustomColors.deepGrey,),
              ],
            ),
          ),
          _isSelected? (widget.toggle ?? const SizedBox()) : const SizedBox(),
          const SizedBox(height: 5,),
        ],
      )
    );
  }
}
