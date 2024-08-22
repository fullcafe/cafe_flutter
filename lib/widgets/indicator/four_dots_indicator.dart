import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class FourDotsIndicator extends StatelessWidget {
  const FourDotsIndicator({Key? key,this.currentIdx = 0}) : super(key: key);
  final int currentIdx;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(8, (idx) {
        if (idx % 2 != 0) {
          return const SizedBox(
            width: 15,
          );
        }
        return idx == currentIdx
            ? const CircleAvatar(
          radius: 5,
          backgroundColor: CustomColors.orange,
        )
            : const CircleAvatar(
          radius: 5,
          backgroundColor: CustomColors.lightGrey,
        );
      }),
    );
  }
}
