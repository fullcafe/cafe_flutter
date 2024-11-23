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

  String getDateFormat(DateTime time){
    var now = DateTime.now();
    if(now.difference(time).inMinutes < 1){
      var difference = now.difference(time).inSeconds;
      return '$difference초 전';
    }
    if(now.difference(time).inHours < 1){
      var difference = now.difference(time).inMinutes;
      return '$difference분 전';
    }
    if(now.difference(time).inDays < 1){
      var difference = now.difference(time).inHours;
      return '$difference시간 전';
    }
    return '${time.year}-${time.month}-${time.day} ${time.hour}:${time.month}:${time.second}';
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: CustomColors.deepGrey,);
    const smallStyle = TextStyle(color: CustomColors.deepGrey,fontSize: 12);
    var character = ['ca_circle.png','gam_circle.png','sil_circle.png','mi_circle.png'];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 이름 부분
        SizedBox(
          height: 35,
          child: Row(
            children: [
              SizedBox(width: 30,child: Image.asset('assets/characters/${character[review?.user.characterIdx?? 0]}')),
              const SizedBox(width: 5,),
              Text(review?.user.name ?? '',style: const TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(width: 10,),
              Expanded(child: Text(getDateFormat(review?.timestamp ?? DateTime.now()),style: textStyle,)),
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
              Expanded(child: Text('${review?.who[0] ?? ''} | ${review?.convenient[0] ?? ''} | ${review?.object[0] ?? ''} |',style: smallStyle,)),
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
