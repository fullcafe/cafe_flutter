import 'package:cafe_front/provider/stack_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../models/cafe.dart';


class CafeDetailViewModel with ChangeNotifier{
  final Cafe? cafe;
  final StackHandler _handler = StackHandler();
  CafeDetailViewModel(this.cafe);

  void navigator(BuildContext context, Widget child){
    _handler.navigator(context, ChangeNotifierProvider(
        create: (context) => this,
        child: child,
    ));
  }

  @override
  void dispose() {
    _handler.disposeView(super.dispose);
  }

}
/*
 가볼만한 곳 그냥 고정 값
 카페 메뉴
 */