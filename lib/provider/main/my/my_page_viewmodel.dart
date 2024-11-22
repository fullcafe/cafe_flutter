import 'package:cafe_front/common/user_store.dart';
import 'package:cafe_front/models/complex_visit.dart';
import 'package:cafe_front/models/repository/visit_repo.dart';
import 'package:flutter/material.dart';

class MyPageViewModel with ChangeNotifier {
  final VisitRepository _visitRepository = VisitRepository();
  List<ComplexVisit>? _recentlyVisitCafeList;
  List<ComplexVisit>? get recentlyVisitCafeList => _recentlyVisitCafeList;

  MyPageViewModel(){
    getRecentlyVisitCafeList();
  }

  getRecentlyVisitCafeList() async {
    _recentlyVisitCafeList = await _visitRepository.findWriteReviewVisitByUser(UserStore.getInstance().user!.uid);
    notifyListeners();
  }


}