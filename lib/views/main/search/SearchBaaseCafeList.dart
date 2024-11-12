import 'package:flutter/material.dart';
import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/models/cafe.dart';

class SearchBaseCafeList extends StatelessWidget {
  final Cafe cafe;

  const SearchBaseCafeList({Key? key, required this.cafe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 11, color: CustomColors.deepGrey);
    return Container(
      width: 300,
      margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
      decoration: BoxDecoration(
        color: const Color(0xfffbfbfa),
        border: Border.all(color: CustomColors.lightGrey),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/details/image0.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cafe.name,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      cafe.address ?? '주소 정보 없음',
                      style: textStyle,
                    ),
                    Text(
                      '예상평점 ★ ${3 ?? 0.0}    도보 15분',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(color: CustomColors.deepGrey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                '재방문 1회',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
