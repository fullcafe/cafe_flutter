import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/views/main/cafe/menu_detail.dart';
import 'package:cafe_front/views/main/cafe/shopping_cart.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const sortBlack = TextStyle(fontWeight: FontWeight.bold,fontSize: 15);
    const sortGrey = TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey);
    const keywordStyle = TextStyle(fontSize: 12,color: CustomColors.deepGrey);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonAppBar(text: '주문하기',
              icons: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ShoppingCart()));
                },
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 30,
                    child: Image.asset('assets/icons/shopping.png')),
              ),
            ),
            Expanded(child: ListView(
              children: [
                // 카페 명
                Container(
                  margin: const EdgeInsets.all(10),
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
                      // 카페 명
                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('호이폴로이커피로스터스',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          const SizedBox(height: 5,),
                          Text('서울 노원구 동일로186길 64 상가',style: TextStyle(color: CustomColors.deepGrey,fontSize: 10),),
                        ],
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                // 팔터
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('전체',style: sortGrey,),
                          SizedBox(),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('음료',style: sortBlack,),
                            SizedBox(
                                width: 25,
                                child: Divider(color: Colors.black,))
                          ],
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('디저트',style: sortGrey,),
                          SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
                // 키워드
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 30,
                  child: const Row(
                    children: [
                      CustomButtonLayout(
                        backgroundColor: Colors.black,
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text('커피',style: TextStyle(color: Colors.white,fontSize: 12),),
                        ),
                      ),
                      SizedBox(width: 5,),
                      CustomButtonLayout(
                        borderColor: CustomColors.deepGrey,
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text('수제 과일 청',style: keywordStyle,),
                        ),
                      ),
                      SizedBox(width: 5,),
                      CustomButtonLayout(
                        borderColor: CustomColors.deepGrey,
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text('차',style: keywordStyle,),
                        ),
                      ),
                      SizedBox(width: 5,),
                      CustomButtonLayout(
                        borderColor: CustomColors.deepGrey,
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text('초콜릿',style: keywordStyle,),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40,),
                // 제목
                Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text('커피',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                ),
                // 이미지
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const MenuDetail()));
                  },
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Image.asset('assets/data/menu_detail.png')
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
