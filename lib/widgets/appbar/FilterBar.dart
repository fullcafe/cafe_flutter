import 'package:flutter/material.dart';
import 'package:cafe_front/constants/colors.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: CustomColors.deepGrey, fontSize: 15, fontWeight: FontWeight.bold);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 20, child: Image.asset('assets/icons/filter.png')),
          const Text('누구와', style: style),
          const Text('음료', style: style),
          const Text('디저트', style: style),
          const Text('목적', style: style),
          const Text('편의시설', style: style),
        ],
      ),
    );
  }
}
