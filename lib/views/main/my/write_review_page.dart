import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';

class WriteReviewPage extends StatefulWidget {
  const WriteReviewPage({Key? key}) : super(key: key);

  @override
  State<WriteReviewPage> createState() => _WriteReviewPageState();
}

class _WriteReviewPageState extends State<WriteReviewPage> {

  var numOfStar = 0;
  var whoList = [
    {
      'key' : '혼자',
      'check' : false,
    },
    {
      'key' : '연인',
      'check' : false,
    },
    {
      'key' : '친구',
      'check' : false,
    },
    {
      'key' : '어르신',
      'check' : false,
    },
    {
      'key' : '어린이',
      'check' : false,
    },
    {
      'key' : '반려동물',
      'check' : false,
    }
  ];
  var convenientList = [
    {
      'key' : '콘센트',
      'check' : false,
    },
    {
      'key' : '5인이상 단체석',
      'check' : false,
    },
    {
      'key' : '휠체어',
      'check' : false,
    },
    {
      'key' : '엘레베이터',
      'check' : false,
    },
    {
      'key' : '내부 화장실',
      'check' : false,
    },
    {
      'key' : '충전기',
      'check' : false,
    },
    {
      'key' : '와이파이',
      'check' : false,
    },
    {
      'key' : '담요',
      'check' : false,
    },
    {
      'key' : '주차장',
      'check' : false,
    },
  ];
  var objectList = [
    {
      'key' : '공부/작업',
      'check' : false,
    },
    {
      'key' : '대화',
      'check' : false,
    },
    {
      'key' : '데이트',
      'check' : false,
    },
    {
      'key' : 'SNS',
      'check' : false,
    },
    {
      'key' : '휴식',
      'check' : false,
    },
    {
      'key' : '브런치/식사',
      'check' : false,
    },
    {
      'key' : '디저트/빵투어',
      'check' : false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const titleStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 20);

    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              const BackButtonAppBar(text: '리뷰 작성하기'),
              Expanded(child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: size.height * 2.1,
                  child: Column(
                    children: [
                      // 가게 명
                      SizedBox(
                        height: 90,
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              width: 70,
                              color: Colors.blue,
                            ),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('호이폴로이커피로스터스',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                                const SizedBox(height: 10,),
                                Text('서울 노원구 동일로186길 64 상가',
                                style: TextStyle(color: CustomColors.deepGrey,fontSize: 11),),
                              ],
                            ))
                          ],
                        ),
                      ),
                      // 이미지
                      SizedBox(
                        height: 300,
                        child: PageView(
                          pageSnapping: false,
                          controller: PageController(viewportFraction: 0.8),
                          children: List.generate(5, (idx)=>Container(
                            margin: const EdgeInsets.all(5),
                            color: Colors.black,
                          )),
                        ),
                      ),
                      const SizedBox(height: 60,),
                      // 만족도
                      const Text('카페 만족도',style: titleStyle,),
                      SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(5, (idx) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              numOfStar = idx + 1;
                            });
                          },
                          child: SizedBox(
                              width: 50,
                              child: idx < numOfStar? Image.asset('assets/icons/star_selected.png')  :
                              Image.asset('assets/icons/star_unselected.png')),
                        ); }
                          ),
                        ),
                      ),
                      const SizedBox(height: 60,),
                      // 누구와
                      const Text('누구와 다녀오셨나요?',style: titleStyle,),
                      SizedBox(
                        height: 60,
                        child: Column(
                          children: [
                            Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(6,
                                      (idx)=> GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            whoList[idx]['check'] = !(whoList[idx]['check'] as bool);
                                          });
                                        },
                                        child: ReviewKeyword(
                                            keyword: whoList[idx]['key'].toString(),
                                            selected: whoList[idx]['check'] as bool,
                                        ),
                                      )
                              ),
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60,),
                      // 편의 시설
                      const Text('편의시설은 어떤 게 있었나요?',style: titleStyle,),
                      SizedBox(
                        height: 90,
                        child: Column(
                          children: [
                            Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(4,
                                      (idx)=> GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        convenientList[idx]['check'] = !(convenientList[idx]['check'] as bool);
                                      });
                                    },
                                    child: ReviewKeyword(
                                      keyword: convenientList[idx]['key'].toString(),
                                      selected: convenientList[idx]['check'] as bool,
                                    ),
                                  )
                              ),
                            )),
                            Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(5, (idx) {
                            idx = idx + 4;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  convenientList[idx]['check'] =
                                      !(convenientList[idx]['check'] as bool);
                                });
                              },
                              child: ReviewKeyword(
                                keyword: convenientList[idx]['key'].toString(),
                                selected: convenientList[idx]['check'] as bool,
                              ),
                            );
                          }),
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60,),
                      // 목적
                      const Text('어떤 목적으로 다녀오셨나요?',style: titleStyle,),
                      SizedBox(
                        height: 90,
                        child: Column(
                          children: [
                            Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(5,
                                      (idx)=> GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        objectList[idx]['check'] = !(objectList[idx]['check'] as bool);
                                      });
                                    },
                                    child: ReviewKeyword(
                                      keyword: objectList[idx]['key'].toString(),
                                      selected: objectList[idx]['check'] as bool,
                                    ),
                                  )
                              ),
                            )),
                            Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(2, (idx) {
                                idx = idx + 5;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      objectList[idx]['check'] =
                                      !(objectList[idx]['check'] as bool);
                                    });
                                  },
                                  child: ReviewKeyword(
                                    keyword: objectList[idx]['key'].toString(),
                                    selected: objectList[idx]['check'] as bool,
                                  ),
                                );
                              }),
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60,),
                      // 말씀
                      const Text('카페에 추가로 해주고픈 말씀이 있나요?',style: titleStyle,),
                      Expanded(child: TextFormField(
                        maxLines: 10,
                        decoration: const InputDecoration(
                          hintText: '최소 10자 이상 입력해주세요.',
                          hintStyle: TextStyle(fontSize: 12),
                          border: InputBorder.none,
                        ),
                      )),
                      const CustomButtonLayout(
                        backgroundColor: Colors.black,
                        height: 60,
                        width: double.infinity,
                        child: Center(child: Text('리뷰 올리기',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                      ),
                    ],
                  ),
                ),
              ))
            ],
          )
      ),
    );
  }
}

class ReviewKeyword extends StatelessWidget {
  const ReviewKeyword({
    Key? key,
    required this.keyword,
    this.selected = false,
  }) : super(key: key);
  final String keyword;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return CustomButtonLayout(
      borderColor: selected? Colors.black : Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(keyword,style: TextStyle(color: selected? Colors.black : Colors.grey,),),
      ),
    );
  }
}
