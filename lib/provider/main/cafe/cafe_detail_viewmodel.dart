import 'package:cafe_front/common/user_store.dart';
import 'package:cafe_front/models/repository/cafe_repo.dart';
import 'package:cafe_front/models/repository/visit_repo.dart';
import 'package:cafe_front/models/visit.dart';
import 'package:cafe_front/provider/stack_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../models/cafe.dart';


class CafeDetailViewModel with ChangeNotifier{
  final String cafeName;
  final StackHandler _handler = StackHandler();
  final CafeRepository _cafeRepository = CafeRepository();
  final VisitRepository _visitRepository = VisitRepository();
  Cafe? _cafe;
  Cafe? get cafe => _cafe;

  CafeDetailViewModel(this.cafeName){
    initCafe();
  }

  void initCafe() async {
    print(cafeName);
    _cafe = await _cafeRepository.getCafeByName(cafeName);
    notifyListeners();
  }

  void navigator(BuildContext context, Widget child){
    _handler.navigator(context, ChangeNotifierProvider(
        create: (context) => this,
        child: child,
    ));
  }

  Future<void> orderCreate() async {
    var visit = Visit(uid: UserStore.getInstance().user!.uid, cafeName: cafe!.name, count: 1, writeReview: true, recent: DateTime.now());
    await _visitRepository.createVisit(visit);
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