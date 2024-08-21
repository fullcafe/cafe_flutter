import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../provider/login/after_login_store.dart';
import '../../../widgets/indicator/five_dots_indicator.dart';

class SetCafeStylePage extends StatefulWidget {
  const SetCafeStylePage({Key? key}) : super(key: key);

  @override
  State<SetCafeStylePage> createState() => _SetCafeStylePageState();
}

class _SetCafeStylePageState extends State<SetCafeStylePage> {

  final List<List<String>> _keywords = [
    ['디저트 맛있는', '만화', '뷰가 좋은', 'LP',],
    ['조용한', '대화하기 좋은','공부하기 좋은',],
    ['데이트 명소','교통이 편한','커피가 맛있는',],
    ['SNS', '드라이브','분위기 좋은',],
    ['쓴커피','신커피','차','디카페인',],
    ['단체석이 있는','의자가 편한','경치가 좋은']
  ];

  final List<List<bool>> _isSelected = [
    List.generate(4, (i) =>false),
    List.generate(3, (i) =>false),
    List.generate(3, (i) =>false),
    List.generate(3, (i) =>false),
    List.generate(4, (i) =>false),
    List.generate(3, (i) =>false)
  ];

  @override
  Widget build(BuildContext context) {
    final store = context.watch<AfterLoginStore>();
    const space = SizedBox(height: 10,);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('선호하시는 카페 스타일을\n알려주세요.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              const Text('취향에 딱 맞는 카페들을 추천해드릴게요.',style: TextStyle(fontWeight: FontWeight.bold,color: CustomColors.deepGrey),),
              SizedBox(
                  height:40,
                  child: FiveDotsIndicator(
                    currentIdx: store.currentIdx,
                  )
              ),
            ],
          )),
          Expanded(flex:2,child: Column(
            children: List.generate(12, (idx) {
              if(idx%2==0){
                int i = (idx/2).toInt();
                return SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(_keywords[i].length, (kIdx){
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            _isSelected[i][kIdx] = !_isSelected[i][kIdx];
                          });
                        },
                        child: CustomButtonLayout(
                          height: double.infinity,
                          borderColor: _isSelected[i][kIdx]? Colors.black : Colors.grey,
                          child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Center(child: Text(_keywords[i][kIdx],
                                style: TextStyle(fontWeight: FontWeight.bold,
                                  color: _isSelected[i][kIdx]? Colors.black : Colors.grey,),))),
                        ),
                      );
                    }),
                  ),
                );
              } else {
                return space;
              }
            }),
          )),
        ],
      ),
    );
  }
}