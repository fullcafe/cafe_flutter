import 'package:cafe_front/common/user_store.dart';
import 'package:cafe_front/models/complex_visit.dart';
import 'package:cafe_front/models/repository/visit_repo.dart';
import 'package:flutter/material.dart';

class MyFavorViewModel with ChangeNotifier {
  final VisitRepository _visitRepository = VisitRepository();
  List<ComplexVisit>? _mostRevisitCafeList;
  List<ComplexVisit>? get mostRevisitCafeList => _mostRevisitCafeList;

  MyFavorViewModel(){
    getMostRevisitCafeList();
  }

  getMostRevisitCafeList() async {
    _mostRevisitCafeList = await _visitRepository.findMostCountVisitByUser(UserStore.getInstance().user!.uid);
    notifyListeners();
  }

}
