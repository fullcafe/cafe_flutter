import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';

class ReviewFormat extends StatelessWidget {
  const ReviewFormat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: CustomColors.deepGrey,);
    const smallStyle = TextStyle(color: CustomColors.deepGrey,fontSize: 12);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 이름 부분
        SizedBox(
          height: 35,
          child: Row(
            children: [
              CircleAvatar(),
              SizedBox(width: 5,),
              Text('디저트 조아',style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
              Expanded(child: Text('3시간 전',style: textStyle,)),
              CustomButtonLayout(
                borderColor: CustomColors.deepGrey,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text('팔로우',style: textStyle,),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        // 사진 부분
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(3,
                    (idx)=> Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 120,
                      child: Image.asset('assets/images/details/image${idx}.jpg',fit: BoxFit.fill,),
                    )
            ),
          ),
        ),
        // 키워드
        SizedBox(
          height: 35,
          child: Row(
            children: [
              Expanded(child: Text('부모님과 | 대화하기 좋은 | 커피맛집 | 디저트 맛집 |',style: smallStyle,)),
              Icon(Icons.star,color: CustomColors.deepGrey,),
              Text('4.7',style: smallStyle,),
            ],
          ),
        ),
        // 리뷰 내용
        Text('ㅓㅣ히나러니아런아러ㅣㄴ알ㄴㅇㄹ니알닝란이ㅏㄹ'
            'ㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴ어론이라니아러니아ㅓ린아ㅓ리나어리나'
            'ㄴㅇ러ㅣㄴ아러ㅣㄴ아러ㅣ낭러ㅣㅏㅇ너리ㅏㄴㅇ',
          style: textStyle,maxLines: 2,overflow: TextOverflow.ellipsis),
        const SizedBox(height: 5,),
        // 메뉴
        SizedBox(
          height: 35,
          child: Row(
            children: [
              const CustomButtonLayout(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                borderColor: CustomColors.deepGrey,
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text('아메리카노',style: textStyle,),
                ),
              ),
              const Expanded(child: Text('깔끔한 맛이에요 무난함',style: textStyle)),
              SizedBox(width: 20,child: Image.asset('assets/icons/good.png'))
            ],
          ),
        )
      ],
    );
  }
}
