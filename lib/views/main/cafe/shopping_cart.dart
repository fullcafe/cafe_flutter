import 'package:cafe_front/provider/main/cafe/cafe_detail_viewmodel.dart';
import 'package:cafe_front/views/main/cafe/order_success.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:cafe_front/widgets/count_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const midSize = TextStyle(fontWeight: FontWeight.bold,fontSize: 15);
    const smallSizeGrey = TextStyle(color: CustomColors.deepGrey,fontSize: 12);
    const margin = EdgeInsets.all(10);
    final viewModel = context.watch<CafeDetailViewModel>();
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          const BackButtonAppBar(text: '장바구니',icons: SizedBox(),),
          // 카페 명
          Container(
            margin: margin,
            height: 60,
            child: Row(
              children: [
                // 사진
                SizedBox(
                  width: 60,
                  height: double.infinity,
                  child: Image.asset('assets/images/details/image2.jpg',fit: BoxFit.fill,),
                ),
                const SizedBox(width: 10,),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(viewModel.cafe!.name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    const SizedBox(height: 5,),
                    Text(viewModel.cafe!.address,style: const TextStyle(color: CustomColors.deepGrey,fontSize: 10),),
                  ],
                )),
              ],
            ),
          ),
          // 선택 버튼
          Container(
            margin: margin,
            height: 30,
            child: const Row(
              children: [
                CustomButtonLayout(
                  width: 25,
                  height: 25,
                ),
                SizedBox(width: 5,),
                Expanded(child: Text('전체선택(1/1)',style: midSize,)),
                Text('선택 삭제 | 전체 삭제',style: smallSizeGrey,)
              ],
            ),
          ),
          // 메뉴
          Container(
              margin: margin,
              child: const Divider(color: CustomColors.deepGrey,)
          ),
          Container(
            margin: margin,
            height: 180,
            child: Column(
              children: [
                // 버튼 삭제
                const SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      CustomButtonLayout(
                        width: 25,
                        height: 25,
                        borderColor: CustomColors.deepGrey,
                      ),
                      Expanded(child: SizedBox()),
                      CustomButtonLayout(
                        borderColor: CustomColors.deepGrey,
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text('삭제',style: smallSizeGrey,),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                // 내용물
                SizedBox(
                  height: 80,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: Image.asset('assets/data/latte.png',fit: BoxFit.fill,),
                      ),
                      const SizedBox(width: 10,),
                      const Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('카페라떼',style: midSize,),
                          Text('ice',style: smallSizeGrey,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('원두:목시',style: smallSizeGrey,),
                              Text('3,000원',style: smallSizeGrey,),
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                // 옵션변경
                const Row(
                  children: [
                    SizedBox(width: 90,),
                    Text('옵션변경',style: TextStyle(color: CustomColors.deepGrey,fontSize: 12,decoration: TextDecoration.underline,decorationColor: CustomColors.deepGrey),)
                  ],
                ),
                const SizedBox(height: 20,),
                // 가격
                const Row(
                  children: [
                    Expanded(child: SizedBox()),
                    CountButton(width: 70, height : 25, minusSize: 12, numberSize: 12, plusSize: 15),
                    SizedBox(width: 10,),
                    Text('3,000원',style: midSize,),
                  ],
                )
              ],
            ),
          ),
          Container(
              margin: margin,
              child: const Divider(color: CustomColors.deepGrey,)
          ),
          // 계산
          Container(
            margin: margin,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('총 1개',style: midSize,),
                Text('3,000원',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
              ],
            ),
          ),
          // 주문하기
          GestureDetector(
            onTap: (){
              int count = 0;
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> OrderSuccess(cafe: viewModel.cafe!,)),
                  (route){
                    return count++ == 3;
                  }
              );
            },
            child: const CustomButtonLayout(
              margin: margin,
              width: double.infinity,
              height: 60,
              backgroundColor: Colors.black,
              child: Center(child: Text('주문하기',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),)),
            ),
          ),
        ],
      )),
    );
  }
}
