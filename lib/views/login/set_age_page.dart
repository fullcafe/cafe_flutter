import 'package:cafe_front/provider/login/after_login_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetAgePage extends StatelessWidget {
  const SetAgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.watch<AfterLoginStore>();
    return Text(store.name);
  }
}
