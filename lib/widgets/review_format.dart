import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/models/review.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';

class ReviewFormat extends StatelessWidget {
  const ReviewFormat({
    Key? key,
    this.summary = true,
    this.review,
  }) : super(key: key);
  final bool summary;
  final Review? review;

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
              const CircleAvatar(),
              const SizedBox(width: 5,),
              Text(review?.user.name ?? '',style: const TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(width: 10,),
              Expanded(child: Text(review?.timestamp.toString() ?? '',style: textStyle,)),
              const CustomButtonLayout(
                borderColor: CustomColors.deepGrey,
                child: Padding(
                  padding: EdgeInsets.all(3.0),
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
              Expanded(child: Text('${review?.who[0] ?? ''} | ${review?.convenient ?? ''} | ${review?.object ?? ''} |',style: smallStyle,)),
              const Icon(Icons.star,color: CustomColors.deepGrey,),
              Text(review?.numOfStar.toString() ?? '0',style: smallStyle,),
            ],
          ),
        ),
        // 리뷰 내용
        Text(review?.content ?? '',
          style: textStyle,maxLines: summary? 2 : null,overflow: summary? TextOverflow.ellipsis : null),
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
        ),
      ],
    );
  }
}
