import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class FiveDotsIndicator extends StatelessWidget {
  const FiveDotsIndicator({Key? key,this.currentIdx = 0}) : super(key: key);
  final int currentIdx;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(10, (idx) {
        if (idx % 2 != 0) {
          return const SizedBox(
            width: 20,
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
