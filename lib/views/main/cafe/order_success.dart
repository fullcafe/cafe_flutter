import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button/custom_button_layout.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const margin = EdgeInsets.all(10);
    const midSize = TextStyle(fontWeight: FontWeight.bold,fontSize: 15);
    const smallSizeGrey = TextStyle(color: CustomColors.deepGrey,fontSize: 12);
    return Scaffold(
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackButtonAppBar(text: '주문완료',icons: SizedBox(),),
          // 메세지
          Container(
              margin: margin,
              child: const Text('주문이 완료되었어요!\n음료가 준비되면 팝업 알림으로\n알려드릴게요!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
          ),
          Container(
            margin: margin,
            child: const Row(
              children: [
                Text('1번째',style: TextStyle(fontWeight: FontWeight.bold,color: CustomColors.deepGrey),),
                Text('로 음료 준비 중이에요!',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
              ],
            ),
          ),
          // 카페정보
          Container(
            margin: margin,
            height: 250,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 이미지
                    SizedBox(
                      height: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                              width: 150,
                              height: double.infinity,
                              child: Image.asset('assets/images/details/image1.jpg',fit: BoxFit.fill,)
                          ),
                          SizedBox(
                              width: 150,
                              height: double.infinity,
                              child: Image.asset('assets/images/details/image2.jpg',fit: BoxFit.fill,)
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('호이폴로이커피로스터스',style: midSize,),
                    Text('서울 노원구 동일로 190길 65 2층',style: smallSizeGrey,),
                    Text('예상평점 ★4.7   도보 15분',style: smallSizeGrey,),
                  ],
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('메뉴',style: smallSizeGrey,),
                      Text('카페라떼 X1',style: smallSizeGrey,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 버튼
          const CustomButtonLayout(
            margin: margin,
            width: double.infinity,
            height: 60,
            borderColor: CustomColors.deepGrey,
            child: Center(child: Text('카페 쿠폰 발급 받기',style: TextStyle(fontSize: 15,color: CustomColors.deepGrey),)),
          ),
          const CustomButtonLayout(
            margin: margin,
            width: double.infinity,
            height: 60,
            backgroundColor: Colors.black,
            child: Center(child: Text('홈으로 돌아가기',style: TextStyle(fontSize: 15,color: Colors.white),)),
          ),
        ],
      )),
    );
  }
}
