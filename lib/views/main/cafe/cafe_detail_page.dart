import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/provider/main/cafe/cafe_detail_viewmodel.dart';
import 'package:cafe_front/views/main/cafe/cafe_review_page.dart';
import 'package:cafe_front/views/main/cafe/order_page.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:cafe_front/widgets/review_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CafeDetailPage extends StatelessWidget {
  const CafeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const toggleStyle = TextStyle(color: CustomColors.deepGrey,);
    const titleStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 20);
    const summaryStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: CustomColors.deepGrey);
    final viewModel = context.watch<CafeDetailViewModel>();

    if(viewModel.cafe == null){
      return const Center(child: CircularProgressIndicator(),);
    }

    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          BackButtonAppBar(text: viewModel.cafe!.name),
          Expanded(
            child: ListView(
              children: [
                // 이미지
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, i){
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 180,
                          child: Image.asset('assets/images/details/image${i}.jpg',fit: BoxFit.fill,),
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
                          Expanded(flex: 2,child: Row(
                            children: [
                              Text(viewModel.cafe!.name,style: titleStyle,),
                              CustomButtonLayout(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                borderColor: CustomColors.orange,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(viewModel.cafe!.keywords[0].keyword,style: const TextStyle(color: CustomColors.orange),),
                                ),
                              ),
                              CustomButtonLayout(
                                borderColor: CustomColors.orange,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(viewModel.cafe!.keywords[1].keyword,style: const TextStyle(color: CustomColors.orange),),
                                ),
                              )
                            ],
                          )),
                          Expanded(child: Text(viewModel.cafe!.address,style: const TextStyle(color: CustomColors.deepGrey),)),
                          const Expanded(child: Text('예상 선호도:90%   도보 15분',style: TextStyle(fontWeight: FontWeight.bold,color: CustomColors.deepGrey),)),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset('assets/icons/bookmark_grey.png'),
                        ),
                      )
                    ],
                  ),
                ),
                // 버튼 3개
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: Row(
                    children: [
                      const Expanded(
                        child: CustomButtonLayout(
                          height: double.infinity,
                          borderColor: CustomColors.deepGrey,
                          child: Center(child: Text('길찾기',style: TextStyle(color: CustomColors.deepGrey,fontSize: 15),)),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      const Expanded(
                        child: CustomButtonLayout(
                          height: double.infinity,
                          borderColor: CustomColors.deepGrey,
                          child: Center(child: Text('리뷰 작성하기',style: TextStyle(color: CustomColors.deepGrey,fontSize: 15),)),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            viewModel.navigator(context, const OrderPage());
                          },
                          child: const CustomButtonLayout(
                            height: double.infinity,
                            borderColor: CustomColors.deepGrey,
                            child: Center(child: Text('주문하기',style: TextStyle(color: CustomColors.deepGrey,fontSize: 15),)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
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
                CustomToggle(
                  image: 'assets/icons/phone.png',
                  title: '전화',
                  content: viewModel.cafe!.phone,
                ),
                const CustomToggle(
                  image: 'assets/icons/ghost.png',
                  title: 'SNS',
                  content: '인스타그램',
                ),
                // 사장님 한마디
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('사장님의 한마디',style: titleStyle),
                      SizedBox(height: 10,),
                      Text('작은 세일 하겠습니다.\n코스타리카 원두가 진짜 좋은데 새로운 커피가 나왔어서 남아있는 원두 200그램 원두백을 3,000원 할인으로 판매하겠습니다.',
                        style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                // 카페 요약
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('카페 요약',style: titleStyle,),
                      const SizedBox(height: 10,),
                      const Text('커피 맛',style: summaryStyle,),
                      Image.asset('assets/data/taste.png'),
                      const SizedBox(height: 10,),
                      const Text('방문목적',style: summaryStyle,),
                      Image.asset('assets/data/date.png'),
                      const SizedBox(height: 10,),
                      const Text('편의시설',style: summaryStyle,),
                      Row(
                        children: [
                          viewModel.cafe!.wifi? Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              width: 40,child: Image.asset('assets/data/wifi.png')
                          ) : const SizedBox(),
                          viewModel.cafe!.delivery? Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              width: 50,child: Image.asset('assets/data/cover.png')
                          ) : const SizedBox(),
                          viewModel.cafe!.parking? Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              width: 30,child: Image.asset('assets/data/electric.png')
                          ) : const SizedBox(),
                          viewModel.cafe!.petFriendly? Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              width: 50,child: Image.asset('assets/data/toilet.png')
                          ) : const SizedBox(),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Text('뷰',style: summaryStyle,),
                      Image.asset('assets/data/park_view.png'),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                // 메뉴 판매 순위
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('메뉴 판매 순위',style: titleStyle,),
                      Expanded(child: Image.asset('assets/data/menu.png')),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                // 메뉴 리뷰 가볼곳
                ThreeSelected(),
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

class ThreeSelected extends StatefulWidget {
  const ThreeSelected({Key? key}) : super(key: key);

  @override
  State<ThreeSelected> createState() => _ThreeSelectedState();
}

class _ThreeSelectedState extends State<ThreeSelected> {
  int currentIdx = 0;
  List<String> titleList = ['메뉴','리뷰','가볼만한 곳'];
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    const selectedStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 15);
    const unselectedStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey);
    const descriptionStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.grey);
    return Container(
      margin: const EdgeInsets.all(10),
      height: 700,
      child: Column(
        children: [
          // 선택
          SizedBox(
            height: 40,
            child: Row(
              children: List.generate(3, (idx)=>
                  SizedBox(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          currentIdx = idx;
                          controller.animateToPage(currentIdx, duration: const Duration(milliseconds: 300), curve: Curves.ease);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            currentIdx == idx? Text(titleList[idx],style: selectedStyle,) :
                            Text(titleList[idx],style: unselectedStyle,),
                            currentIdx == idx? SizedBox(width: titleList[idx].length.toDouble() * 12,
                                child: const Divider(color: Colors.black,)) :
                            const SizedBox()
                          ],
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (idx) async{
                setState(() {
                  currentIdx = idx;
                });
              },
              children: [
                // 메뉴
                Image.asset('assets/data/menu_info.png',fit: BoxFit.fill,),
                // 리뷰
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ReviewFormat(),
                    const SizedBox(height: 10,),
                    ReviewFormat(),
                    const SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const CafeReviewPage()));
                      },
                      child: const CustomButtonLayout(
                        width: double.infinity,
                        height: 60,
                        borderColor: Colors.grey,
                        child: Center(
                          child: Text('리뷰 더보기',style: unselectedStyle,),
                        ),
                      ),
                    ),
                  ],
                ),
                // 가볼곳
                Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 250,
                                  child: Image.asset('assets/images/near/sweat.jpg',fit: BoxFit.fill,),
                                ),
                                const Text('미라쥬양과점',style: selectedStyle,),
                                const Text('이 장소에서 186m',style: descriptionStyle,)
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 250,
                                  child: Image.asset('assets/images/near/bar.jpg',fit: BoxFit.fill,),
                                ),
                                const Text('웨일스',style: selectedStyle,),
                                const Text('이 장소에서 387m',style: descriptionStyle,)
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 250,
                                  child: Image.asset('assets/images/near/cafe.jpg',fit: BoxFit.fill,),
                                ),
                                const Text('싱싱제과 소품샵',style: selectedStyle,),
                                const Text('이 장소에서 530m',style: descriptionStyle,)
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    // 스크롤 쉽게 하려고 넣음
                    const Expanded(flex: 3,child: SizedBox()),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
