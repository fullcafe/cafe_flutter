import 'package:cafe_front/views/main/main_layout.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.index,
    this.parent
  }) : super(key: key);
  // 인덱스 reference
  final Index index;
  final State? parent;

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    var defaultLink = 'assets/icons/';
    var unselectedIconList = [
      '${defaultLink}home_unselected.png',
      '${defaultLink}search_unselected.png',
      '${defaultLink}community_unselected.png',
      '${defaultLink}my_unselected.png',
    ];
    var selectedIconList = [
      '${defaultLink}home_selected.png',
      '${defaultLink}search_selected.png',
      '${defaultLink}community_selected.png',
      '${defaultLink}my_selected.png',
    ];

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 60,
        color: CustomColors.lightGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (idx) =>
              GestureDetector(
                onTap: (){
                  setState(() {
                    widget.index.idx = idx;
                  });
                  // 부모 위젯 rebuild
                  widget.parent?.setState(() {});
                },
                child: SizedBox(width: 35,child: Image.asset(widget.index.idx == idx ? selectedIconList[idx] : unselectedIconList[idx])
                ),
              ),),
        ),
      ),
    );
  }
}
