import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/views/main/search/search_base.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';

enum SearchState {loading, list, map}

class SearchForm extends StatelessWidget {
  const SearchForm({Key? key}) : super(key: key);
  final state = SearchState.list;

  Widget getContent(){
    if(state == SearchState.list) {
      const greyStyle = TextStyle(color: CustomColors.deepGrey);
      const smallStyle = TextStyle(color: CustomColors.deepGrey,fontSize: 10);
      return ListView(
        children: List.generate(5, (idx)=>
            Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 사진
                        SizedBox(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(5, (idx)=>
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  width: 100,
                                  child: Image.asset('assets/images/details/image${idx%3}.jpg',fit: BoxFit.fill,),
                                ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Container(
                          height: 30,
                          child: Row(
                            children: [
                              CircleAvatar(radius: 15,),
                              SizedBox(width: 5,),
                              Text('호이폴로이커피로스터스',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                              SizedBox(width: 5,),
                              CustomButtonLayout(
                                margin: EdgeInsets.only(right: 5),
                                borderColor: CustomColors.deepGrey,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text('드립커피',style: smallStyle,),
                                ),
                              ),
                              CustomButtonLayout(
                                borderColor: CustomColors.deepGrey,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text('재방문 100회',style: smallStyle,),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text('영업중 서울 노원구 동일로 어쩌구 블라블르ㅏ 긴문장',style: greyStyle,),
                        SizedBox(height: 5,),
                        Text('예상평점 ★4.7   도보 15분    리뷰 999+',style: greyStyle,),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 50),
                        height: 45,
                        width: 20,
                        child: Column(
                          children: [
                            SizedBox(
                                width: 20,
                                child: Image.asset('assets/icons/bookmark_grey.png')),
                            Text('1.3k',style: smallStyle,)
                          ],
                        ),
                      ),
                    ),
                  ]
              ),
            ),
        )
      );
    } else if(state == SearchState.map) {
      return const CircularProgressIndicator();
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          const BackButtonAppBar(icons: SizedBox(),),
          CustomSearchBar(),
          const FilterBar(),
          // 추천순
          const Align(
            alignment: Alignment.centerRight,
            child: CustomButtonLayout(
              margin: EdgeInsets.symmetric(horizontal: 10),
              borderColor: CustomColors.orange,
              backgroundColor: CustomColors.orange,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.swap_vert,color: Colors.white,size: 20,),
                    Text('추천순',style: TextStyle(color: Colors.white,fontSize: 12),)
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: getContent()),
        ],
      )),
    );
  }
}
