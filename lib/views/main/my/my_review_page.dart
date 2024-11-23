import 'package:cafe_front/constants/characters.dart';
import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/models/dto/complex_review_dto.dart';
import 'package:cafe_front/provider/main/my/my_review_viewmodel.dart';
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
    var viewModel = context.watch<MyReviewViewModel>();
    var user = UserStore.getInstance().user;
    // 값 가져올 때 까지 로딩
    if(viewModel.myReviews == null){
      return const Scaffold(
        body: SafeArea(child: Center(child: CircularProgressIndicator())),
      );
    }
    var reviewSize = viewModel.myReviews!.length;
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          const BackButtonAppBar(text: '내 리뷰',),
          ListTile(
            leading: SizedBox(width: 50,child: Image.asset(characterIcons[user?.characterIdx ?? 0])),
            title: Text('${user?.name}',style: const TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(characterFeat[user?.characterIdx ?? 0]['subtitle'].toString(),
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
          Expanded(child: reviewSize > 0 ? ListView(
            children: List.generate(viewModel.myReviews!.length,
                (idx) => ReviewListLayout(idx: idx, reviewDto: viewModel.myReviews![idx],)
            ),
          ) :
              const Center(child: Text('작성하신 리뷰가 없습니다.'),)),
        ],
      )),
    );
  }
}

class ReviewListLayout extends StatelessWidget {
  const ReviewListLayout({
    Key? key,
    required this.idx,
    required this.reviewDto,
  }) : super(key: key);
  final int idx;
  final ComplexReviewDto reviewDto;

  @override
  Widget build(BuildContext context) {
    var commonTextStyle = const TextStyle(color: CustomColors.deepGrey,fontSize: 12);
    var cafeDto = reviewDto.cafeDto;
    var review = reviewDto.reviewDto;

    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 상반
          SizedBox(height: 200,child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(5, (idx)=>Container(
              width: 180,
              margin: const EdgeInsets.all(5),
              child: Image.asset('assets/images/details/image${idx % 3}.jpg',fit: BoxFit.fill,),
            )),
          )),
          // 중반
          SizedBox(height: 100, child: Stack(
            children: [
              Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  width: 90,
                  child: Image.asset('assets/images/details/image0.jpg',fit: BoxFit.fill,),
                ),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 제목
                    SizedBox(height: 50,child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(cafeDto.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        CustomButtonLayout(
                          borderColor: CustomColors.deepGrey,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(cafeDto.keywords.first,style: commonTextStyle,),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        CustomButtonLayout(
                          borderColor: CustomColors.deepGrey,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(cafeDto.keywords.last,style: commonTextStyle,),
                          ),
                        ),
                      ],
                    ),),
                    // 주소
                    Text(cafeDto.address,style: commonTextStyle,),
                    // 짤짤이
                    Expanded(child: Row(
                      children: [
                        const Icon(Icons.favorite,color: CustomColors.deepGrey,size: 15,),
                        Text('92%',style: commonTextStyle,),
                        const SizedBox(width: 10,),
                        Text('도보 15분',style: commonTextStyle,),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 정보
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${review.who[0]} | ${review.convenient[0]} | ${review.object[0]} |',style: commonTextStyle,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star,color: CustomColors.deepGrey,size: 20,),
                      Text(review.numOfStar.toString(),style: commonTextStyle,)
                    ],
                  ),
                ],
              ),
              // 리뷰
              Text(review.content,
                style: const TextStyle(color: CustomColors.deepGrey,fontSize: 15),),
              const SizedBox(height: 10,),
              // 메뉴
              Row(
                children: [
                  CustomButtonLayout(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    borderColor: CustomColors.deepGrey,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('아메리카노',style: commonTextStyle,),
                    ),
                  ),
                  const Expanded(child: Text('깔끔한 맛이에요 무난함',style: const TextStyle(color: CustomColors.deepGrey,fontSize: 15))),
                  SizedBox(width: 20,child: Image.asset('assets/icons/good.png'))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

