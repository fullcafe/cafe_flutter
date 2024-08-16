import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../provider/login/after_login_store.dart';
import '../../../widgets/indicator/five_dots_indicator.dart';

class SetCafeStylePage extends StatelessWidget {
  const SetCafeStylePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.watch<AfterLoginStore>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('선호하시는 카페 스타일을\n알려주세요.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              const Text('주소와 가까운 카페들을 추천해드릴게요.',style: TextStyle(fontWeight: FontWeight.bold,color: CustomColors.deepGrey),),
              SizedBox(
                  height:40,
                  child: FiveDotsIndicator(
                    currentIdx: store.currentIdx,
                  )
              ),
            ],
          )),
          Expanded(flex:2,child: Container(color: Colors.blue,)),
        ],
      ),
    );
  }
}
