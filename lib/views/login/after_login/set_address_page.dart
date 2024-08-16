import 'package:cafe_front/provider/login/after_login_store.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../widgets/indicator/five_dots_indicator.dart';

class SetAddressPage extends StatelessWidget {
  const SetAddressPage({Key? key}) : super(key: key);

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
                  const Text('주소를 입력해주세요.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  const Text('주소와 가까운 카페들을 추천해드릴게요.',style: TextStyle(fontWeight: FontWeight.bold,color: CustomColors.deepGrey),),
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
              const Text('주소',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: CustomColors.deepGrey),),
              const SizedBox(height: 10,),
              // 주소 검색 버튼
              CustomButtonLayout(
                height: 50,
                borderColor: Colors.grey,
                child: Row(
                  children: [
                    Container(margin: const EdgeInsets.all(5),child: const Icon(Icons.search,color: CustomColors.deepGrey,)),
                    const Text('도로명,지번,건물명 검색',style: TextStyle(fontWeight: FontWeight.bold,color: CustomColors.deepGrey),)
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              // 위치 찾기 버튼
              CustomButtonLayout(
                height: 50,
                borderColor: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(margin: const EdgeInsets.all(5),child: const Icon(Icons.gps_fixed,color: CustomColors.deepGrey,)),
                    const Text('현재 위치로 찾기',style: TextStyle(fontWeight: FontWeight.bold,color: CustomColors.deepGrey),)
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
