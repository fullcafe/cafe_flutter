import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';

const keywordStyle = TextStyle(color: Colors.grey,fontSize: 12);
const titleStyle = TextStyle(fontSize: 18,fontWeight: FontWeight.bold);

class SearchBase extends StatelessWidget {
  const SearchBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(),
            FilterBar(),
            const SizedBox(height: 20,),
            SearchKeyword(title: '최근 검색어'),
            SearchKeyword(title: '내 주변 인기 검색어',),
            Container(
              margin: const EdgeInsets.all(10),
              height: 120,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('전에 갔던 이 카페는 어때요?',style: titleStyle,),
                  const SizedBox(height: 5,),
                  Expanded(child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(3, (idx)=>
                        SearchBaseCafeList(),
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                style: const TextStyle(fontSize: 13),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '지역, 메뉴, 매장명 검색',
                  hintStyle: TextStyle(fontSize: 13,color: CustomColors.deepGrey),
                ),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 20,
              child: Image.asset('assets/icons/search_basic.png'))
        ],
      )
    );
  }
}

class FilterBar extends StatelessWidget {
  const FilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: CustomColors.deepGrey,fontSize: 15,fontWeight: FontWeight.bold);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 20,
              child: Image.asset('assets/icons/filter.png')
          ),
          const Text('누구와',style: style,),
          const Text('음료',style: style,),
          const Text('디저트',style: style,),
          const Text('목적',style: style,),
          const Text('편의시설',style: style,),
        ],
      ),
    );
  }
}

class SearchKeyword extends StatelessWidget {
  const SearchKeyword({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 60,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: titleStyle,),
          const SizedBox(height: 5,),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(3, (idx)=>
                  CustomButtonLayout(
                    margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    borderColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('소금빵',style: keywordStyle,),
                    ),
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBaseCafeList extends StatelessWidget {
  const SearchBaseCafeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 11,color: CustomColors.deepGrey);
    return Container(
      width: 300,
      margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
      decoration: BoxDecoration(
        color: const Color(0xfffbfbfa),
        border: Border.all(color: CustomColors.lightGrey)
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Image.asset('assets/images/details/image0.jpg'),
              const SizedBox(width: 10,),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('메트로폴리스',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Text('서울 노원구 어쩌구 블라블ㄹ라 긴 문ㅈ아',style: textStyle),
                  Text('예상평점 ★ 4.7    도보 15분',style: textStyle)
                ],
              )),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: CustomButtonLayout(
              margin: const EdgeInsets.all(5),
              borderColor: CustomColors.deepGrey,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text('재방문 1회',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


