import 'package:cafe_front/views/login/after_login.dart';
import 'package:cafe_front/views/login/login_main.dart';
import 'package:flutter/material.dart';

final routes = <String, WidgetBuilder>{
  '/login': (BuildContext context) => const LoginMain(),
  '/login/after': (BuildContext context) => const AfterLogin(),
};