import 'package:cafe_front/common/user_store.dart';
import 'package:cafe_front/models/dto/complex_visit_dto.dart';
import 'package:cafe_front/models/repository/visit_repo.dart';
import 'package:flutter/material.dart';

class MyPageViewModel with ChangeNotifier {
  final VisitRepository _visitRepository = VisitRepository();
  List<ComplexVisitDto>? _recentlyVisitCafeList;
  List<ComplexVisitDto>? get recentlyVisitCafeList => _recentlyVisitCafeList;

  MyPageViewModel(){
    getRecentlyVisitCafeList();
  }

  getRecentlyVisitCafeList() async {
    _recentlyVisitCafeList = await _visitRepository.findWriteReviewVisitByUser(UserStore.getInstance().user!.uid);
    notifyListeners();
  }


}