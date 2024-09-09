import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Pretendard-Bold',
              color: Color(0xff261b08),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              '더보기',
              style: TextStyle(
                fontSize: 16,
                color: Colors.brown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
