import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:cafe_front/widgets/indicator/four_dots_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingLayout extends StatelessWidget {
  const OnBoardingLayout({
    Key? key,
    this.title = '',
    this.description = '',
    this.buttonName = '다음',
    this.onTap
  }) : super(key: key);
  final String title;
  final String description;
  final String buttonName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 2,child: Container(height: 30,color: Colors.red,)),
        Expanded(flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.none)),
              Text(description,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      decoration: TextDecoration.none))
            ],
            ),
        ),
        Expanded(
            child: FourDotsIndicator()
        ),
        Flexible(child: Align(alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: onTap,
              child: CustomButtonLayout(
                height: 50,
                width: double.infinity,
                borderColor: CustomColors.deepGrey,
                child: Center(
                  child: Text(buttonName,
                      style: const TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: CustomColors.deepGrey,decoration: TextDecoration.none)),
                ),
              ),
            ))),
      ],
    );
  }
}
