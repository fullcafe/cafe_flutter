import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../provider/login/after_login_store.dart';
import '../../../widgets/indicator/five_dots_indicator.dart';

class SetCharacterPage extends StatelessWidget {
  const SetCharacterPage({Key? key}) : super(key: key);

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
              const Text('취향을 기반으로\n캐릭터가 완성되었어요!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(
                  height:40,
                  child: FiveDotsIndicator(
                    currentIdx: store.currentIdx,
                  )
              ),
            ],
          )),
          Expanded(flex:3,child: Container(color: Colors.red,)),
        ],
      ),
    );
  }
}
