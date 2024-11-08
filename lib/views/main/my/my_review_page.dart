import 'package:cafe_front/constants/characters.dart';
import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/provider/main/my/my_review_store.dart';
import 'package:cafe_front/common/user_store.dart';
import 'package:cafe_front/views/main/my/review_filter.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyReviewPage extends StatelessWidget {
  const MyReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = context.watch<MyReviewStore>();
    // 값 가져올 때 까지 로딩
    if(store.myReviews.isEmpty){
      return const Scaffold(
        body: SafeArea(child: Center(child: CircularProgressIndicator())),
      );
    }
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          const BackButtonAppBar(text: '내 리뷰',),
          ListTile(
            leading: SizedBox(width: 50,child: Image.asset(characterIcons[UserStore.user?.characterIdx ?? 0])),
            title: Text('${UserStore.user?.name}',style: const TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(characterFeat[UserStore.user?.characterIdx ?? 0]['subtitle'].toString(),
              style: const TextStyle(color: CustomColors.deepGrey),), // 여기도 캐릭터 따라 변경
            trailing: GestureDetector(
              onTap: (){
                showCupertinoModalPopup(
                    context: context,
                    builder: (context){
                      return const ReviewSearchFilter();
                });
              },
              child: Container(
                width: 90,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.swap_vert,color: Colors.white,),
                    Text('전체·최신순',style: TextStyle(color: Colors.white,fontSize: 12),)
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: ListView(
            children: List.generate(store.myReviews.length,
                (idx) => ReviewListLayout(idx: idx,)
            ),
          )),
        ],
      )),
    );
  }
}

class ReviewListLayout extends StatelessWidget {
  const ReviewListLayout({
    Key? key,
    required this.idx,
  }) : super(key: key);
  final int idx;

  @override
  Widget build(BuildContext context) {
    var commonTextStyle = const TextStyle(color: CustomColors.deepGrey,fontSize: 12);

    return Container(
      margin: const EdgeInsets.all(10),
      height: 400,
      child: Column(
        children: [
          // 상반
          Expanded(flex: 2,child: PageView(
            pageSnapping: false,
            controller: PageController(viewportFraction: 0.7),
            children: List.generate(5, (idx)=>Container(
              margin: const EdgeInsets.all(5),
              color: Colors.black,
            )),
          )),
          // 중반
          Expanded(child: Stack(
            children: [
              Row(
              children: [
                Container(margin: EdgeInsets.only(right: 5),width: 90,color: Colors.black,),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 제목
                    SizedBox(height: 50,child: Row(
                      children: [
                        Text('아너카페',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        const SizedBox(width: 10,),
                        CustomButtonLayout(
                          borderColor: CustomColors.deepGrey,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('커피',style: commonTextStyle,),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        CustomButtonLayout(
                          borderColor: CustomColors.deepGrey,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('커피',style: commonTextStyle,),
                          ),
                        ),
                      ],
                    ),),
                    // 주소
                    Text('서울 노원구 동일로192다길 9',style: commonTextStyle,),
                    // 짤짤이
                    Expanded(child: Row(
                      children: [
                        const Icon(Icons.favorite,color: CustomColors.deepGrey,size: 15,),
                        Text('92%',style: commonTextStyle,),
                        const SizedBox(width: 10,),
                        Text('도보 15분',style: commonTextStyle,),
                        const SizedBox(width: 10,),
                        Text('리뷰 999+',style: commonTextStyle,)
                      ],
                    ))
                  ],
                )),
              ],
            ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 30,
                  height: 50,
                  child: Column(
                    children: [
                      SizedBox(width: 20,child: Image.asset('assets/icons/bookmark_grey.png')),
                      Text('1.3k',style: commonTextStyle,)
                    ],
                  ),
                ),
              ),
            ],
          )),
          // 하단
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 정보
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('카공 | 대기시간 없음 | 커피맛집 | 디저트 맛집 |',style: commonTextStyle,),
                  Text('★ 4.7',style: commonTextStyle,)
                ],
              )),
              // 리뷰
              Expanded(flex: 2,child: Text('블아르ㅏㅇ릐낭리넝린아리ㅏㄴㅇ리ㅏㄴ어리ㅏㄴㅇ링나dfsldjflsdkfjㄴ얼닝ㄹㅏㅇ니ㅏ러ㅣㄴ아러ㅣㄴ아러ㅣ낭러이ㅏ러이나안',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(color: CustomColors.deepGrey,fontSize: 15),)),
              // 메뉴
              Expanded(child: Row(
                children: [
                  CustomButtonLayout(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    borderColor: CustomColors.deepGrey,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('아메리카노',style: commonTextStyle,),
                    ),
                  ),
                  Expanded(child: Text('ㅇ리ㅏㅓ니ㅏ런',style: const TextStyle(color: CustomColors.deepGrey,fontSize: 15))),
                  SizedBox(width: 20,child: Image.asset('assets/icons/good.png'))
                ],
              )),
            ],
          )),
        ],
      ),
    );
  }
}

