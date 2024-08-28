import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../widgets/button/custom_button_layout.dart';

class ReviewSearchFilter extends StatelessWidget {
  const ReviewSearchFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const titleStyle = TextStyle(color: CustomColors.deepGrey,fontSize: 20,fontWeight: FontWeight.bold,decoration: TextDecoration.none);
    const space = SizedBox(width: 10,);
    return Container(
      height: size.height * 0.6,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.all(5),
                width: 50,
                child: const Divider(thickness: 2,color: Colors.grey,)),
            const Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('작성기간',style: titleStyle,),
                const SizedBox(height: 10,),
                Expanded(child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FilterKeyword(keyword: '1주'),
                    space,
                    FilterKeyword(keyword: '2주'),
                    space,
                    FilterKeyword(keyword: '1개월'),
                    space,
                    FilterKeyword(keyword: '3개월'),
                    space,
                    FilterKeyword(keyword: '1년'),
                    space,
                    FilterKeyword(keyword: '전체'),
                  ],
                )),
              ],
            )),
            const Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('카페지역',style: titleStyle,),
                const SizedBox(height: 10,),
                Expanded(child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FilterKeyword(keyword: '공릉역'),
                    space,
                    FilterKeyword(keyword: '서울과학기술대'),
                    space,
                    FilterKeyword(keyword: '경춘선'),
                    space,
                    FilterKeyword(keyword: '하계'),
                  ],
                )),
              ],
            )),
            const Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('정렬',style: titleStyle,),
                const SizedBox(height: 10,),
                Expanded(child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FilterKeyword(keyword: '최신순'),
                    space,
                    FilterKeyword(keyword: '과거순'),
                  ],
                )),
              ],
            )),
            const CustomButtonLayout(
              height: 60,
              width: double.infinity,
              backgroundColor: Colors.black,
              child: Center(child: Text('확인',
                style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal,decoration: TextDecoration.none),)),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterKeyword extends StatelessWidget {
  const FilterKeyword({Key? key,required this.keyword}) : super(key: key);
  final String keyword;

  @override
  Widget build(BuildContext context) {
    const keywordStyle = TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.normal,decoration: TextDecoration.none);
    return CustomButtonLayout(
      borderColor: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(keyword,style: keywordStyle,),
      ),
    );
  }
}
