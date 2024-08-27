import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LogoAppBar(),
      ],
    );
  }
}
