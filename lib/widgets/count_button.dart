import 'package:cafe_front/constants/colors.dart';
import 'package:flutter/material.dart';

class CountButton extends StatelessWidget {
  const CountButton({
    Key? key,
    required this.width,
    required this.height,
    required this.minusSize,
    required this.numberSize,
    required this.plusSize
  }) : super(key: key);
  final double width;
  final double height;
  final double minusSize;
  final double numberSize;
  final double plusSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Row(
        children: [
          Expanded(child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(10))
            ),
            child: Center(child: Text('ㅡ',style: TextStyle(fontWeight: FontWeight.bold,color: CustomColors.deepGrey,fontSize: minusSize))),
          )),
          Expanded(child: Container(
            decoration: const BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide()),
            ),
            child: Center(child: Text('1',style: TextStyle(fontWeight: FontWeight.bold,fontSize: numberSize),)),
          )),
          Expanded(child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.horizontal(right: Radius.circular(10))
            ),
            child: Center(child: Icon(Icons.add,color: CustomColors.deepGrey,size: plusSize,)),
          )),
        ],
      ),
    );
  }
}
