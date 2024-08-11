import 'package:cafe_front/constants/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/login',
      routes: routes,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // 테스트용
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('data'),
    );
  }
}
