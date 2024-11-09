import 'package:flutter/material.dart';

Widget buildKeywordCloud() {
  return Container(
    width: double.infinity,
    height: 200,
    color: Colors.orange.withOpacity(0.1),
    child: Stack(
      children: [
        Positioned(left: 30, top: 10, child: _buildKeyword("샷이 필요해요", 1.0)),
        Positioned(right: 30, top: 20, child: _buildKeyword("책상은 클수록 좋다", 0.6)),
        Positioned(right: 60, top: 50, child: _buildKeyword("의자는 폭신해야해", 0.4)),
        Positioned(left: 30, top: 65, child: _buildKeyword("카페인과 디저트만 있으면 어디든 갈 수 있어", 1.0)),
        Positioned(right: 20, bottom: 50, child: _buildKeyword("카페는 카공을 위해 존재한다", 0.9)),
        Positioned(left: 80, bottom: 10, child: _buildKeyword("당 떨어지면 능률도 떨어진다", 0.4)),
      ],
    ),
  );
}

Widget _buildKeyword(String text, double opacity) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16,
      color: Colors.orange.withOpacity(opacity),
      fontWeight: FontWeight.bold,
    ),
  );
}
