import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/provider/login/after_login_store.dart';
import 'package:cafe_front/widgets/indicator/five_dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetNicknamePage extends StatelessWidget {
  const SetNicknamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.watch<AfterLoginStore>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(child: Column(
            children: [
              const SizedBox(
                height:120,
                child: Align(alignment: Alignment.centerLeft,child: Text('가입을 축하드려요!\n어떻게 불러드리면 될까요?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
              ),
              const SizedBox(
                height:60,
                child: Align(alignment:Alignment.topLeft,child: Text('닉네임은 공백없이 10자 이하,\n기호는 -_.만 사용가능합니다.',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),)),
              ),
              SizedBox(
                height:40,
                child: FiveDotsIndicator(
                  currentIdx: store.currentIdx,
                )
              ),
            ],
          )),
          Expanded(child: Column(
            children: [
              const SizedBox(
                height: 60,
                child: Align(alignment: Alignment.centerLeft,child: Text('닉네임',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: CustomColors.deepGrey),)),
              ),
              Form(
                key: store.key,
                child: SizedBox(
                  height: 60,
                  child: TextFormField(
                    controller: store.controller,
                    // 기호 및 공백 validator는 나중에 추가
                    validator: (value){
                      if(value!.length > 10){
                        return '10글자 내로 입력해주세요!';
                      }
                      if(value!.isEmpty){
                        return '닉네임을 입력해주세요!';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: '10글자 내로 입력해주세요.',
                    ),
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
