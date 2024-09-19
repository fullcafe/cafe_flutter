import 'package:cafe_front/provider/login/after_login_store.dart';
import 'package:cafe_front/views/login/after_login.dart';
import 'package:cafe_front/views/login/login_main.dart';
import 'package:cafe_front/views/main/cafe/cafe_detail_page.dart';
import 'package:cafe_front/views/main/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final routes = <String, WidgetBuilder>{
  '/login': (BuildContext context) => const LoginMain(),
  '/after': (BuildContext context) => ChangeNotifierProvider(
      create: (context) => AfterLoginStore(),
      child: const AfterLogin(),
  ),
  '/main' : (BuildContext context) => const MainLayout(),
  // 임시 루트
  '/cafe' : (BuildContext context) => const CafeDetailPage(),
};