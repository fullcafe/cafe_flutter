import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/provider/login/after_login_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/indicator/five_dots_indicator.dart';

class SetAgePage extends StatelessWidget {
  const SetAgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.watch<AfterLoginStore>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${store.name}님의 나이를 알려주세요.',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  const Text('연령별 인기 카페를 알려드릴께요!',style: TextStyle(fontWeight: FontWeight.bold,color: CustomColors.deepGrey),),
                  SizedBox(
                      height:40,
                      child: FiveDotsIndicator(
                        currentIdx: store.currentIdx,
                      )
                  ),
                ],
              )
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('생년월일',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: CustomColors.deepGrey),),
              const SizedBox(width: double.infinity,height: 10,),
              GestureDetector(
                  onTap: (){
                    showCupertinoModalPopup(context: context, builder: (context){
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        color: Colors.white,
                        child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (date){
                              store.addBirthDate(date);
                            }
                        ),
                      );
                    });
                  },
                  child: Text(store.birth == null? '생년월일을 입력해주세요.' : '${store.birth!.year}.${store.birth!.month}.${store.birth!.day}',
                    style: TextStyle(fontWeight: FontWeight.bold,color: store.toNext ? CustomColors.deepGrey : Colors.red),)
              ),
            ],
          ))
        ],
      ),
    );
  }
}
