import 'package:cafe_front/constants/characters.dart';
import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/services/user_service.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';

class MyFavorPage extends StatelessWidget {
  const MyFavorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const commonStyle = TextStyle(color: CustomColors.deepGrey,fontSize: 12);

    const characterFavors = [
      'assets/characters/ca_favor.png',
      'assets/characters/gam_favor.png',
      'assets/characters/sil_favor.png',
      'assets/characters/mi_favor.png',
    ];

    const characterDescriptions = [
      'assets/characters/descriptions/ca.png',
      'assets/characters/descriptions/gam.png',
      'assets/characters/descriptions/sil.png',
      'assets/characters/descriptions/mi.png',
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const BackButtonAppBar(text: '카페 취향 분석',),
            Expanded(child: SingleChildScrollView(
              child: Container(
                height: size.height * 2.2,
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 캐릭터
                    Container(
                      height: 350,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(characterFavors[UserStore.user?.characterIdx ?? 0],),
                            fit: BoxFit.fill
                        )
                      ),
                      // child: Center(child: Image.asset(characterFavors[UserStore.user?.characterIdx ?? 0],
                      // fit: BoxFit.fill,)),
                    ),
                    Center(
                      child: Text(characterFeat[UserStore.user?.characterIdx ?? 0]['title'].toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                    const SizedBox(height: 60,),
                    // 문구
                    Text(characterFeat[UserStore.user?.characterIdx ?? 0]['feat'].toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 320,
                      child: Center(child: Image.asset(characterDescriptions[UserStore.user?.characterIdx ?? 0])),
                    ),
                    const SizedBox(height: 60,),
                    // 많이 간 카페
                    const Text('2024 상반기 가장 많이 간 카페',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RevisitCafe(),
                          RevisitCafe(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60,),
                    // 찰떡 궁합
                    const Text('나와 찰떡 궁합은?',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    Container(
                      height: 120,
                      //color: Colors.blue,
                      child: Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              width: 100,
                              child: Image.asset(characterFavors[
                              (characterFeat[UserStore.user?.characterIdx ?? 0]['chal'] as Map)['chrIdx']
                              ])),
                          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text((characterFeat[UserStore.user?.characterIdx ?? 0]['chal'] as Map)['name'],
                              style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                              const SizedBox(height: 10,),
                            Text((characterFeat[UserStore.user?.characterIdx ?? 0]['chal'] as Map)['feat1'],style: commonStyle,),
                              const SizedBox(height: 5,),
                            Text((characterFeat[UserStore.user?.characterIdx ?? 0]['chal'] as Map)['feat2'],style: commonStyle,),
                          ],))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class RevisitCafe extends StatelessWidget {
  const RevisitCafe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const commonStyle = TextStyle(color: CustomColors.deepGrey,fontSize: 10);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            width: double.infinity,
            height: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Honor',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      CustomButtonLayout(
                        borderColor: CustomColors.deepGrey,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text('재방문 25회',style: commonStyle,),
                        ),
                      )
                    ],
                  ),
                ),
                Text('서울 노원구 동일로190길 65 2층',style: commonStyle,overflow: TextOverflow.ellipsis,),
                Text('예상평점 ★4.7   도보 15분',style: commonStyle,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
