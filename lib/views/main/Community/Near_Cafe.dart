import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:cafe_front/widgets/review_format.dart';
import 'package:flutter/material.dart';

import 'Community_format.dart';

class NearCafePage extends StatelessWidget {
  const NearCafePage({Key? key}) : super(key: key);

  static const filter1 = [
    '커피', '라떼', '소금빵','마들렌','플랫화이트','휘낭시에'
  ];
  static const filter2 = [
    '분위기', '서비스', '뷰','좌석/테이블','편의시설',
  ];

  @override
  Widget build(BuildContext context) {
    const keywordStyle = TextStyle(color: CustomColors.deepGrey,fontSize: 15);
    const sortBlack = TextStyle(fontWeight: FontWeight.bold,fontSize: 15);
    const sortGrey = TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey);
    return Scaffold(

      body: SafeArea(child: Column(
        children: [
          const SizedBox(height:20),
          // 리뷰
          Expanded(child: ListView(
            children: List.generate(10, (idx)=>Container(
                margin: const EdgeInsets.all(0),
                child:  CommunityFormat(summary: false,)
            )),
          ))
        ],
      )),
    );
  }
}
